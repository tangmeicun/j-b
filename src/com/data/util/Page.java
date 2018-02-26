package com.data.util;

import java.util.Date;
import java.util.List;

public class Page<T> {

	public static final int DEFAULT_PAGE_SIZE = 20;
	protected int pageNo = 1; // 当前页, 默认为第1页
	protected int pageSize = DEFAULT_PAGE_SIZE; // 每页记录数
	protected long totalRecord = -1; // 总记录数, 默认为-1, 表示需要查询
	protected int totalPage = -1; // 总页数, 默认为-1, 表示需要计算
	protected List<T> results; // 当前页记录List形式
	
	//分页查询条件
	private String query1;
	private String query2;
	private String query3;
	private String query4;
	private String query5;
	private String query6;
	private Date query7;
	private Date query8;

	public Date getQuery7(){
		return query7;
	}

	public void setQuery7(Date query7){
		this.query7 = query7;
	}

	public Date getQuery8(){
		return query8;
	}

	public void setQuery8(Date query8){
		this.query8 = query8;
	}

	public int getPageNo(){
		return pageNo;
	}

	public void setPageNo(int pageNo){
		this.pageNo = pageNo;
	}

	public int getPageSize(){
		return pageSize;
	}

	public void setPageSize(int pageSize){
		this.pageSize = pageSize;
		computeTotalPage();
	}

	public long getTotalRecord(){
		return totalRecord;
	}

	public int getTotalPage(){
		return totalPage;
	}

	public void setTotalRecord(long totalRecord){
		this.totalRecord = totalRecord;
		computeTotalPage();
	}

	protected void computeTotalPage(){
		if (getPageSize() > 0 && getTotalRecord() > -1){
			this.totalPage = (int) (getTotalRecord() % getPageSize() == 0 ? getTotalRecord() / getPageSize() : getTotalRecord() / getPageSize() + 1);
		}
	}

	public List<T> getResults(){
		return results;
	}

	public void setResults(List<T> results){
		this.results = results;
	}
	
	public String getQuery1() {
		return query1;
	}

	public void setQuery1(String query1){
		this.query1 = query1;
	}

	public String getQuery2(){
		return query2;
	}

	public void setQuery2(String query2){
		this.query2 = query2;
	}

	public String getQuery3() {
		return query3;
	}

	public void setQuery3(String query3){
		this.query3 = query3;
	}

	public String getQuery4(){
		return query4;
	}

	public void setQuery4(String query4){
		this.query4 = query4;
	}

	public String getQuery5() {
		return query5;
	}

	public void setQuery5(String query5){
		this.query5 = query5;
	}

	public String getQuery6(){
		return query6;
	}

	public void setQuery6(String query6){
		this.query6 = query6;
	}

	@Override
	public String toString(){
		StringBuilder builder = new StringBuilder().append("Page [pageNo=").append(pageNo).append(", pageSize=").append(pageSize)
				.append(", totalRecord=").append(totalRecord < 0 ? "null" : totalRecord).append(", totalPage=")
				.append(totalPage < 0 ? "null" : totalPage).append(", curPageObjects=").append(results == null ? "null" : results.size()).append("]");
		return builder.toString();
	}

}
