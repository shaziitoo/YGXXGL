<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    <title>企业员工信息管理系统 - 登录</title>
    <style type="text/css">
        * { margin: 0; padding: 0; box-sizing: border-box; }
        html, body { height: 100%; }
        body {
            font-family: "PingFang SC", "Microsoft YaHei", "Helvetica Neue", Arial, sans-serif;
            background: linear-gradient(135deg, #1e4fd6 0%, #2563eb 48%, #4f8ef7 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
            position: relative;
            overflow: hidden;
        }
        /* 背景装饰圆 */
        .deco { position: absolute; border-radius: 50%; background: rgba(255,255,255,.08); }
        .deco1 { width: 420px; height: 420px; top: -160px; right: -120px; }
        .deco2 { width: 300px; height: 300px; bottom: -120px; left: -80px; }
        .deco3 { width: 120px; height: 120px; top: 18%; left: 12%; background: rgba(255,255,255,.06); }

        .login-card {
            position: relative;
            z-index: 2;
            width: 400px;
            max-width: calc(100vw - 40px);
            background: #ffffff;
            border-radius: 16px;
            box-shadow: 0 18px 50px rgba(9, 30, 88, .35);
            padding: 42px 38px 34px;
        }
        .brand {
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 8px;
        }
        .brand-badge {
            width: 52px; height: 52px;
            border-radius: 14px;
            background: linear-gradient(135deg, #2563eb, #4f8ef7);
            color: #fff;
            font-size: 20px;
            font-weight: 700;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 6px 14px rgba(37, 99, 235, .35);
        }
        h1 {
            text-align: center;
            font-size: 21px;
            color: #1e293b;
            letter-spacing: 2px;
            margin-top: 16px;
        }
        .sub {
            text-align: center;
            font-size: 12px;
            color: #94a3b8;
            letter-spacing: 1px;
            margin: 6px 0 26px;
        }
        .field { margin-bottom: 18px; }
        .field label {
            display: block;
            font-size: 13px;
            color: #475569;
            margin-bottom: 6px;
            font-weight: 500;
        }
        .field input[type="text"],
        .field input[type="password"],
        .field select {
            width: 100%;
            height: 42px;
            padding: 0 14px;
            border: 1px solid #d8dfeb;
            border-radius: 8px;
            background: #f8fafd;
            font-size: 14px;
            color: #1e293b;
            outline: none;
            transition: all .2s ease;
        }
        .field input:focus, .field select:focus {
            border-color: #2563eb;
            background: #fff;
            box-shadow: 0 0 0 3px rgba(37, 99, 235, .14);
        }
        .btn-row { margin-top: 26px; display: flex; gap: 12px; }
        .btn-login {
            flex: 1;
            height: 44px;
            border: none;
            border-radius: 8px;
            background: linear-gradient(135deg, #2563eb, #3b82f6);
            color: #fff;
            font-size: 15px;
            font-weight: 600;
            letter-spacing: 6px;
            cursor: pointer;
            transition: all .2s ease;
            box-shadow: 0 4px 12px rgba(37, 99, 235, .35);
        }
        .btn-login:hover { background: linear-gradient(135deg, #1d4ed8, #2563eb); box-shadow: 0 6px 16px rgba(37, 99, 235, .45); }
        .btn-login:active { transform: translateY(1px); }
        .btn-reset {
            width: 88px;
            height: 44px;
            border: 1px solid #d8dfeb;
            border-radius: 8px;
            background: #fff;
            color: #64748b;
            font-size: 14px;
            cursor: pointer;
            transition: all .2s ease;
        }
        .btn-reset:hover { color: #2563eb; border-color: #2563eb; background: #eaf1ff; }
        #indicator { vertical-align: middle; margin-left: 8px; }
        .login-footer {
            position: relative;
            z-index: 2;
            margin-top: 26px;
            color: rgba(255,255,255,.75);
            font-size: 12px;
            letter-spacing: 1px;
        }
    </style>
    <script type='text/javascript' src='<%=path %>/dwr/interface/loginService.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/engine.js'></script>
    <script type='text/javascript' src='<%=path %>/dwr/util.js'></script>

    <script language="javascript">
        function check1()
        {
             if(document.ThisForm.userName.value=="")
             {
                alert("请输入用户名");
                document.ThisForm.userName.focus();
                return false;
             }
             if(document.ThisForm.userPw.value=="")
             {
                alert("请输入密码");
                document.ThisForm.userPw.focus();
                return false;
             }
             if(document.ThisForm.userType.value=="-1")
             {
                alert("请选择登陆身份");
                document.ThisForm.userType.focus();
                return false;
             }
             document.getElementById("indicator").style.display="inline-block";
             loginService.login(document.ThisForm.userName.value,document.ThisForm.userPw.value,document.ThisForm.userType.value,callback);
        }

        function callback(data)
        {
            document.getElementById("indicator").style.display="none";
            if(data=="no")
            {
                alert("用户名或密码错误");
            }
            if(data=="yes")
            {
                alert("通过验证,系统登录成功");
                window.location.href="<%=path %>/loginSuccess.jsp";
            }
        }
    </script>
</head>
<body>
    <div class="deco deco1"></div>
    <div class="deco deco2"></div>
    <div class="deco deco3"></div>

    <div class="login-card">
        <div class="brand"><div class="brand-badge">HR</div></div>
        <h1>企业员工信息管理系统</h1>
        <div class="sub">Human Resource Management System</div>

        <form name="ThisForm" action="<%=path %>/adminLogin.action" method="post">
            <div class="field">
                <label>用户名</label>
                <input type="text" name="userName" value="" placeholder="请输入用户名" autocomplete="off">
            </div>
            <div class="field">
                <label>密码</label>
                <input type="password" name="userPw" placeholder="请输入密码">
            </div>
            <div class="field">
                <label>登录身份</label>
                <select name="userType">
                    <option value="-1">请选择登录身份</option>
                    <option value="0">管理员</option>
                    <option value="1">员工</option>
                </select>
            </div>
            <div class="btn-row">
                <button type="button" class="btn-login" onclick="check1()">登录</button>
                <button type="reset" class="btn-reset">重 置</button>
            </div>
            <img id="indicator" src="<%=path %>/img/loading.gif" style="display:none" alt="loading">
        </form>
    </div>

    <div class="login-footer">企业员工信息管理系统 &copy; 人力资源部</div>
</body>
</html>