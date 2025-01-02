My Blog CMS
基于 Strapi 搭建的博客内容管理系统。
功能特性

文章管理
分类管理
标签管理
媒体库管理
用户权限管理

开始使用
环境要求

Node.js 18.x 或更高版本
NPM 8.x 或更高版本
数据库 (支持 SQLite、MySQL、PostgreSQL)

安装步骤

克隆项目
```bash
clone https://github.com/dakuchazi/strapi-blog-admin.git
```

安装依赖
```bash
npm install
```

配置环境变量
```bash
cp .env.example .env
```

生成必要的安全密钥：
```bash
# 生成 ADMIN_JWT_SECRET
openssl rand -base64 32

# 生成 API_TOKEN_SALT
openssl rand -base64 32

# 生成 TRANSFER_TOKEN_SALT
openssl rand -base64 32

# 生成 APP_KEYS (需要生成多个，用逗号分隔)
openssl rand -base64 32
openssl rand -base64 32
```

启动开发服务器
```bash
npm run develop
```
服务器将在 http://localhost:1337/admin 启动
环境配置说明
数据库配置
项目支持多种数据库：

SQLite (默认)
MySQL
PostgreSQL

根据您使用的数据库类型，在 .env 文件中配置相应的参数。
管理员配置
需要设置以下安全相关的环境变量：

ADMIN_JWT_SECRET：管理面板认证密钥

必须设置，用于加密管理员会话
建议使用随机生成的强密钥


API_TOKEN_SALT：API令牌盐值

用于生成API访问令牌
建议使用随机字符串


TRANSFER_TOKEN_SALT：数据传输令牌盐值

用于数据导入/导出功能
建议使用随机字符串



服务器配置
APP_KEYS 是必需的配置项，用于加密session和其他安全功能。你需要生成随机字符串作为keys，多个key用逗号分隔。
开发指南
目录结构
```
/
├── config/            # 配置文件
│   ├── admin.js      # 管理面板配置
│   ├── database.js   # 数据库配置
│   └── server.js     # 服务器配置
├── src/              # 源代码
│   ├── api/          # API定义
│   ├── components/   # 组件
│   └── plugins/      # 插件
└── public/           # 静态文件
```
API文档
启动服务器后，可以在以下地址访问API文档：

http://localhost:1337/documentation

部署

采用Docker部署