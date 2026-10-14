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
        html, body { height: 100%; }
        body {
            background: #ffffff;
            border-right: 1px solid #e8ecf3;
            font-family: "PingFang SC", "Microsoft YaHei", Arial, sans-serif;
        }
        .menu-header {
            padding: 20px 20px 12px;
            font-size: 13px;
            font-weight: 600;
            color: #94a3b8;
            letter-spacing: 2px;
        }
        .menu-list { padding: 0 12px 24px; }
        a.menu-item {
            display: block;
            padding: 10px 14px;
            margin: 2px 0;
            border-radius: 8px;
            color: #3f4a5c;
            font-size: 14px;
            text-decoration: none;
            transition: all .15s ease;
        }
        a.menu-item:hover {
            color: #2563eb;
            background: #eaf1ff;
            text-decoration: none;
        }
        a.menu-item.active {
            background: #2563eb;
            color: #ffffff;
        }
    </style>
</head>

<body>
    <div class="menu-header">系统菜单</div>
    <div class="menu-list">
        <c:if test="${sessionScope.userType==0}">
            <a class="menu-item" href="<%=path %>/admin/userinfo/userPw.jsp" target="mainFrame">密码修改</a>
            <a class="menu-item" href="<%=path %>/org?type=orgMana" target="mainFrame">部门管理</a>
            <a class="menu-item" href="<%=path %>/yuangong?type=yuangongMana" target="mainFrame">员工管理</a>
            <a class="menu-item" href="<%=path %>/admin/yuangong/yuangongAdd.jsp" target="mainFrame">员工录入</a>
            <a class="menu-item" href="<%=path %>/chuqin?type=chuqinMana" target="mainFrame">出勤管理</a>
            <a class="menu-item" href="<%=path %>/admin/chuqin/chuqinAdd.jsp" target="mainFrame">出勤录入</a>
            <a class="menu-item" href="<%=path %>/gongzi?type=gongziMana" target="mainFrame">工资管理</a>
            <a class="menu-item" href="<%=path %>/admin/gongzi/gongziAdd.jsp" target="mainFrame">工资录入</a>
            <a class="menu-item" href="<%=path %>/qingjiashenqing?type=qingjiashenqingMana" target="mainFrame">请假审核</a>
        </c:if>
        <c:if test="${sessionScope.userType==1}">
            <a class="menu-item" href="<%=path %>/admin/userinfo/userPw_yuangong.jsp" target="mainFrame">密码修改</a>
            <a class="menu-item" href="<%=path %>/qingjiashenqing?type=qingjiashenqingMana_me" target="mainFrame">我的请假</a>
            <a class="menu-item" href="<%=path %>/admin/qingjiashenqing/qingjiashenqingAdd.jsp" target="mainFrame">请假申请</a>
            <a class="menu-item" href="<%=path %>/gongzi?type=gongziMana_me" target="mainFrame">我的工资</a>
        </c:if>
    </div>

    <script type="text/javascript">
        // 点击菜单项时高亮当前项
        var menuItems = document.querySelectorAll('a.menu-item');
        for (var i = 0; i < menuItems.length; i++) {
            menuItems[i].addEventListener('click', function() {
                for (var j = 0; j < menuItems.length; j++) { menuItems[j].classList.remove('active'); }
                this.classList.add('active');
            });
        }
    </script>
</body>
</html>