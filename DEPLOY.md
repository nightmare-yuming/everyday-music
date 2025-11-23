# 使用 GitHub Pages 部署網站

## 📌 為什麼使用 GitHub Pages？

- ✅ **HTTPS 安全連線**：Spotify 要求使用安全的 HTTPS
- ✅ **免費託管**：完全免費
- ✅ **自動部署**：推送程式碼後自動更新
- ✅ **穩定可靠**：由 GitHub 提供服務

---

## 🚀 部署步驟

### 步驟 1: 建立 GitHub 儲存庫

1. **登入 GitHub**
   - 訪問 https://github.com
   - 登入您的帳號（如果沒有帳號，請先註冊）

2. **建立新儲存庫**
   - 點擊右上角的 "+" > "New repository"
   - Repository name: `everyday-music`
   - Description: `每日音樂推薦網站`
   - 選擇 "Public"（必須是 Public 才能使用免費的 GitHub Pages）
   - ✅ 勾選 "Add a README file"
   - 點擊 "Create repository"

### 步驟 2: 上傳檔案到 GitHub

#### 方法 A: 使用 GitHub 網頁介面（最簡單）

1. **進入您的儲存庫**
   - 在儲存庫頁面，點擊 "Add file" > "Upload files"

2. **上傳以下檔案**：
   - `index.html`
   - `style.css`
   - `script.js`
   - `config.js`
   - `README.md`

3. **Commit 變更**
   - 在底部輸入 commit 訊息：`Initial commit`
   - 點擊 "Commit changes"

#### 方法 B: 使用 Git 命令列

如果您熟悉 Git：

```bash
cd c:\Users\yuming\.gemini\antigravity\scratch\everyday-music

# 初始化 Git
git init

# 新增所有檔案
git add index.html style.css script.js config.js README.md

# Commit
git commit -m "Initial commit"

# 連接到遠端儲存庫（替換成您的使用者名稱）
git remote add origin https://github.com/您的使用者名稱/everyday-music.git

# 推送到 GitHub
git branch -M main
git push -u origin main
```

### 步驟 3: 啟用 GitHub Pages

1. **進入 Settings**
   - 在您的儲存庫頁面，點擊 "Settings"

2. **設定 Pages**
   - 在左側選單找到 "Pages"
   - 在 "Source" 下拉選單選擇 "main" 分支
   - 資料夾保持 "/ (root)"
   - 點擊 "Save"

3. **等待部署**
   - 頁面會顯示：`Your site is ready to be published at https://您的使用者名稱.github.io/everyday-music/`
   - 等待 1-2 分鐘讓 GitHub 完成部署
   - 重新整理頁面，看到綠色勾勾表示部署成功

### 步驟 4: 更新 Spotify 設定

1. **前往 Spotify Developer Dashboard**
   - 訪問 https://developer.spotify.com/dashboard
   - 登入您的帳號

2. **編輯應用程式**
   - 點擊您之前建立的應用程式
   - 點擊 "Settings"

3. **新增 Redirect URI**
   - 在 "Redirect URIs" 欄位中新增（替換成您的使用者名稱）：
     ```
     https://您的使用者名稱.github.io/everyday-music/
     ```
   - ⚠️ **注意**：網址結尾的 `/` 很重要，不要漏掉
   - 點擊 "Add"
   - 點擊 "Save"

4. **複製 Client ID**
   - 在同一頁面複製您的 "Client ID"

### 步驟 5: 更新 config.js

1. **編輯 config.js**
   - 在 GitHub 儲存庫中，點擊 `config.js`
   - 點擊鉛筆圖示（Edit this file）

2. **更新內容**：

```javascript
const SPOTIFY_CONFIG = {
  clientId: '您的Client ID', // 貼上您剛才複製的 Client ID
  redirectUri: 'https://您的使用者名稱.github.io/everyday-music/', // 替換成您的網址
  scopes: [
    'streaming',
    'user-read-email',
    'user-read-private',
    'user-modify-playback-state',
    'user-read-playback-state'
  ]
};
```

