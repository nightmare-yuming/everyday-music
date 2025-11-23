@echo off
echo ========================================
echo 每日音樂推薦網站 - 啟動伺服器
echo ========================================
echo.

cd /d "%~dp0"

echo 正在檢查可用的伺服器...
echo.

REM 嘗試使用 Python
where python >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [✓] 找到 Python，正在啟動伺服器...
    echo.
    echo 伺服器將在 http://localhost:8080 運行
    echo 按 Ctrl+C 可停止伺服器
    echo.
    python -m http.server 8080
    goto :end
)

REM 嘗試使用 Node.js
where node >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [✓] 找到 Node.js，正在啟動伺服器...
    echo.
    echo 伺服器將在 http://localhost:8080 運行
    echo 按 Ctrl+C 可停止伺服器
    echo.
    npx -y http-server -p 8080
    goto :end
)

REM 嘗試使用 PHP
where php >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo [✓] 找到 PHP，正在啟動伺服器...
    echo.
    echo 伺服器將在 http://localhost:8080 運行
    echo 按 Ctrl+C 可停止伺服器
    echo.
    php -S localhost:8080
    goto :end
)

REM 如果都沒找到
echo [✗] 錯誤：找不到可用的伺服器
echo.
echo 請安裝以下任一工具：
echo   1. Python 3: https://www.python.org/downloads/
echo   2. Node.js: https://nodejs.org/
echo   3. PHP: https://www.php.net/downloads
echo.
echo 或者使用 VS Code 的 Live Server 擴充功能
echo.
pause
goto :end

:end
