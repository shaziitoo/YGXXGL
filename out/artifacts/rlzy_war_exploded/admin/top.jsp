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
        html, body { height: 100%; overflow: hidden; }
        body {
            font-family: "PingFang SC", "Microsoft YaHei", Arial, sans-serif;
            background: linear-gradient(90deg, #1e4fd6 0%, #2563eb 55%, #3b82f6 100%);
        }
        .topbar {
            display: flex;
            align-items: center;
            justify-content: space-between;
            height: 64px;
            padding: 0 22px;
        }
        .brand {
            display: flex;
            align-items: center;
            color: #ffffff;
            font-size: 19px;
            font-weight: 600;
            letter-spacing: 2px;
            white-space: nowrap;
        }
        .brand-badge {
            width: 34px;
            height: 34px;
            border-radius: 9px;
            background: rgba(255,255,255,.18);
            border: 1px solid rgba(255,255,255,.25);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: 700;
            letter-spacing: 0;
            margin-right: 12px;
        }
        .top-right {
            display: flex;
            align-items: center;
            color: rgba(255,255,255,.92);
            font-size: 14px;
            white-space: nowrap;
        }
        .welcome { margin-right: 18px; }
        #clock {
            margin-right: 18px;
            font-size: 13px;
            opacity: .9;
            font-variant-numeric: tabular-nums;
        }
        .logout {
            color: #ffffff;
            text-decoration: none;
            border: 1px solid rgba(255,255,255,.55);
            padding: 5px 16px;
            border-radius: 999px;
            font-size: 13px;
            transition: all .2s ease;
        }
        .logout:hover {
            background: #ffffff;
            color: #2563eb;
            text-decoration: none;
        }
    </style>
    <SCRIPT src="<%=path %>/js/Clock.js" type=text/javascript></SCRIPT>
    <script type="text/javascript">
        function out()
        {
            window.parent.location.href="<%=path %>/login.jsp";
        }
    </script>
</head>

<body>
    <div class="topbar">
        <div class="brand">
            <span class="brand-badge">HR</span>企业员工信息管理系统
        </div>
        <div class="top-right">
            <span class="welcome">
                <c:if test="${sessionScope.userType==0}">
                    欢迎您：系统管理员
                </c:if>
                <c:if test="${sessionScope.userType==1}">
                    欢迎您：${sessionScope.yuangong.name}
                </c:if>
            </span>
            <span id="clock"></span>
            <a href="#" onclick="out();return false;" class="logout">退出系统</a>
        </div>
    </div>
    <SCRIPT type=text/javascript>
        var clock = new Clock();clock.display(document.getElementById("clock"));
    </SCRIPT>
</body>
</html>