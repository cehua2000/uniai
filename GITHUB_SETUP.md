# GitHub 仓库设置指南

## 步骤 1: 在 GitHub 上创建新仓库

1. 访问 https://github.com/new
2. 填写仓库信息：
   - **Repository name**: `uniai`
   - **Description**: (可选) AI 图片生成与编辑平台
   - **Visibility**: 选择 Public 或 Private
   - ⚠️ **重要**: 不要勾选 "Initialize this repository with a README"
   - ⚠️ **重要**: 不要添加 .gitignore 或 license（项目已有）
3. 点击 "Create repository"

## 步骤 2: 确认你的 GitHub 用户名

请确认你的 GitHub 用户名是：
- `cehua2000` 还是其他？

如果用户名不同，请告诉我正确的用户名。

## 步骤 3: 推送代码

创建仓库后，运行以下命令推送代码：

```powershell
cd C:\Users\tsang\uniai-studio-new
git push my-github main
```

或者如果仓库已存在但需要设置上游分支：

```powershell
git push -u my-github main
```

## 如果遇到认证问题

如果推送时要求输入用户名和密码，你需要：

1. **使用 Personal Access Token (推荐)**:
   - 访问 https://github.com/settings/tokens
   - 点击 "Generate new token (classic)"
   - 选择权限：至少勾选 `repo`
   - 生成后复制 token
   - 推送时用户名输入你的 GitHub 用户名，密码输入 token

2. **或者使用 SSH**:
   ```powershell
   # 更新远程仓库为 SSH 地址
   git remote set-url my-github git@github.com:cehua2000/uniai.git
   ```
