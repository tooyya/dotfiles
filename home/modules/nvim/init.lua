-- Neovim初期化ファイル
-- このファイルはHome Managerによって管理されています

-- 基本設定を読み込む
require('config.options')
require('config.keymaps')

-- lazy.nvimを初期化し、プラグインを管理
require('config.lazy')
