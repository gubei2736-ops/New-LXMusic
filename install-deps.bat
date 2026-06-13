@echo off
chcp 65001 >nul
echo ========================================
echo New-LXMusic 依赖安装脚本
echo ========================================
echo.

REM 检查 Node.js 是否安装
where node >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [错误] 未检测到 Node.js，请先安装 Node.js >= 22
    echo 下载地址：https://nodejs.org/
    pause
    exit /b 1
)

REM 检查 Node.js 版本
for /f "tokens=2" %%i in ('node -v') do set NODE_VERSION=%%i
echo [信息] 当前 Node.js 版本：%NODE_VERSION%

REM 检查 npm 是否安装
where npm >nul 2>nul
if %ERRORLEVEL% neq 0 (
    echo [错误] 未检测到 npm
    pause
    exit /b 1
)

echo.
echo [信息] 开始安装依赖...
echo.

REM 清理 npm 缓存（可选，如果安装失败可以启用）
REM call npm cache clean --force

REM 设置 npm 镜像（如果国内下载慢，可以取消下面这行的注释）
REM echo [信息] 配置淘宝镜像...
REM call npm config set registry https://registry.npmmirror.com

REM 安装依赖
call npm install

if %ERRORLEVEL% neq 0 (
    echo.
    echo [错误] 依赖安装失败！
    echo 可能的原因:
    echo 1. 网络连接问题，请检查网络
    echo 2. Node.js 版本不匹配，请确保 Node.js >= 22
    echo 3. npm 缓存问题，尝试运行：npm cache clean --force
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo 依赖安装成功！
echo ========================================
echo.
echo 接下来可以运行:
echo   - npm run dev  : 开发模式运行
echo   - npm run pack : 打包应用
echo.
pause
