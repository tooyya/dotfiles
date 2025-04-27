-- Neovim基本設定
local opt = vim.opt

-- UI設定
opt.number = true                -- 行番号表示
opt.relativenumber = true        -- 相対行番号
opt.cursorline = true            -- 現在行をハイライト
opt.termguicolors = true         -- True Color対応
opt.signcolumn = "yes"           -- サインカラムを常に表示
opt.showmode = false             -- モード表示（INSERT/VISUALなど）を非表示
opt.ruler = false                -- ルーラーを非表示（lualineで代替）
opt.laststatus = 3               -- グローバルステータスライン
opt.cmdheight = 1                -- コマンドラインの高さ

-- インデントと整形関連
opt.expandtab = true             -- タブをスペースに展開
opt.tabstop = 2                  -- タブ幅
opt.shiftwidth = 2               -- 自動インデント幅
opt.smartindent = true           -- スマートインデント
opt.wrap = false                 -- 長い行を折り返さない

-- 検索関連
opt.ignorecase = true            -- 大文字小文字を区別しない
opt.smartcase = true             -- 検索文字列に大文字が含まれている場合は区別する
opt.hlsearch = true              -- 検索結果をハイライト表示

-- 操作関連
opt.clipboard = "unnamedplus"    -- システムクリップボードと連携
opt.scrolloff = 8                -- スクロール時の余白行数
opt.sidescrolloff = 8            -- 横スクロール時の余白列数
opt.mouse = "a"                  -- すべてのモードでマウス有効化
opt.splitright = true            -- 縦分割時は右に新しいウィンドウ
opt.splitbelow = true            -- 横分割時は下に新しいウィンドウ

-- バックアップ・スワップファイル関連
opt.backup = false               -- バックアップファイルを作成しない
opt.swapfile = false             -- スワップファイルを作成しない
opt.undofile = true              -- 永続的なundoを有効化

-- パフォーマンス関連
opt.updatetime = 250             -- キー入力待機時間
opt.timeoutlen = 300             -- キーマップの待機時間

-- その他
opt.fileencoding = "utf-8"       -- ファイルエンコーディング
opt.completeopt = "menuone,noselect" -- 補完オプション
