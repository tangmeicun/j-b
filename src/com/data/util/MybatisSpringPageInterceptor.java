package com.data.util;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import org.apache.ibatis.executor.Executor;
import org.apache.ibatis.executor.parameter.ParameterHandler;
import org.apache.ibatis.executor.statement.RoutingStatementHandler;
import org.apache.ibatis.executor.statement.StatementHandler;
import org.apache.ibatis.mapping.BoundSql;
import org.apache.ibatis.mapping.MappedStatement;
import org.apache.ibatis.mapping.ParameterMapping;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.plugin.Intercepts;
import org.apache.ibatis.plugin.Invocation;
import org.apache.ibatis.plugin.Plugin;
import org.apache.ibatis.plugin.Signature;
import org.apache.ibatis.scripting.defaults.DefaultParameterHandler;
import org.apache.ibatis.session.ResultHandler;
import org.apache.ibatis.session.RowBounds;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Intercepts({ @Signature(method = "prepare", type = StatementHandler.class, args = { Connection.class }),
		@Signature(method = "query", type = Executor.class, args = { MappedStatement.class, Object.class, RowBounds.class, ResultHandler.class }) })
public class MybatisSpringPageInterceptor implements Interceptor {
	private static final Logger log = LoggerFactory.getLogger(MybatisSpringPageInterceptor.class);

	public static final String MYSQL = "mysql";
	public static final String ORACLE = "oracle";

	protected String databaseType;// ���ݿ����ͣ���ͬ�����ݿ��в�ͬ�ķ�ҳ����

	protected ThreadLocal<Page> pageThreadLocal = new ThreadLocal<Page>();

	public String getDatabaseType() {
		return databaseType;
	}

	public void setDatabaseType(String databaseType) {
		if (!databaseType.equalsIgnoreCase(MYSQL) && !databaseType.equalsIgnoreCase(ORACLE)) {
			throw new PageNotSupportException("Page not support for the type of database, database type [" + databaseType + "]");
		}
		this.databaseType = databaseType;
	}

	@Override
	public Object plugin(Object target) {
		return Plugin.wrap(target, this);
	}

	@Override
	public void setProperties(Properties properties) {
		String databaseType = properties.getProperty("databaseType");
		if (databaseType != null) {
			setDatabaseType(databaseType);
		}
	}

	@Override
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Object intercept(Invocation invocation) throws Throwable {
		if (invocation.getTarget() instanceof StatementHandler) { // ����SQL�Ͳ�ѯ�����ĵط�
			Page page = pageThreadLocal.get();
			if (page == null) { //���Ƿ�ҳ��ѯ
				return invocation.proceed();
			}

			RoutingStatementHandler handler = (RoutingStatementHandler) invocation.getTarget();
			StatementHandler delegate = (StatementHandler) ReflectUtil.getFieldValue(handler, "delegate");
			BoundSql boundSql = delegate.getBoundSql();
			
			Connection connection = (Connection) invocation.getArgs()[0];
			prepareAndCheckDatabaseType(connection); // ׼�����ݿ�����

			if (page.getTotalPage() > -1) {
				if (log.isTraceEnabled()) {
					log.trace("�Ѿ���������ҳ��, ����Ҫ�ٲ�ѯ����.");
				}
			} else {
				Object parameterObj = boundSql.getParameterObject();
				MappedStatement mappedStatement = (MappedStatement) ReflectUtil.getFieldValue(delegate, "mappedStatement");
				queryTotalRecord(page, parameterObj, mappedStatement, connection);
			}

			String sql = boundSql.getSql();
			String pageSql = buildPageSql(page, sql);
			if (log.isDebugEnabled()) {
				log.debug("��ҳʱ, ���ɷ�ҳpageSql: " + pageSql);
			}
			ReflectUtil.setFieldValue(boundSql, "sql", pageSql);

			return invocation.proceed();
		} else { // ��ѯ����ĵط�
			// ��ȡ�Ƿ��з�ҳPage����
			Page<?> page = findPageObject(invocation.getArgs()[1]);
			if (page == null) {
				if (log.isTraceEnabled()) {
					log.trace("û��Page������Ϊ����, ���Ƿ�ҳ��ѯ.");
				}
				return invocation.proceed();
			} else {
				if (log.isTraceEnabled()) {
					log.trace("��⵽��ҳPage����, ʹ�÷�ҳ��ѯ.");
				}
			}
			//����������parameterObj
			invocation.getArgs()[1] = extractRealParameterObject(invocation.getArgs()[1]);

			pageThreadLocal.set(page);
			try {
				Object resultObj = invocation.proceed(); // Executor.query(..)
				if (resultObj instanceof List) {
					/* @SuppressWarnings({ "unchecked", "rawtypes" }) */
					page.setResults((List) resultObj);
				}
				return resultObj;
			} finally {
				pageThreadLocal.remove();
			}
		}
	}

