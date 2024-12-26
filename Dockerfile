FROM node:18-alpine

# 设置 npm 镜像源
RUN npm config set registry https://registry.npmmirror.com

# 安装必要的系统依赖
RUN apk update && \
    apk add --no-cache build-base gcc autoconf automake zlib-dev libpng-dev vips-dev python3

# 设置工作目录
WORKDIR /opt/app

# 复制 package 文件
COPY package*.json ./

# 安装依赖
RUN npm install

# 复制其他文件
COPY . .

# 构建应用
RUN npm run build

EXPOSE 1337
CMD ["npm", "run", "start"]