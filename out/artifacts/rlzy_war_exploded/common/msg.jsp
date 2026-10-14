<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isELIgnored="false" %>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <style type="text/css">
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body {
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #eef2f7;
            font-family: "PingFang SC", "Microsoft YaHei", Arial, sans-serif;
        }
        .msg-card {
            background: #ffffff;
            padding: 34px 46px;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(29, 78, 216, .10);
            color: #303133;
            font-size: 15px;
            border-top: 3px solid #2563eb;
        }
    </style>
</head>
<body>
    <div class="msg-card">${requestScope.msg}</div>
</body>
</html>