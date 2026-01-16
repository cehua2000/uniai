# 部署到 GitHub 仓库的脚本
# 使用方法: .\deploy-to-github.ps1 -GitHubRepo "https://github.com/你的用户名/仓库名.git"

param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubRepo
)

Write-Host "🚀 开始部署到 GitHub..." -ForegroundColor Green

# 检查是否在正确的目录
if (-not (Test-Path ".git")) {
    Write-Host "❌ 错误: 当前目录不是 git 仓库" -ForegroundColor Red
    exit 1
}

# 检查是否有未提交的更改
$status = git status --porcelain
if ($status) {
    Write-Host "⚠️  检测到未提交的更改，正在添加..." -ForegroundColor Yellow
    git add .
    $commitMessage = Read-Host "请输入提交信息 (直接回车使用默认信息)"
    if ([string]::IsNullOrWhiteSpace($commitMessage)) {
        $commitMessage = "Deploy to GitHub: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
    }
    git commit -m $commitMessage
}

# 添加新的远程仓库（如果已存在则更新）
$remoteName = "my-github"
$existingRemote = git remote get-url $remoteName 2>$null

if ($existingRemote) {
    Write-Host "📝 更新远程仓库地址..." -ForegroundColor Cyan
    git remote set-url $remoteName $GitHubRepo
} else {
    Write-Host "➕ 添加新的远程仓库..." -ForegroundColor Cyan
    git remote add $remoteName $GitHubRepo
}

# 显示当前远程仓库
Write-Host "`n📋 当前远程仓库配置:" -ForegroundColor Cyan
git remote -v

# 推送到 GitHub
Write-Host "`n📤 正在推送到 GitHub..." -ForegroundColor Green
try {
    git push $remoteName main --force
    Write-Host "✅ 部署成功！" -ForegroundColor Green
    Write-Host "🌐 仓库地址: $GitHubRepo" -ForegroundColor Cyan
} catch {
    Write-Host "❌ 推送失败: $_" -ForegroundColor Red
    Write-Host "💡 提示: 如果这是新仓库，请先在 GitHub 上创建仓库" -ForegroundColor Yellow
    Write-Host "💡 或者使用: git push $remoteName main" -ForegroundColor Yellow
    exit 1
}

Write-Host "`n✨ 完成！" -ForegroundColor Green
