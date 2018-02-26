<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="sidebar-nav">
    <!-- <form class="search form-inline">
        <input type="text" placeholder="Search...">
    </form>   -->

    <a href="#dashboard-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>Dashboard</a>
    
    <ul id="dashboard-menu" class="nav nav-list collapse in">
        <li><a href="index.html">Home</a></li>
        <li class="active"><a href="users.html">Sample List</a></li>
        <li ><a href="user.html">Sample Item</a></li>
        <li ><a href="media.html">Media</a></li>
        <li ><a href="calendar.html">Calendar</a></li>
    </ul>

    <a href="#accounts-menu" class="nav-header" data-toggle="collapse"><i class="icon-briefcase"></i>Account<span class="label label-info">+3</span></a>
    <ul id="accounts-menu" class="nav nav-list collapse">
        <li ><a href="sign-in.html">Sign In</a></li>
        <li ><a href="sign-up.html">Sign Up</a></li>
        <li ><a href="reset-password.html">Reset Password</a></li>
    </ul>

    <a href="#error-menu" class="nav-header collapsed" data-toggle="collapse"><i class="icon-exclamation-sign"></i>Error Pages <i class="icon-chevron-up"></i></a>
    <ul id="error-menu" class="nav nav-list collapse">
        <li ><a href="403.html">403   page</a></li>
        <li ><a href="404.html">404 page</a></li>
        <li ><a href="500.html">500 page</a></li>
        <li ><a href="503.html">503 page</a></li>
    </ul>

    <a href="#legal-menu" class="nav-header" data-toggle="collapse"><i class="icon-legal"></i>Legal</a>
    <ul id="legal-menu" class="nav nav-list collapse">
        <li ><a href="privacy-policy.html">Privacy Policy</a></li>
        <li ><a href="terms-and-conditions.html">Terms and Conditions</a></li>
    </ul>

    <a href="help.html" class="nav-header" ><i class="icon-question-sign"></i>Help</a>
    <a href="faq.html" class="nav-header" ><i class="icon-comment"></i>Faq</a>
    
    <a href="#student-menu" class="nav-header" data-toggle="collapse"><i class="icon-dashboard"></i>学生信息管理</a>
    <ul id="student-menu" class="nav nav-list collapse">
        <li ><a href="${contextPath}/student/list">列表管理</a></li>
        <li ><a href="user.html">新增信息</a></li>
    </ul>
    
</div>