3. **Commit 變更**
   - 在底部輸入：`Update Spotify configuration`
   - 點擊 "Commit changes"

### 步驟 6: 測試網站

1. **訪問您的網站**
   - 開啟 `https://您的使用者名稱.github.io/everyday-music/`
   - 應該會看到精美的音樂推薦網站

2. **連接 Spotify**
   - 點擊「🎧 連接 Spotify」按鈕
   - 登入您的 Spotify Premium 帳號
   - 授權應用程式
   - 完成後會返回網站

3. **開始播放**
   - 點擊任何音樂卡片
   - 音樂應該會開始播放！

---

## 🔧 進階設定

### 使用自訂網域（選擇性）

如果您有自己的網域：

1. 在 GitHub Pages 設定中，輸入您的網域
2. 在您的網域 DNS 設定中新增 CNAME 記錄
3. 更新 `config.js` 中的 `redirectUri`
4. 在 Spotify 應用程式中更新 Redirect URI

### 更新網站內容

每次修改檔案後：

1. 在 GitHub 上編輯檔案
2. Commit 變更
3. 等待 1-2 分鐘，GitHub Pages 會自動更新

---

## ⚠️ 重要提醒

> [!IMPORTANT]
> **Redirect URI 必須完全一致**
> 
> Spotify 的 Redirect URI 必須與 `config.js` 中的 `redirectUri` 完全相同，包括：
> - 協定（https://）
> - 網域名稱
> - 路徑
> - 結尾的斜線 `/`

> [!WARNING]
> **不要將 Client Secret 放入程式碼**
> 
> 只需要 Client ID，不需要 Client Secret。Client Secret 是機密資訊，不應該放在前端程式碼中。

> [!NOTE]
> **GitHub Pages 部署時間**
> 
> 每次更新程式碼後，GitHub Pages 需要 1-2 分鐘來重新部署。如果看不到變更，請稍等片刻並清除瀏覽器快取。

---

## 🐛 常見問題

### Q: 部署後網站顯示 404

**解決方法**：
1. 確認 GitHub Pages 已啟用
2. 確認選擇的是 "main" 分支
3. 等待幾分鐘讓部署完成
4. 確認網址是 `https://您的使用者名稱.github.io/everyday-music/`

### Q: Spotify 登入後顯示 "INVALID_CLIENT: Invalid redirect URI"

**解決方法**：
1. 檢查 Spotify 應用程式的 Redirect URI 是否正確
2. 確認 `config.js` 中的 `redirectUri` 與 Spotify 設定完全相同
3. 確認網址結尾有 `/`

### Q: 點擊歌曲沒有反應

**解決方法**：
1. 確認已連接 Spotify（點擊「連接 Spotify」按鈕）
2. 確認使用的是 Spotify Premium 帳號
3. 開啟瀏覽器開發者工具（F12）查看錯誤訊息

### Q: 如何更新音樂資料庫？

**解決方法**：
1. 在 GitHub 上編輯 `script.js`
2. 找到 `musicDatabase` 物件
3. 新增或修改歌曲資料
4. Commit 變更

---

## 📊 部署檢查清單

在開始使用前，確認以下項目：

- [ ] ✅ 已建立 GitHub 儲存庫
- [ ] ✅ 已上傳所有檔案到 GitHub
- [ ] ✅ 已啟用 GitHub Pages
- [ ] ✅ 網站可以訪問（https://您的使用者名稱.github.io/everyday-music/）
- [ ] ✅ 已在 Spotify Developer Dashboard 新增 Redirect URI
- [ ] ✅ 已更新 config.js 中的 Client ID
- [ ] ✅ 已更新 config.js 中的 redirectUri
- [ ] ✅ Redirect URI 與 config.js 完全相同
- [ ] ✅ 擁有 Spotify Premium 帳號

---

## 🎉 完成！

現在您的音樂推薦網站已經部署到 GitHub Pages，使用安全的 HTTPS 連線！

您可以：
- 分享網址給朋友
- 隨時更新內容
- 在任何裝置上訪問

享受您的音樂之旅！🎵✨
