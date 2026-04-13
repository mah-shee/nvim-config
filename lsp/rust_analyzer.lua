return {
	settings = {
		["rust-analyzer"] = {
			-- ワーカースレッド: 0=自動検出（全コア使用）
			numThreads = 0,

			-- キャッシュプライミング: バックグラウンドで事前にキャッシュ構築
			cachePriming = {
				enable = true,
				numThreads = 0, -- 0=自動検出
			},

			-- cargo設定
			cargo = {
				buildScripts = {
					enable = true,
					-- 保存時にbuild scriptsを再実行しない（初回のみ）
					rebuildOnSave = false,
					-- rustcラッパー使用で高速化
					useRustcWrapper = true,
				},
			},

			-- proc macro: 有効（build scriptsと連動）
			procMacro = { enable = true },

			-- check on save: clippyの代わりにcheckを使い高速化
			check = {
				command = "check",
			},

			-- ファイル監視: サーバーサイドで効率的に監視
			files = {
				watcher = "server",
			},

			-- diagnostics: 初期ロード時の負荷軽減
			diagnostics = {
				-- 起動時の実験的diagnosticsを無効化
				experimental = { enable = false },
			},

			-- imports設定
			imports = {
				prefix = "self",
				merge = { glob = true },
			},

			-- inlay hints
			inlayHints = {
				lifetimeElisionHints = { enable = "always" },
				bindingModeHints = { enable = true },
				expressionAdjustmentHints = { enable = true },
				-- 最大長制限でレンダリング負荷軽減
				maxLength = 25,
			},

			-- ワークスペースシンボル検索の範囲を制限
			workspace = {
				symbol = {
					search = {
						scope = "workspace",
						limit = 128,
					},
				},
			},

			-- LRUキャッシュ容量を増やしてre-analysis軽減
			lru = {
				capacity = 256,
			},
		}
	},
}
