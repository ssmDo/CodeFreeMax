# CodeFreeMax

> 🎉 **v3.0.0 Beta 已发布！**
>
> 全新 PaaS 架构正式上线，请拉取最新仓库重新部署。默认端口已更改为 **8877**，不会与之前的程序冲突，可放心部署。

🚀 将 Kiro、Antigravity、Warp、Orchids、Grok 等 IDE/服务转换为兼容 OpenAI / Claude / Augment Code 格式的 API 服务。

> 公共授权码：`144bd7a0-6ca2-4b7e-ac1c-1a29afb50662`

## ✨ 功能特性

### 多渠道支持

| 渠道 | Claude 协议 | OpenAI 协议 | 免费 | 备注 |
|------|:-----------:|:-----------:|:----:|------|
| Kiro | ✅ | ✅ | ❌ | ⭐ AugmentCode 推荐渠道 |
| Antigravity | ✅ | ✅ | ✅ | 可与 Kiro 自由切换 |
| Warp | ✅ | ✅ | ❌ | |
| Orchids | ✅ | ✅ | ❌ | ⚠️ 暂停出售 |
| ClaudeCode | ✅ | — | ❌ | 仅支持 Claude 协议 |
| Grok | — | ✅ | ✅ | 纯 OpenAI 协议 |

- API 端点格式：`http://localhost:8877/{渠道}/v1`，如 `/kiro/v1`、`/antigravity/v1`

### 核心能力

- 🔄 **多协议** — 同时支持 Claude `/v1/messages` 和 OpenAI `/v1/chat/completions`
- 🧠 **上下文自动压缩** — ClaudeCode 多轮对话自动压缩，超长会话不丢失、不卡顿
- 🚀 **Augment Code 适配** — 完美反代 Augment Code，配合魔改插件使用
- 🌐 **代理池** — 支持 HTTP/HTTPS/SOCKS5，可按渠道独立配置代理
- 🔑 **Session 派生** — 代理地址支持 `%s` 占位符，自动替换为账号 Session ID，实现 IP 隔离
- ⚖️ **负载均衡** — 多账号随机分配，自动跳过异常账号
- 🔁 **自动重试** — 可配置重试次数、延迟和验证码重试
- 📋 **模型管理** — 自定义模型列表、名称映射、启用/禁用、排序
- 💾 **数据持久化** — SQLite 存储，方便备份迁移
- 🎨 **管理界面** — 全新前端界面，操作直观

## 快速开始

### 1. 下载部署文件

```bash
git clone https://github.com/ssmDo/CodeFreeMax.git
cd CodeFreeMax/
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
PORT=8877
```

### config.yaml 文件

```yaml
server:
  address: ":8877"  # 服务监听地址

database:
  default:
    type: "sqlite"
    link: "sqlite:./data/augment.db"  # 数据库路径
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
    └── augment.db      # SQLite 数据库
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