	protected Page<?> findPageObject(Object parameterObj) {
		if (parameterObj instanceof Page<?>) {
			return (Page<?>) parameterObj;
		} else if (parameterObj instanceof Map) {
			for (Object val : ((Map<?, ?>) parameterObj).values()) {
				if (val instanceof Page<?>) {
					return (Page<?>) val;
				}
			}
		}
		return null;
	}

	/**
	 * <pre>
	 * �������Ĳ��������������
	 * Spring���Զ���װ�Ը���������ΪMap<String, Object>����
	 * ����ͨ��@Paramָ��keyֵ�������ǲ���������ΪXML�ļ���Ҫ��KEYֵ
	 * ������û��@Paramָ��ʱ��Spring��ʹ��0,1��Ϊ����
	 * ����û��@Paramָ�����ƵĲ���,һ��XML�ļ���ֱ�Ӷ������Ĳ������������
	 * ��ʱ�����������Ĳ�����Ϊ������
	 * </pre>
	 * @author jundong.xu_C
	 * @param parameterObj
	 * @return
	 */
	protected Object extractRealParameterObject(Object parameterObj) {
		if (parameterObj instanceof Map<?, ?>) {
			Map<?, ?> parameterMap = (Map<?, ?>) parameterObj;
			if (parameterMap.size() == 2) {
				boolean springMapWithNoParamName = true;
				for (Object key : parameterMap.keySet()) {
					if (!(key instanceof String)) {
						springMapWithNoParamName = false;
						break;
					}
					String keyStr = (String) key;
					if (!"0".equals(keyStr) && !"1".equals(keyStr)) {
						springMapWithNoParamName = false;
						break;
					}
				}
				if (springMapWithNoParamName) {
					for (Object value : parameterMap.values()) {
						if (!(value instanceof Page<?>)) {
							return value;
						}
					}
				}
			}
		}
		return parameterObj;
	}

	protected void prepareAndCheckDatabaseType(Connection connection) throws SQLException {
		if (databaseType == null) {
			String productName = connection.getMetaData().getDatabaseProductName();
			if (log.isTraceEnabled()) {
				log.trace("Database productName: " + productName);
			}
			productName = productName.toLowerCase();
			if (productName.indexOf(MYSQL) != -1) {
				databaseType = MYSQL;
			} else if (productName.indexOf(ORACLE) != -1) {
				databaseType = ORACLE;
			} else {
				throw new PageNotSupportException("Page not support for the type of database, database product name [" + productName + "]");
			}
			if (log.isInfoEnabled()) {
				log.info("数据库类型: " + databaseType);
			}
		}
	}

	/**
	 * <pre>
	 * ���ɷ�ҳSQL
	 * </pre>
	 * 
	 * @author jundong.xu_C
	 * @param page
	 * @param sql
	 * @return
	 */
	protected String buildPageSql(Page<?> page, String sql) {
		if (MYSQL.equalsIgnoreCase(databaseType)) {
			return buildMysqlPageSql(page, sql);
		} else if (ORACLE.equalsIgnoreCase(databaseType)) {
			return buildOraclePageSql(page, sql);
		}
		return sql;
	}

	/**
	 * <pre>
	 * ����Mysql��ҳ��ѯSQL
	 * </pre>
	 * 
	 * @author jundong.xu_C
	 * @param page
	 * @param sql
	 * @return
	 */
	protected String buildMysqlPageSql(Page<?> page, String sql) {
		// �����һ����¼��λ�ã�Mysql�м�¼��λ���Ǵ�0��ʼ�ġ�
		int offset = (page.getPageNo() - 1) * page.getPageSize();
		return new StringBuilder(sql).append(" limit ").append(offset).append(",").append(page.getPageSize()).toString();
	}

