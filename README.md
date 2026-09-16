# 员工信息管理系统

一个基于 **JSP + Servlet** 的轻量级员工信息管理系统，提供组织架构管理、员工管理、考勤、工资、请假审批等核心功能。纯 Java Web 实现，无需额外框架.
## 功能模块

| 模块 | 说明 | 数据表 |
| --- | --- | --- |
| 管理员管理 | 后台管理员账号的维护 | `t_admin` |
| 组织架构 | 部门树形管理（支持多级部门、逻辑删除） | `t_organization` |
| 员工管理 | 员工档案维护（编号、职位、是否为部门领导、登录账号） | `t_yuangong` |
| 考勤管理 | 按月份记录员工出勤天数 | `t_chuqin` |
| 工资管理 | 按月份记录员工工资 | `t_gongzi` |
| 请假申请 | 员工提交请假，管理员审核（通过/驳回 + 回复） | `t_qingjiashenqing` |

- 管理员入口：`/admin` 系列页面（组织、员工、考勤、工资、请假审核、账号、修改密码）
- 员工入口：员工可查看个人工资、提交请假申请等

## 技术栈

- **后端**：Java（JDK 1.8+）、JSP / Servlet 2.5
- **数据库**：MySQL 5.7（脚本兼容 MySQL 8.x）
- **持久层**：原生 JDBC（`com.dao.DB` 工具类）
- **前端**：HTML + JSP + JavaScript，JSTL 1.2 标签库
- **AJAX**：DWR（Direct Web Remoting）
- **富文本**：FCKeditor
- **文件上传**：jspsmartupload / commons-fileupload
- **字符编码**：全局 UTF-8（`com.util.EncodingFilter` 过滤器）

## 环境要求

- JDK 1.8 或以上
- Tomcat 8.5 / 9（兼容 Servlet 2.5 的容器均可）
- MySQL 5.7 或以上
- MySQL Connector/J 驱动（lib 目录已含 `mysql-connector-java-5.0.4-bin.jar`）

## 部署步骤

### 1. 准备数据库

```sql
-- 创建数据库（编码 utf8）
CREATE DATABASE rlzy DEFAULT CHARACTER SET utf8;

-- 导入表结构与初始数据（项目根目录下的 yggl.sql）
USE rlzy;
SOURCE /path/to/rlzy/yggl.sql;
```

> `yggl.sql` 已包含建表语句及初始演示数据（管理员、部门、一名员工）。

### 2. 配置数据库连接

打开 `src/com/dao/DB.java`，确认以下连接信息（默认值如下）：

```java
private String user     = "root";
private String password = "root";
private String className = "com.mysql.cj.jdbc.Driver";
private String url = "jdbc:mysql://localhost:3306/rlzy?useUnicode=true&characterEncoding=utf8&serverTimezone=GMT%2B8";
```

- 若你的 MySQL 用户名/密码不同，请修改 `user` 与 `password`。
- 数据库名固定为 `rlzy`（与 `yggl.sql` 中的建库一致）。

### 3. 编译与部署

本项目为 MyEclipse / Eclipse 的 Java Web 工程，源码位于 `src`，Web 根目录为 `WebRoot`。

**方式 A：使用 IDE（推荐）**
1. 导入本项目。
2. 配置 Tomcat 服务器，将 `WebRoot` 作为 Web 应用根目录部署。
3. 启动 Tomcat，访问 `http://localhost:8080/rlzy/login.jsp`。

**方式 B：手动部署到 Tomcat**
1. 将 `src` 下的 Java 文件编译，class 输出到 `WebRoot/WEB-INF/classes`。
2. 把整个 `WebRoot` 目录复制到 `Tomcat/webapps/rlzy`。
3. 启动 Tomcat，访问 `http://localhost:8080/rlzy/login.jsp`。

## 默认账号

| 角色 | 用户名 | 密码 | 说明 |
| --- | --- | --- | --- |
| 管理员 | `admin` | `admin` | 后台管理全部功能 |
| 员工（示例） | `202501` | `000000` | 登录名为员工 `loginname` |

> 管理员账号 `a / aa` 也存在于初始数据中，仅供演示。

## 目录结构

```
rlzy/
├── src/                      # Java 源码
│   └── com/
│       ├── action/           # Servlet 控制器（admin/org/yuangong/chuqin/gongzi/qingjiashenqing）
│       ├── dao/              # DB 数据库连接工具
│       ├── orm/              # 实体类（与数据表一一对应）
│       ├── service/          # 业务层（登录、DWR 服务等）
│       └── util/             # EncodingFilter 字符编码过滤器
├── WebRoot/                  # Web 应用根目录
│   ├── login.jsp             # 登录页
│   ├── admin/                # 后台管理页面（组织/员工/考勤/工资/请假/账号/个人信息）
│   ├── WEB-INF/
│   │   ├── web.xml           # Servlet 映射与欢迎页配置
│   │   ├── lib/              # 依赖 jar 包
│   │   └── classes/          # 编译后的 class 文件
│   └── ...                   # 静态资源（js / images 等）
├── yggl.sql                  # 数据库建表 + 初始数据脚本
└── rlzy.iml                  # MyEclipse 工程文件
```

## 常见问题 / 注意事项

- **数据库驱动不匹配**：`DB.java` 使用 Connector/J 8.x 驱动类 `com.mysql.cj.jdbc.Driver`。若 lib 目录仍为 5.0.4 版本（`com.mysql.jdbc.Driver`），运行时会出现 `ClassNotFoundException`。解决办法：将 `mysql-connector-java-5.0.4-bin.jar` 替换为 8.x 版本，或把驱动类改回 `com.mysql.jdbc.Driver`。
- **时区报错**：连接 URL 已带 `serverTimezone=GMT%2B8`，如使用 MySQL 8.x 且仍报时区错误，请确认该参数存在。
- **端口冲突**：默认访问端口为 `8080`，如被占用请修改 Tomcat 配置或访问时更换端口。
- **DWR 调试**：`web.xml` 中 DWR 的 `debug` 参数开启，生产环境建议设为 `false`。

## License

本项目仅供学习与交流使用。
