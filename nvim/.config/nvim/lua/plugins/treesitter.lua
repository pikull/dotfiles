return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")

      ts.install({
        "python",
        "c",
        "cpp",
        "java",
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "lua",
        "vim",
        "vimdoc",
      })

      vim.api.nvim_create_autocmd("FileType", {
        desc = "Enable Treesitter syntax highlighting natively",
        callback = function()
          -- pcall prevents errors from throwing if a parser isn't installed yet
          pcall(vim.treesitter.start) 
        end,
      })

      -- This replicates your old rule of enabling indent, but disabling for C/C++
      vim.api.nvim_create_autocmd("FileType", {
        desc = "Enable Treesitter indentation (with exclusions)",
        callback = function(args)
          local disabled_langs = { c = true, cpp = true }
          if not disabled_langs[args.match] then
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
}
