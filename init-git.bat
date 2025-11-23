@echo off
echo ========================================
echo 初始化 Git 儲存庫
echo ========================================
echo.

cd /d "%~dp0"

REM 檢查是否已安裝 Git
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [✗] 錯誤：找不到 Git
    echo.
    echo 請先安裝 Git：
    echo https://git-scm.com/download/win
    echo.
    pause
    exit /b 1
)

echo [✓] 找到 Git
echo.

REM 初始化 Git 儲存庫
echo [1/5] 初始化 Git 儲存庫...
git init
echo.

REM 新增所有檔案
echo [2/5] 新增檔案...
git add index.html style.css script.js config.js README.md .gitignore
echo.

REM Commit
echo [3/5] 建立 commit...
git commit -m "Initial commit: 每日音樂推薦網站"
echo.

REM 設定主分支名稱
echo [4/5] 設定主分支...
git branch -M main
echo.

echo [5/5] 完成！
echo.
echo ========================================
echo 下一步：
echo ========================================
echo.
echo 1. 在 GitHub 建立新儲存庫（名稱：everyday-music）
echo.
echo 2. 執行以下指令（替換成您的使用者名稱）：
echo    git remote add origin https://github.com/您的使用者名稱/everyday-music.git
echo    git push -u origin main
echo.
echo 3. 或者直接在 GitHub 網頁上傳檔案
echo.
echo 詳細步驟請參考 DEPLOY.md
echo.
pause
