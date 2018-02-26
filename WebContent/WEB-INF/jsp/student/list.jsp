<%@page import="org.springframework.context.annotation.Import"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
  <body class=""> 
	<%@ include file="/WEB-INF/jsp/common/toper.jsp"%>
	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%>
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  

    <div class="content">
		<div class="header">
	        <h1 class="page-title">信息管理</h1>
	    </div>
	    <ul class="breadcrumb">
	        <li><a href="/">首页</a> <span class="divider">/</span></li>
	        <li class="active">学生信息管理</li>
	    </ul>

        <div class="container-fluid">
            <div class="row-fluid">
			<div class="btn-toolbar">
				<a class="btn btn-primary" href="${contextPath}/student/add" role="button"><i class="icon-plus"></i>新增</a>
			</div>
			<div class="well">
			    <table class="table">
			      <thead>
			        <tr>
			          <th>ID</th>
			          <th>姓名</th>
			          <th>年龄</th>
			          <th>Tel</th>
			          <th>地址</th>
			          <th>备注</th>
			          <th>日期</th>
			          <th>操作</th>
			          <th style="width: 26px;"></th>
			        </tr>
			      </thead>
			      <tbody>
					<c:forEach items="${page.results}" var="val">
			          <tr>
			          	<td>${val.id}</td>
			            <td>${val.name}</td>
			            <td>${val.age}</td>
			            <td>${val.tel}</td>
			            <td>${val.address}</td>
			            <td>${val.content}</td>
			            <td>${val.changeTime}</td>
			            <td>
			              <a href="${contextPath}/student/edit?id=${val.id}" title="编辑"><i class="icon-pencil"></i></a>  |  
			              <a href="${contextPath}/student/delete?id=${val.id}" title="删除" role="button" data-toggle="modal" onClick="return confirm('确定删除?');"><i class="icon-remove"></i></a>
			            </td>
			            
			        </tr>  
			      </c:forEach>
			      </tbody>
			    </table>
			</div>
			
			<div class="pagination">
			    <ul>
			    <c:choose>
					<c:when test="${page.pageNo == 1}">
						<li class="previous disabled"><a href="#">&laquo;</a></li>
						<li class="previous disabled"><a href="#">上一页</a></li>
						<c:if test="${page.totalPage != 1 }">
							<li><a
								href="${contextPath}/student/list?pageNo=${page.pageNo+1}&id=${page.query1}&name=${page.query2}">下一页
							</a></li>
							<li><a
								href="${contextPath}/student/list?pageNo=${page.totalPage}&id=${page.query1}&name=${page.query2}">&raquo;</a></li>
						</c:if>
						<c:if test="${page.totalPage==1}">
							<li class="previous disabled"><a href="#">下一页</a></li>
							<li class="previous disabled"><a href="#">&raquo;</a></li>
						</c:if>
					</c:when>
					<c:when test="${page.pageNo == page.totalPage }">
						<li><a href="${contextPath}/student/list?pageNo=1&gameId=${page.query1}&gameName=${page.query2}">&laquo;</a></li>
						<li><a href="${contextPath}/student/list?pageNo=${page.pageNo-1}&gameId=${page.query1}&gameName=${page.query2}">上一页</a></li>
						<li class="previous disabled"><a href="#">下一页</a></li>
						<li class="previous disabled"><a href="#">&raquo;</a></li>
					</c:when>
					<c:otherwise>
						<li><a
							href="${contextPath}/student/list?pageNo=1&gameId=${page.query1}&gameName=${page.query2}">&laquo;</a></li>
						<li><a
							href="${contextPath}/student/list?pageNo=${page.pageNo-1}&gameId=${page.query1}&gameName=${page.query2}">上一页</a></li>
						<li><a
							href="${contextPath}/student/list?pageNo=${page.pageNo+1}&gameId=${page.query1}&gameName=${page.query2}">下一页
						</a></li>
						<li><a
							href="${contextPath}/student/list?pageNo=${page.totalPage}&gameId=${page.query1}&gameName=${page.query2}">&raquo;</a></li>
					</c:otherwise>
				</c:choose>
			    </ul>
			</div>

			<%@ include file="/WEB-INF/jsp/common/bottom.jsp"%>
                    
            </div>
        </div>
    </div>
   
    <script src="<%=basePath%>source/backend/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $("[rel=tooltip]").tooltip();
        $(function() {
            $('.demo-cancel-click').click(function(){return false;});
        });
        
        //获取所有学生信息
       <!--$.ajax({
            url: '<%=basePath%>/student/ajax_getall',
            type: 'POST',
            data: {},
            dataType:'json',
            success: function(rs){
                if(rs.status == '1001'){
                    alert(rs.msg);
                }else {
                    alert(rs.msg);
                }
            },
        }); --> 
    </script>
    
  </body>
</html>


