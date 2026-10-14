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

		<link rel="stylesheet" type="text/css" href="<%=path %>/css/base.css" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/css/theme.css" />
		<script language="JavaScript" src="<%=path %>/js/public.js" type="text/javascript"></script>

		<style type="text/css">
			/* 部门卡片 */
			.org-card {
				background: #ffffff;
				border-radius: 12px;
				box-shadow: 0 2px 10px rgba(29, 78, 216, 0.08);
				padding: 20px 24px 24px;
			}
			.org-card-title {
				display: flex;
				justify-content: space-between;
				align-items: center;
				font-size: 15px;
				font-weight: 600;
				color: #1e293b;
				border-bottom: 1px solid #eef1f6;
				padding-bottom: 12px;
				margin-bottom: 18px;
			}
			.org-tip {
				font-size: 12px;
				color: #94a3b8;
				font-weight: 400;
			}
			/* 按钮布局容器（层级用缩进 + 左侧淡蓝竖线表达） */
			.org-btns { display: flex; flex-direction: column; gap: 2px; }
			.org-group .org-group {
				margin-left: 24px;
				padding-left: 12px;
				border-left: 2px solid #e8eefb;
			}
			/* 部门按钮 */
			.org-btn {
				display: inline-block;
				padding: 8px 20px;
				margin: 4px 6px 4px 0;
				background: #ffffff;
				border: 1px solid #d6dce5;
				border-radius: 999px;
				color: #303133;
				font-size: 14px;
				cursor: pointer;
				transition: all .15s ease;
				user-select: none;
			}
			.org-btn:hover {
				color: #2563eb;
				border-color: #2563eb;
				background: #eaf1ff;
			}
			/* 顶级部门：强调样式 */
			.org-btn.lvl0 {
				background: #eef4ff;
				border-color: #c4d7fb;
				color: #1e4fd6;
				font-weight: 600;
			}
			/* 当前选中：实心蓝 */
			.org-btn.selected {
				background: #2563eb;
				border-color: #2563eb;
				color: #ffffff;
			}
			.org-toolbar { margin-top: 16px; }
		</style>

		<script type="text/javascript">
		    var orgId = null;

		    // 部门数据（由服务端渲染）
		    var orgData = [];
			<c:forEach items="${requestScope.orgList}" var="org">
	            orgData.push({ id: ${org.id}, pid: ${org.p_id}, name: '${org.name}' });
	        </c:forEach>

		    function onClickTreeNode(nodeId)
		    {
		        orgId = nodeId;
		        var btns = document.querySelectorAll('.org-btn');
		        for (var i = 0; i < btns.length; i++) { btns[i].classList.remove('selected'); }
		        var btn = document.getElementById('orgbtn' + nodeId);
		        if (btn) { btn.classList.add('selected'); }
		    }

		    // 渲染按钮布局：顶级部门为分组标题按钮，下级逐级缩进
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
		        div.appendChild(makeBtn(org, org.pid == 0));
		        for (var i = 0; i < orgData.length; i++) {
		            if (orgData[i].pid == org.id) { div.appendChild(buildGroup(orgData[i])); }
		        }
		        return div;
		    }

		    function makeBtn(org, isTop)
		    {
		        var btn = document.createElement('a');
		        btn.id = 'orgbtn' + org.id;
		        btn.className = 'org-btn' + (isTop ? ' lvl0' : '');
		        btn.href = 'javascript:void(0)';
		        btn.onclick = function() { onClickTreeNode(org.id); };
		        btn.innerHTML = org.name;
		        return btn;
		    }

		    function addDingJiOrg()
		    {
				 var url="<%=path %>/admin/org/addOrg.jsp?orgId="+0;
                 var n="";
                 var w="400px";
                 var h="300px";
                 var s="resizable:no;help:no;status:no;scroll:yes";
				 openWin(url,n,w,h,s);
		    }

		    function addXiaJiOrg()
		    {
				if(orgId==null)
				{
				     alert("请选择部门");
				}
				else
				{
				     var url="<%=path %>/admin/org/addOrg.jsp?orgId="+orgId;
	                 var n="";
	                 var w="400px";
	                 var h="300px";
	                 var s="resizable:no;help:no;status:no;scroll:yes";
					 openWin(url,n,w,h,s);
				}
		    }

		    function delOrg()
		    {
				if(orgId==null)
				{
				     alert("请选择部门");
				}
				else
				{
				     var s="<%=path %>/org?type=orgDel&orgId="+orgId;
				     window.location.href=s;
				}
		    }

		    function fresh()
		    {
		        window.location.reload();
		    }
		</script>
	</head>

	<BODY>
		<div class="org-card">
			<div class="org-card-title">
				<span>部门组织架构</span>
				<span class="org-tip">单击选择部门后，可进行添加 / 删除操作</span>
			</div>
			<div id="orgBtns" class="org-btns"></div>
		</div>
		<div class="org-toolbar">
			<input type="button" value="添加部门" onclick="addDingJiOrg()">
			<input type="button" value="添加子部门" onclick="addXiaJiOrg()">
			<input type="button" value="删除部门" onclick="delOrg()">
			<input type="button" value="刷新页面" onclick="fresh()">
		</div>
		<SCRIPT type="text/javascript">
		renderOrgButtons();
	</SCRIPT>
</body>
</html>