<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
response.sendError(404);
%>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <title>404</title>
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/reseting.css" />
    <link rel="stylesheet" type="text/css" href="${g.domain}/resource/css/app-common.css" />
    <style>
        .error-center{
            background: url(${g.domain}/resource/images/error/404.png) no-repeat;
            width: 540px;
            height: 500px;
            position: absolute;
            left: 50%;
            top: 50%;
            transform: translate(-50%,-60%);
            text-align: center;
        }
        .error-center a {
            display: inline-block;
            width: 116px;
            height: 34px;
            line-height: 34px;
            font-size: 18px;
            color: #FFFFFF;
            background: #41BE57;
            margin-top: 415px;
        }
        .error-center a:hover{
            background: #03c725;
        }
    </style>
</head>

<body>
    <div class="error-center">
        <a href="/">返回首页</a>
    </div>
</div>

 </body>
</html>
