require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  html = {},
  cssls = {},
  gopls = {},
  vtsls = {},
  yamlls = {},
  zls = {},
  rust_analyzer = {},
  lua_ls = {
    settings = {
      Lua = {
        version = "LuaJIT",
        diagnostics = {
          globals = { "love", "jit" },
        },
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME,
            '/Applications/love.app/Contents/Resources/',
          },
        }
      }
    }
  },
  bicep = {
    cmd = { "dotnet", "/Users/aaron/.local/share/nvim/mason/packages/bicep-lsp/extension/bicepLanguageServer/Bicep.LangServer.dll" },
    filetypes = { "bicep" },
  }
}

local nvlsp = require "nvchad.configs.lspconfig"

for name, config in pairs(servers) do
  local server_config = {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }

  -- Add cmd if specified
  if config.cmd then
    server_config.cmd = config.cmd
  end

  -- Add filetypes if specified (fallback to default filetypes)
  if config.filetypes then
    server_config.filetypes = config.filetypes
  end

  -- Add settings if specified
  if config.settings then
    server_config.settings = config.settings
  end

  lspconfig[name].setup(server_config)
end
