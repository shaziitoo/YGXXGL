<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background: #eef2f7;
            font-family: "PingFang SC", "Microsoft YaHei", Arial, sans-serif;
            color: #303133;
        }
        .spinner {
            width: 38px;
            height: 38px;
            border: 3px solid #d7e3fb;
            border-top-color: #2563eb;
            border-radius: 50%;
            animation: spin .8s linear infinite;
            margin-bottom: 16px;
        }
        @keyframes spin { to { transform: rotate(360deg); } }
        p { font-size: 14px; color: #64748b; letter-spacing: 1px; }
    </style>
</head>
<body>
    <div class="spinner"></div>
    <p>登录成功，页面跳转中…</p>
    <script type="text/javascript">
        function tiao()
        {
            window.location.href="<%=path %>/admin/index.jsp";
        }
        setTimeout(tiao,1300)
    </script>
</body>
</html>