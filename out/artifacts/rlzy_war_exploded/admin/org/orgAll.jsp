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
	    <base target="_self">
		<meta charset="UTF-8">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/theme.css" />

		<style type="text/css">
			.org-card {
				background: #ffffff;
				border-radius: 12px;
				box-shadow: 0 2px 10px rgba(29, 78, 216, 0.08);
				padding: 16px 18px 18px;
			}
			.org-card-title {
				font-size: 14px;
				font-weight: 600;
				color: #1e293b;
				border-bottom: 1px solid #eef1f6;
				padding-bottom: 10px;
				margin-bottom: 12px;
			}
			.org-btns { display: flex; flex-direction: column; gap: 2px; }
			.org-group .org-group {
				margin-left: 18px;
				padding-left: 10px;
				border-left: 2px solid #e8eefb;
			}
			.org-btn {
				display: inline-block;
				padding: 6px 16px;
				margin: 3px 4px 3px 0;
				background: #ffffff;
				border: 1px solid #d6dce5;
				border-radius: 999px;
				color: #303133;
				font-size: 13px;
				cursor: pointer;
				transition: all .15s ease;
				user-select: none;
			}
			.org-btn:hover {
				color: #2563eb;
				border-color: #2563eb;
				background: #eaf1ff;
			}
			.org-btn.lvl0 {
				background: #eef4ff;
				border-color: #c4d7fb;
				color: #1e4fd6;
				font-weight: 600;
			}
			.org-btn.selected {
				background: #2563eb;
				border-color: #2563eb;
				color: #ffffff;
			}
		</style>

		<script type="text/javascript">
		    var nodeId1 = "";

		    // 部门数据（由服务端渲染）
		    var orgData = [];
			<c:forEach items="${requestScope.orgList}" var="org">
	            orgData.push({ id: ${org.id}, pid: ${org.p_id}, name: '${org.name}' });
	        </c:forEach>

		    function onClickTreeNode(nodeId)
		    {
		         nodeId1 = nodeId;
		         var btns = document.querySelectorAll('.org-btn');
		         for (var i = 0; i < btns.length; i++) { btns[i].classList.remove('selected'); }
		         var btn = document.getElementById('orgbtn' + nodeId);
		         if (btn) { btn.classList.add('selected'); }
		    }

		    function renderOrgButtons()
		    {
		        var box = document.getElementById('orgBtns');
		        box.innerHTML = '';
		        for (var i = 0; i < orgData.length; i++) {
		            if (orgData[i].pid == 0) { box.appendChild(buildGroup(orgData[i])); }
		        }
		    }

		    function buildGroup(org)
		    {
		        var div = document.createElement('div');
		        div.className = 'org-group';
		        var btn = document.createElement('a');
		        btn.id = 'orgbtn' + org.id;
		        btn.className = 'org-btn' + (org.pid == 0 ? ' lvl0' : '');
		        btn.href = 'javascript:void(0)';
		        btn.onclick = function() { onClickTreeNode(org.id); };
		        btn.innerHTML = org.name;
		        div.appendChild(btn);
		        for (var i = 0; i < orgData.length; i++) {
		            if (orgData[i].pid == org.id) { div.appendChild(buildGroup(orgData[i])); }
		        }
		        return div;
		    }

		    function queding()
            {
                 if(nodeId1=="")
                 {
                    alert("请单击选择部门");
                    return false;
                 }
                 var name = "";
                 var btn = document.getElementById('orgbtn' + nodeId1);
                 if (btn) { name = btn.innerHTML; }
                 window.opener.window.returnVaule = nodeId1;
                 if (window.opener && window.opener.onOrgSelected) {
                     window.opener.onOrgSelected(nodeId1, name);
                 }
		         window.close();
            }
		</script>
	</head>

	<BODY>
		<div class="org-card">
			<div class="org-card-title">部门组织结构</div>
			<div id="orgBtns" class="org-btns"></div>
		</div>
		<div style="margin-top: 14px;">
			<input type="button" value="确定" style="width: 80px;" onclick="queding()">
		</div>

		<SCRIPT type="text/javascript">
			renderOrgButtons();
		</SCRIPT>
	</body>
</html>