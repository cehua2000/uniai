# 推送到 GitHub 仓库指南

## 仓库信息
- **仓库地址**: https://github.com/cehua2000/uniai.git
- **远程名称**: my-github
- **分支**: main

## 方法 1: 使用 HTTPS 推送（推荐）

### 如果遇到网络问题，可以尝试：

```powershell
cd C:\Users\tsang\uniai-studio-new

# 方法 1: 直接推送
git push my-github main

# 方法 2: 设置上游并推送
git push -u my-github main

# 方法 3: 如果遇到认证问题，使用 Personal Access Token
# 1. 访问 https://github.com/settings/tokens
# 2. 生成新的 token (classic)
# 3. 选择 repo 权限
# 4. 推送时，用户名输入: cehua2000，密码输入: token
```

### 配置 Git 凭据管理器（Windows）

```powershell
git config --global credential.helper manager-core
```

## 方法 2: 使用 SSH 推送

### 1. 检查是否已有 SSH 密钥

```powershell
ls ~/.ssh
```

### 2. 如果没有，生成 SSH 密钥

```powershell
ssh-keygen -t ed25519 -C "cehua2000@163.com"
# 按回车使用默认路径
# 可以设置密码或直接回车
```

### 3. 添加 SSH 密钥到 GitHub

```powershell
# 查看公钥
cat ~/.ssh/id_ed25519.pub
# 复制输出的内容
```

然后：
1. 访问 https://github.com/settings/keys
2. 点击 "New SSH key"
3. 粘贴公钥内容
4. 保存

### 4. 更新远程仓库为 SSH 地址

```powershell
cd C:\Users\tsang\uniai-studio-new
git remote set-url my-github git@github.com:cehua2000/uniai.git
git push my-github main
```

## 方法 3: 使用 GitHub Desktop 或 VS Code

1. 打开 GitHub Desktop 或 VS Code
2. 添加仓库: `C:\Users\tsang\uniai-studio-new`
3. 点击推送按钮

## 当前状态

✅ 代码已准备好推送
✅ 远程仓库已配置: my-github → https://github.com/cehua2000/uniai.git
✅ 最新提交: "Add deployment script and initial setup"

## 如果仍然遇到问题

1. **检查网络连接**: 确保可以访问 github.com
2. **使用代理**: 如果在中国大陆，可能需要配置代理
3. **检查防火墙**: 确保防火墙允许 Git 访问网络
4. **尝试不同时间**: 网络高峰期可能连接不稳定

## 验证推送成功

推送成功后，访问 https://github.com/cehua2000/uniai 查看代码。
