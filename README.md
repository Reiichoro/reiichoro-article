# reiichoro-article
reiichoro-article: High-Performance CMS Plugin for FastAdmin
# 🚀 reiichoro-article: High-Performance CMS Plugin for FastAdmin
### A Lightweight & Open CMS Plugin for FastAdmin  
### 一個為「小而確定」而生的 FastAdmin 內容管理系統

![Backend Preview](images/reiichoro-article.webp)

---

## ✨ 專案宣言 / Project Manifesto

> **不是所有項目都需要一套「完整 CMS」。**  
> 有些時候，我們只需要一個乾淨、可控、可維護的內容表。

**reiichoro-article** 是一個從實際項目中「剝離」出來的 CMS 插件，  
它源自一次對 FastAdmin 官方 CMS 的深入使用與反思，而非簡單的功能模仿。

---

## 🧭 開發背景與心路歷程 / Why This Project Exists

在 FastAdmin 生態中，官方 CMS 插件售價為 **300 元**，  
其架構設計嚴謹、功能完整，**本質上是一套「正規 CMS 解決方案」**。
In the FastAdmin ecosystem, the official CMS plugin costs 300 RMB. While powerful, it can feel bloated and overpriced for developers seeking minimalism and high customization.
但在實際項目開發中，我逐漸意識到一個問題：

> **並不是每一個系統，都需要為「可能永遠用不到的擴展性」付出複雜度與成本。**

在與 ChatGPT（サラ・ケリガン）共同梳理 FastAdmin 架構的過程中，我選擇：

- 將 CMS 能力 **從業務系統中獨立剝離**
- 保留 **最小可用、最易維護** 的內容管理模型
- 用一次「反工程」來理解：  
  **什麼時候該用重型 CMS，什麼時候不該**

**reiichoro-article** 正是在這樣的思考下誕生的。
I developed **reiichoro-article** to provide a lighter, purer alternative. This is not just a challenge to pricing, but an experiment in "Tool Sovereignty."

---

## 🆚 與 FastAdmin 官方 CMS 的核心區別

### 1️⃣ 授權與定位差異

| 項目 | reiichoro-article | FastAdmin 官方 CMS |
|----|----|----|
| 授權方式 | ✅ 完全免費 / 開源 | 💰 付費（300 元） |
| 項目定位 | 輕量內容管理 | 正規 CMS |
| 適用場景 | 小型網站 / 後台說明 / 公告 | 門戶 / 資訊站 / 媒體系統 |

---

### 2️⃣ 數據模型差異（**最重要的區別**）

#### ✅ reiichoro-article（單表模型）

```text
fa_article
🧱 FastAdmin 官方 CMS（主表 + 附表模型）
fa_archives        （主表）
fa_addonarticle    （內容表）

### 「打破收費壁壘，重塑內容管理的自由意志」
### "Breaking Financial Barriers, Reshaping the Free Will of Content Management"


---

## 🛠️ 核心功能 / Core Features

- **TinyMCE 深度集成 (Deep Integration)**: 
  - 完美修復了官方編輯器常見的路徑破圖問題。
  - Optimized image upload logic to prevent broken URLs.
- **職人級 UI 調整 (Craftsman UI)**: 
  - 列表頁固定列 (Fixed Columns)，確保在大屏幕與小屏幕下都能完美掌控操作按鈕。
  - Fixed-column layout ensures control buttons are always accessible across all screen sizes.
- **完全免費與開源 (100% Free & Open Source)**: 
  - 對標官方收費插件的核心功能，零成本部署。
  - Core features comparable to paid plugins, but with zero deployment cost.

---

## ⚙️ 技術架構 / Technical Architecture

### 1. 編輯器模塊 / Editor Module
我獨立封裝了 TinyMCE 的初始化邏輯 (`editor.js`)，支持：
I independently encapsulated the TinyMCE initialization logic (`editor.js`), supporting:
- **Relative URL Protection**: `relative_urls: false` 確保數據遷移後圖片依然可用。
- **Mobile-Friendly**: 移除了硬編碼的圖片尺寸，適配各類移動端設備。

### 2. 數據傳輸 / Data Flow

採用異步加載技術，將內容與視圖解耦，大幅提升文章加載速度。
Utilizing asynchronous loading to decouple content and view, significantly improving article loading speeds.

---

## 🛡️ 安全與誠信宣言 / Safety & Integrity

身為一名技術職人，我深知代碼透明度的重要性：
As a technical craftsman, I prioritize code transparency:

1. **零後門 (No Backdoors)**: 純代碼實現，無任何遠程 API 調用。
2. **零監控 (No Monitoring)**: 所有數據均存儲在您的本地數據庫中。
3. **完全控制 (Total Control)**: 既然沒有「我們」，那麼這份代碼在您下載後，就完全屬於您的意志。

---

---

## 🛠️ 安裝指南 / Installation Guide

為了確保插件完美運行，請按照以下「意志執行的順序」操作：
To ensure the plugin functions perfectly, please follow this "Order of Execution":

1. **資料庫導入 (Database Import)**:
   - 首先導入 `install.sql` 到您的 MySQL 數據庫。這將自動創建 `fa_article` 表並初始化所有的權限節點（Auth Rules）。
   - Import `install.sql` into your MySQL database first. This creates the `fa_article` table and initializes all permission nodes.

2. **檔案覆蓋 (File Overwrite)**:
   - 將本項目的 `application/` 和 `public/` 目錄直接上傳至您的 FastAdmin 根目錄進行覆蓋。
   - Upload and overwrite the `application/` and `public/` directories to your FastAdmin root directory.

3. **清除緩存 (Clear Cache)**:
   - 登錄後台，點擊右上角的「清除緩存」，確保 JS 腳本與權限映射立即生效。
   - Log in to the backend and click "Clear Cache" to ensure JS scripts and auth mappings take effect immediately.

---

## ⚖️ 特別聲明 / Special Disclaimer

- **打破壟斷 (Anti-Monopoly)**: FastAdmin 官方 CMS 插件售價為 **300 元**。本插件旨在打破技術壁壘，為貧苦開發者與極簡主義者提供另一種可能。
- **學習用途 (Educational Use Only)**: 本項目完全開源且免費，**僅供技術交流與學習使用**。若用於大規模商業運作，請支持官方原版插件以獲得官方售後支持。
- **無關「我們」 (No 'We')**: 這是一個獨立開發者的個人實驗。使用本插件即代表您認可並接受「風險自擔」的個體意志原則。

---

## 🤝 聯繫與交流 / Contact

如果你認可這份「拒絕平庸」的技術追求，歡迎 Star。
If you value this pursuit of "Anti-Mediocrity," please Star this repo.

[Official Website](https://reiichoro.github.io)