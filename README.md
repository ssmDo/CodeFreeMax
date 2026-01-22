# Augment2API 部署指南

🚀 将 Kiro 等 IDE 转换为兼容 OpenAI/Claude/Augment Code 格式的 API 服务。

## 🎉 V2.1.0 更新说明

### 新增功能

- 🌐 **Warp 渠道支持** - 新增 Warp 渠道，支持 OpenAI 对话格式（暂不支持 Claude 协议）

## 🎉 V2.0.0 更新说明

> ⚠️ **重要提示**:
> 1. 更新到 V2.0.0 版本及以后，AugmentCode 插件需要重新下载安装！
> 2. API 端点格式已变更为 `http://localhost:8000/{渠道}/v1`，如 `/kiro/v1` 或 `/antigravity/v1`

### 新增功能

- 🌌 **反重力（Antigravity）渠道** - 新增 Antigravity 渠道支持，可在 Kiro 和 Antigravity 之间自由切换
- 🎛️ **按渠道配置代理** - 代理配置支持按渠道独立设置，每个渠道可以使用不同的代理
- 📋 **模型自定义管理** - 全新的模型管理功能，支持自定义返回的模型列表、名称映射、启用/禁用、排序等
- 🔌 **AugmentCode 插件全面优化** - 插件体验大幅提升，兼容性更好

## ✨ 功能特性

- 🚀 **Augment Code 支持** - 完美支持反代 Augment Code，已处理大部分兼容性问题
- 🔄 **多协议支持** - 同时支持 Claude `/v1/messages` 和 OpenAI `/v1/chat/completions` 端点
- 🌌 **多渠道支持** - 支持 Kiro、Antigravity 和 Warp 三渠道，可独立管理
  - **Claude 协议**: 仅支持 Kiro 和 Antigravity 渠道
  - **OpenAI 格式**: 所有渠道均支持
- 🌐 **代理池支持** - 支持 HTTP/HTTPS/SOCKS5 代理，可按渠道配置独立代理
- 🔑 **Session 派生** - 代理地址支持 `%s` 占位符，自动替换为账号唯一 Session ID，实现 IP 隔离
- ⚖️ **负载均衡** - 多账号随机分配，自动跳过异常账号
- 🔁 **自动重试** - 可配置重试次数、延迟和验证码重试
- 📋 **模型管理** - 自定义模型列表、名称映射、状态管理
- 💾 **数据持久化** - SQLite 数据库存储，方便备份迁移

## 项目展示

<img src="home1.png" alt="Augment2API 首页">
<br>
<img src="home2.png" alt="Augment2API 首页">
<br>


## 快速开始

### 1. 下载部署文件

```bash
git clone https://github.com/ssmDo/kiro2api.git
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
DOCKER_IMAGE=ssmdo/augment2api:latest

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

> ⚠️ **V2.0.0 用户注意**: 更新到 V2.0.0 后，插件需要重新下载安装才能正常使用新功能！

👉 **使用教程**: [飞书文档](https://tcn1dv9putrz.feishu.cn/wiki/NfNEwWkGuiWhNJkHFdRcfXrPnn1)
🔑 **访问密码**: `734&Q851`

## 🙏 鸣谢

- [Augment-BYOK](https://github.com/AnkRoot/Augment-BYOK) - 本插件基于此项目进行魔改，感谢原作者的开源贡献

## ☕ 捐赠

如果这个项目对你有帮助，欢迎请作者喝杯咖啡 ☕

<img src="wx.jpg" alt="微信赞赏码" width="200">

## License

MIT License