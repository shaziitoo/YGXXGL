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

		<script type='text/javascript' src='<%=path %>/dwr/util.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
        <script type='text/javascript' src='<%=path %>/dwr/interface/dwrService.js'> </script>

		<style type="text/css">
			.org-panel-title {
				font-size: 14px;
				font-weight: 600;
				color: #1e293b;
				margin-bottom: 10px;
			}
			.org-btns { display: flex; flex-direction: column; gap: 2px; }
			.org-group .org-group {
				margin-left: 14px;
				padding-left: 8px;
				border-left: 2px solid #e8eefb;
			}
			.org-btn {
				display: inline-block;
				padding: 5px 14px;
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
			.emp-panel-title { font-size: 14px; font-weight: 600; color: #1e293b; margin-bottom: 10px; }
		</style>

		<script type="text/javascript">
		    // 部门数据（由服务端渲染）
		    var orgData = [];
			<c:forEach items="${requestScope.orgList}" var="org">
	            orgData.push({ id: ${org.id}, pid: ${org.p_id}, name: '${org.name}' });
	        </c:forEach>

		    function onClickTreeNode(nodeId)
		    {
		         // 高亮选中部门按钮
		         var btns = document.querySelectorAll('.org-btn');
		         for (var i = 0; i < btns.length; i++) { btns[i].classList.remove('selected'); }
		         var btn = document.getElementById('orgbtn' + nodeId);
		         if (btn) { btn.classList.add('selected'); }

		         document.getElementById("img1").style.display="block";
			     dwrService.getForwardHTMLPage(nodeId,callback); 
		    }

		    function callback(data)
		    {
		        document.getElementById("yuangongByOrg").innerHTML = data;
		        document.getElementById("img1").style.display="none";
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

            function StringBuffer()
            { 
			   this._strs = new Array(); 
			} 
			StringBuffer.prototype.append = function (str) 
			{ 
			   this._strs.push(str); //添加
			} 
			StringBuffer.prototype.pop = function (str) 
			{ 
			   this._strs.pop(str); //删除最后一个
			} 
			StringBuffer.prototype.toString = function()
		    { 
			   return this._strs.join(","); 
			}
            
            function queding()
            {
                 var sb = new StringBuffer(); 
                 
                 var object=document.getElementsByName("yuangong_id");//返回的obeject是数组
				 var empName = "";
				 for(i=0;i<object.length;i++)
				 {
				      if(object[i].checked==true)
					  {
					      sb.append(object[i].value);
					      if (empName == "") { empName = object[i].getAttribute("data-name") || ""; }
					  }
				 }
				 window.opener.window.returnVaule = sb.toString();
				 if (window.opener && window.opener.onEmployeeSelected) {
				     window.opener.onEmployeeSelected(sb.toString(), empName);
				 }
		         window.close();
            }
		</script>
	</head>

	<BODY>
		<table width="98%" border="0" cellpadding="6" cellspacing="0" align="center" style="margin-top:10px">
				<tr align="center" height="22">
				    <td width="26%" valign="top" align="left">
				        <div class="org-panel-title">部门组织结构</div>
						<div id="orgBtns" class="org-btns"></div>
                    </td>
				    <td width="74%" valign="top" align="left">
				        <div class="emp-panel-title">部门员工</div>
				        <div id="yuangongByOrg">
				           <span style="font-size: 14px;color:#94a3b8;">请单击左侧部门选择员工</span>
				        </div>
				        <img id="img1" src="<%=path %>/img/loading.gif" style="display: none"/>
                    </td>
		        </tr>
		</table>
		
		<div style="margin: 14px 0 0 8px;">
			<input type="button" value="确定" style="width: 80px;" onclick="queding()" />
		</div>

		<SCRIPT type="text/javascript">
			renderOrgButtons();
		</SCRIPT>
	</body>
</html>