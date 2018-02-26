<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common/header.jsp"%>
  <body class=""> 
  <%@ include file="/WEB-INF/jsp/common/toper.jsp"%>
	<%@ include file="/WEB-INF/jsp/common/menu.jsp"%>

    
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
			 
<div class="well">
     
    <div id="myTabContent" class="tab-content">
      <div class="tab-pane active in" id="home">
    <form id="tab" action="${contextPath }/student/add_post" method="post">
        <label>姓名</label>
        <input type="text" name="name" value="" class="input-xlarge">
        <label>年龄</label>
        <input type="text" name="age" value="" class="input-xlarge">
        <label>手机</label>
        <input type="text" name="tel" value="" class="input-xlarge">
        <label>地址</label>
        <input type="text" name="address" value="" class="input-xlarge">
        <label>备注信息</label>
        <textarea name="content" value="" rows="3" class="input-xlarge"></textarea>
   		<label></label>
        <button type="submit" class="btn btn-primary"><i class="icon-save"></i>  提交</button>
    </form>
      </div>
  </div>
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
    </script>
    
  </body>
</html>
