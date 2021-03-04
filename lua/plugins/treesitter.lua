require'nvim-treesitter.configs'.setup {
  -- 設定された言語のparserがインストールされていない場合、
  -- インストールします。
  ensure_installed = {'ruby', 'lua', 'rust', 'go', 'typescript', 'tsx'},

  highlight = {
    -- `false` の場合、highlight機能を動かしません。
    enable = true,

    -- highlightの機能を無効にする、filetypeを指定します。
    disable = { "bash", "c" },
  },

  incremental_selection = {
    enable = true,

    keymaps = {
      -- 範囲選択を開始します。
      init_selection = "gnn",

      -- 1つ上のnodeに選択範囲を拡大します。
      node_incremental = "grn",

      -- 1つ上のスコープに選択範囲を拡大します。
      scope_incremental = "grc",

      -- 1つ下のnodeに選択範囲を縮小します。
      node_decremental = "grm",
    },
  },

  indent = {
    enable = true
  },

  textobjects = {
    -- `ip` や `ap` のようにtextobjectを選択します。
    select = {
      enable = true,
     keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
    -- 前後のtextobjectに移動します。
    move = {
      enable = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },

    -- 関数の引数の位置を交換します。
    swap = {
      enable = true,
      swap_next = {
        ["<leader>a"] = "@parameter.inner",
      },
      swap_previous = {
        ["<leader>A"] = "@parameter.inner",
      },
    },

    -- textobject全体をfloating windowを使って表示します。
    lsp_interop = {
      enable = true,
      peek_definition_code = {
        ["df"] = "@function.outer",
        ["dF"] = "@class.outer",
      },
    },
  },
  refactor = {
    -- カーソルの下にあるsymbolの定義位置に移動したり、
    -- 定義されているsymbol一覧を表示します。
    navigation = {
      enable = true,
      keymaps = {
        -- 定義に移動します。
        goto_definition = "gnd",

        -- 定義一覧を表示します。
        list_definitions = "gnD",

        -- 定義一覧を本の目次のようにネストがわかるように表示します。
        list_definitions_toc = "gO",

        -- カーソル下のsymbolの前後の利用位置に移動します。
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },

    -- カーソルの下にあるsymbolをrenameします。
    smart_rename = {
      enable = true,
      keymaps = {
        -- `grr` でrename処理が開始できます。
        smart_rename = "grr",
      },
    },
    -- カーソルの下にあるsymbolをhighlightします。
    highlight_definitions = { enable = true },

    -- カーソルが存在するスコープ全体をhighlightします。
    highlight_current_scope = { enable = true },
  },
  
  -- 括弧の色をネストごとに変更します。
  rainbow = {
    enable = true
  },
} 
