# Kiro2API 部署指南

将 Kiro AI 转换为标准 API 服务，支持 Claude 和 OpenAI 兼容协议。

## ✨ 功能特性

- 🔄 **多协议支持** - 同时支持 Claude `/v1/messages` 和 OpenAI `/v1/chat/completions` 端点
- 🌐 **代理池支持** - 支持 HTTP/HTTPS/SOCKS5 代理，可配置代理池轮询
- 🔑 **Session 派生** - 代理地址支持 `%s` 占位符，自动替换为账号唯一 Session ID，实现 IP 隔离
- ⚖️ **负载均衡** - 多账号随机分配，自动跳过异常账号
- 🔁 **自动重试** - 可配置重试次数、延迟和验证码重试
- 💾 **数据持久化** - SQLite 数据库存储，方便备份迁移

## 项目展示

![Kiro2API 首页](home.png)

## 📡 API 端点

### Claude 协议 (`/v1/messages`)

```bash
curl -X POST http://localhost:8000/v1/messages \
  -H "Content-Type: application/json" \
  -H "x-api-key: YOUR_API_KEY" \
  -d '{
    "model": "claude-sonnet-4-20250514",
    "max_tokens": 4096,
    "stream": true,
    "messages": [
      {
        "role": "user",
        "content": "Hello, who are you?"
      }
    ]
  }'
```

### OpenAI 协议 (`/v1/chat/completions`)

```bash
curl -X POST http://localhost:8000/v1/chat/completions \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -d '{
    "model": "claude-sonnet-4-20250514",
    "stream": true,
    "messages": [
      {
        "role": "user",
        "content": "Hello, who are you?"
      }
    ]
  }'
```

## 快速开始

### 1. 下载部署文件

```bash
git clone https://github.com/ssmdo/kiro2api.git
cd kiro2api/
```

### 2. 一键部署

```bash
chmod +x deploy.sh
./deploy.sh
```

运行 `./deploy.sh` 会自动执行：停止旧服务 → 拉取最新镜像 → 启动服务

### 3. 常用命令

```bash
# 查看日志
docker compose logs -f

# 停止服务
docker compose down

# 查看状态
docker compose ps
```

## 配置说明

### .env 文件

```bash
# Docker 镜像配置
DOCKER_IMAGE=ssmdo/kiro2api:latest

# 服务端口
PORT=8000
```

### config.yaml 文件

```yaml
server:
  address: ":8000"  # 服务监听地址

database:
  default:
    type: "sqlite"
    link: "sqlite:./data/kiro.db"  # 数据库路径

kiro:
  apiTarget: "https://q.us-east-1.amazonaws.com"
  authTarget: "https://prod.us-east-1.auth.desktop.kiro.dev"
  version: "0.8.0"
```

## 目录结构

```
deploy/
├── README.md           # 部署说明
├── deploy.sh           # 一键部署脚本
├── docker-compose.yml  # Docker Compose 配置
├── config.yaml         # 应用配置文件
├── .env.example        # 环境变量示例
└── data/               # 数据目录（自动创建）
    └── kiro.db         # SQLite 数据库
```

## 常见问题

### 1. 端口被占用

修改 `.env` 文件中的 `PORT` 变量：

```bash
PORT=8080
```

### 2. 更新到最新版本

直接重新运行部署脚本即可：

```bash
./deploy.sh
```

### 3. 查看运行日志

```bash
docker compose logs -f
```

### 4. 数据持久化

数据存储在 `./data` 目录中，包括 SQLite 数据库文件。备份时请备份此目录。

## 🔌 Augment Code 配套使用

本项目可配合魔改版 Augment-BYOK 插件使用，实现在 Augment Code 中使用自定义 API 端点。

👉 **使用教程**: [飞书文档](https://tcn1dv9putrz.feishu.cn/wiki/NfNEwWkGuiWhNJkHFdRcfXrPnn1)
🔑 **访问密码**: `734&Q851`

## 🙏 鸣谢

- [Augment-BYOK](https://github.com/AnkRoot/Augment-BYOK) - 本插件基于此项目进行魔改，感谢原作者的开源贡献

## License

MIT License