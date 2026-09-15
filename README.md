# Launch Antigravity without TUN

[中文说明](#中文说明) | [English](#english)

---

## 中文说明

### 问题背景

Antigravity 负责调模型的是后台独立的 **Go 进程**（`language_server.exe`）。Go 语言天生不读 Windows 系统代理，只认环境变量。直连超时导致本地服务起不来，前端直接黑屏。

### 解决方案

我们用一个 bat 脚本解决问题，只要把启动路径和本地端口改成自己的即可。无需开启虚拟网卡或 TUN 模式。

### 脚本内容

```bat
@echo off
set HTTPS_PROXY=socks5h://127.0.0.1:65532
set HTTP_PROXY=socks5h://127.0.0.1:65532
set ALL_PROXY=socks5h://127.0.0.1:65532
set NO_PROXY=127.0.0.1,localhost,::1
start "" "C:\Users\24894\AppData\Local\Programs\antigravity\Antigravity.exe"
```

### 配置说明

1. **本地端口**：将 `65532` 修改为你本地代理客户端（如 Clash、v2rayN、sing-box 等）的 SOCKS5 端口（若为 HTTP 代理可改为 `http://127.0.0.1:端口`）。
2. **启动路径**：如果你的安装路径不同，请将最后一行的路径修改为你实际的 `Antigravity.exe` 路径（也可以写为 `"%LOCALAPPDATA%\Programs\antigravity\Antigravity.exe"` 通用路径）。

### 使用方法

双击 `launch Antigravity.bat` 运行即可。

---

## English

### Problem Background

Antigravity delegates model calls to an independent background **Go process** (`language_server.exe`). By design, Go applications do not inherit Windows system proxy settings and only recognize proxy environment variables. When direct connections time out, the local backend fails to initialize, resulting in a black/blank screen on the frontend.

### Solution

This simple `.bat` script resolves the issue by setting the necessary proxy environment variables before launching. Users only need to update the proxy port and launch path for their own setup—no TUN mode or virtual network adapter required.

### Script

```bat
@echo off
set HTTPS_PROXY=socks5h://127.0.0.1:65532
set HTTP_PROXY=socks5h://127.0.0.1:65532
set ALL_PROXY=socks5h://127.0.0.1:65532
set NO_PROXY=127.0.0.1,localhost,::1
start "" "C:\Users\24894\AppData\Local\Programs\antigravity\Antigravity.exe"
```

### Configuration

1. **Local Port**: Replace `65532` with the local SOCKS5 port of your proxy client (e.g. Clash, v2rayN, sing-box). For HTTP proxy, use `http://127.0.0.1:port`.
2. **Launch Path**: Update the last line to your actual `Antigravity.exe` path (or use `"%LOCALAPPDATA%\Programs\antigravity\Antigravity.exe"`).

### Usage

Double-click `launch Antigravity.bat` to run.
