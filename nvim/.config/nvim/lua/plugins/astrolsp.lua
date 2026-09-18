return {
  {
    "AstroNvim/astrolsp",
    opts = {
      -- Mason-packages: alleen servers die Mason kent
      ensure_installed = {
        "jdtls",
      },
      -- servers die niet via Mason lopen, maar wel via AstroLSP opgezet moeten worden
      servers = {
        "kotlin_lsp",
      },
      config = {
        kotlin_lsp = {
          cmd = { "kotlin-lsp", "--stdio" },
          filetypes = { "kotlin" },
          root_markers = { "build.gradle", "build.gradle.kts", "settings.gradle.kts", "pom.xml" },
          single_file_support = false,
        },
        -- tailwindcss = {
        --   settings = {
        --     tailwindCSS = {
        --       experimental = {
        --         configFile = "/Users/joel.kema/Developer/sombrero/tooling/tailwind/src/tailwind.css",
        --       },
        --     },
        --   },
        -- },
      },
    },
  },
}
