# nvim

My neovim setup, tried to go as lightweight as possible while still keeping key IDE functionality. I'm a full-stack web developer, most of my work is in React/Typescript and Golang. I've tried to give a brief reason as to why I use each plugin.

![image](https://github.com/user-attachments/assets/0ae5411f-c5e4-4ada-b9b4-34ed3ae469ae)

## Plugin Overview

### Plugin Manager
- **[folke/lazy.nvim](https://github.com/folke/lazy.nvim)** - The GOAT no?

### Navigation
- **[stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)** - Navigate and edit files in a buffer
- **[refractalize/oil-git-status.nvim](https://github.com/refractalize/oil-git-status.nvim)**  - Integrates git status into Oil
- **[ThePrimeagen/harpoon (harpoon2)](https://github.com/ThePrimeagen/harpoon/tree/harpoon2)**  - Quick file/project navigation
- **[nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)** - Fuzzy finder and picker framework

### UI
- **[nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)** - Simple statusline, no frills
- **[rachartier/tiny-code-action.nvim](https://github.com/rachartier/tiny-code-action.nvim)** - Code action menu with a preview of the change
- **[lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)**  - Git signs in the gutter and inline blame
- **[nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)** - Syntax highlighting and parsing

### Colorscheme
- **[folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)** - Modified to have a darker background

### LSP & Diagnostics
- **[neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)**  - Configures built-in LSP
- **[mason-org/mason.nvim](https://github.com/mason-org/mason.nvim)** - Install LSP servers
-  **[mason-org/mason-lspconfig.nvim](https://github.com/mason-org/mason-lspconfig.nvim)** - Automatically enables installed LSP's, keeps config nice and minimal/readable
- **[WhoIsSethDaniel/mason-tool-installer.nvim](https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim)**  - Automates installation of required tools (language servers and formatters)
- **[artemave/workspace-diagnostics.nvim](https://github.com/artemave/workspace-diagnostics.nvim)** - Populates diagnostics across the workspace

### Completion & Snippets
- **[saghen/blink.cmp](https://github.com/saghen/blink.cmp)** - Fast completion engine
- **[L3MON4D3/LuaSnip](https://github.com/L3MON4D3/LuaSnip)**  - Snippet engine
- **[folke/lazydev.nvim](https://github.com/folke/lazydev.nvim)** - Lua development tools for completions and gets rid of annoying "vim is not defined as a global"

### Formatting & Autotag
- **[stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)** - Formats on save, nuff said
- **[windwp/nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)** - Auto-closing and renaming of HTML/JSX tags

### Testing
- **[nvim-neotest/neotest](https://github.com/nvim-neotest/neotest)** - Test runner

### AI
- **[olimorris/codecompanion.nvim](https://github.com/olimorris/codecompanion.nvim)** - AI assistant

### Other
- **[JoosepAlviste/nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)** - Context-aware commenting in typescript
- **[j-hui/fidget.nvim](https://github.com/j-hui/fidget.nvim)** - LSP progress and notifications
- **[MeanderingProgrammer/render-markdown.nvim](https://github.com/MeanderingProgrammer/render-markdown.nvim)** - Markdown preview in Neovim

---

**For a full list of plugins and configuration, see the [lua/plugins/](./lua/plugins/) directory.**