	/**
	 * <pre>
	 * ����Oracle��ҳ��ѯSQL
	 * </pre>
	 * 
	 * @author jundong.xu_C
	 * @param page
	 * @param sql
	 * @return
	 */
	protected String buildOraclePageSql(Page<?> page, String sql) {
		// �����һ����¼��λ�ã�Oracle��ҳ��ͨ��rownum���еģ���rownum�Ǵ�1��ʼ��
		int offset = (page.getPageNo() - 1) * page.getPageSize() + 1;
		StringBuilder sb = new StringBuilder(sql);
		sb.insert(0, "select u.*, rownum r from (").append(") u where rownum < ").append(offset + page.getPageSize());
		sb.insert(0, "select * from (").append(") where r >= ").append(offset);
		return sb.toString();
	}

	/**
	 * <pre>
	 * ��ѯ����
	 * </pre>
	 * 
	 * @author jundong.xu_C
	 * @param page
	 * @param parameterObject
	 * @param mappedStatement
	 * @param connection
	 * @throws SQLException
	 */
	protected void queryTotalRecord(Page<?> page, Object parameterObject, MappedStatement mappedStatement, Connection connection) throws SQLException {
		BoundSql boundSql = mappedStatement.getBoundSql(page);
		String sql = boundSql.getSql();
		String countSql = this.buildCountSql(sql);
		if (log.isDebugEnabled()) {
			log.debug("��ҳʱ, ����countSql: " + countSql);
		}

		List<ParameterMapping> parameterMappings = boundSql.getParameterMappings();
		BoundSql countBoundSql = new BoundSql(mappedStatement.getConfiguration(), countSql, parameterMappings, parameterObject);
		ParameterHandler parameterHandler = new DefaultParameterHandler(mappedStatement, parameterObject, countBoundSql);
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = connection.prepareStatement(countSql);
			parameterHandler.setParameters(pstmt);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				long totalRecord = rs.getLong(1);
				page.setTotalRecord(totalRecord);
			}
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (Exception e) {
					if (log.isWarnEnabled()) {
						log.warn("�ر�ResultSetʱ�쳣.", e);
					}
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (Exception e) {
					if (log.isWarnEnabled()) {
						log.warn("�ر�PreparedStatementʱ�쳣.", e);
					}
				}
		}
	}

	/**
	 * ����ԭSql����ȡ��Ӧ�Ĳ�ѯ�ܼ�¼����Sql���
	 * 
	 * @param sql
	 * @return
	 */
	protected String buildCountSql(String sql) {
		int index = sql.indexOf("from");
		return "select count(*) " + sql.substring(index);
	}

	/**
	 * ���÷�����в�����һ��������
	 * 
	 */
	private static class ReflectUtil {
		/**
		 * ���÷����ȡָ�������ָ������
		 * 
		 * @param obj Ŀ�����
		 * @param fieldName Ŀ������
		 * @return Ŀ�����Ե�ֵ
		 */
		public static Object getFieldValue(Object obj, String fieldName) {
			Object result = null;
			Field field = ReflectUtil.getField(obj, fieldName);
			if (field != null) {
				field.setAccessible(true);
				try {
					result = field.get(obj);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return result;
		}

		/**
		 * ���÷����ȡָ�����������ָ������
		 * 
		 * @param obj Ŀ�����
		 * @param fieldName Ŀ������
		 * @return Ŀ���ֶ�
		 */
		private static Field getField(Object obj, String fieldName) {
			Field field = null;
			for (Class<?> clazz = obj.getClass(); clazz != Object.class; clazz = clazz.getSuperclass()) {
				try {
					field = clazz.getDeclaredField(fieldName);
					break;
				} catch (NoSuchFieldException e) {
					// ���ﲻ������������û�и��ֶο��ܶ�Ӧ�ĸ����У���û�оͷ���null��
				}
			}
			return field;
		}

		/**
		 * ���÷�������ָ�������ָ������Ϊָ����ֵ
		 * 
		 * @param obj Ŀ�����
		 * @param fieldName Ŀ������
		 * @param fieldValue Ŀ��ֵ
		 */
		public static void setFieldValue(Object obj, String fieldName, String fieldValue) {
			Field field = ReflectUtil.getField(obj, fieldName);
			if (field != null) {
				try {
					field.setAccessible(true);
					field.set(obj, fieldValue);
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
	}

	public static class PageNotSupportException extends RuntimeException {

		public PageNotSupportException() {
			super();
		}

		public PageNotSupportException(String message, Throwable cause) {
			super(message, cause);
		}

		public PageNotSupportException(String message) {
			super(message);
		}

		public PageNotSupportException(Throwable cause) {
			super(cause);
		}
	}

}