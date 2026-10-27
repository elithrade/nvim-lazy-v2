# 💤 nvim-lazy-v2

My Neovim config, built on [LazyVim](https://github.com/LazyVim/LazyVim) with [snacks.nvim](https://github.com/folke/snacks.nvim) as the picker, [oil.nvim](https://github.com/stevearc/oil.nvim) for file editing, and C# / TypeScript tooling.

## Installation

### WSL / Linux (recommended)

Installed automatically by [.dotfiles-wsl-v2](https://github.com/elithrade/.dotfiles-wsl-v2): its `./install` clones this repo to `~/.config/nvim`, installs Neovim (via bob) and every dependency below, then runs headless Neovim to install the plugins, Mason tools and treesitter parsers. The first `nvim` launch is ready to use.

Manual install:

```sh
git clone https://github.com/elithrade/nvim-lazy-v2.git ~/.config/nvim
git -C ~/.config/nvim remote set-url --push origin git@github.com:elithrade/nvim-lazy-v2.git
nvim   # installs plugins on first launch, Mason tools install in the background
```

### Windows

```powershell
git clone https://github.com/elithrade/nvim-lazy-v2.git $env:LOCALAPPDATA\nvim
```

Install the dependencies with [chocolatey](https://chocolatey.org/install), in an **admin** shell:

```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make nodejs
```

`options.lua` switches the shell to `pwsh` on Windows.

### Dependencies

| Tool | Used for |
|---|---|
| Neovim 0.11+ | |
| git, gcc, make | lazy.nvim, building plugins |
| ripgrep, fd | snacks picker file search and grep |
| Node.js + npm | Mason installs most LSP servers, prettier, eslint through npm |
| .NET 10 SDK | roslyn language server, csharpier |
| csharpier | C# formatting, installed as a global dotnet tool: `dotnet tool install -g csharpier` (must be on `PATH`, e.g. `~/.dotnet/tools`) |
| chafa | dashboard image (`walls/flower.jpg`) |
| tree-sitter CLI | building treesitter parsers, installed by Mason |

Check for anything missing with `:checkhealth`.

## Updating

- Plugins: `<leader>l` then `U` (or `:Lazy update`), then commit and push `lazy-lock.json` so other machines install the same versions
- Mason tools: `:Mason`, then `U`
- LazyVim extras: `:LazyExtras` (saved to `lazyvim.json`)

## Language support

Enabled extras (`lazyvim.json`): TypeScript, Tailwind, JSON, Markdown, Prettier, ESLint, DAP, neotest, mini-surround, smear-cursor.

C# ([csharp.lua](./lua/plugins/csharp.lua)):

- LSP: [roslyn.nvim](https://github.com/seblyng/roslyn.nvim) with `roslyn-language-server` from Mason, OmniSharp is disabled
- Formatting: csharpier through conform.nvim
- Debugging: netcoredbg (Mason) through nvim-dap
- Tests: [neotest-vstest](https://github.com/nsidorenco/neotest-vstest), debugging tests uses netcoredbg
- .NET location: on machines where .NET is managed by asdf (work), `DOTNET_ROOT` is set to the asdf install so roslyn finds it. Elsewhere the system-wide install (e.g. `/usr/lib/dotnet`) is used. Update the version in `csharp.lua` when the asdf .NET version changes.

TypeScript uses `vtsls`, `ts_ls` is disabled. Tests use [neotest-vitest](https://github.com/marilari88/neotest-vitest).

## Key maps

Leader is `Space`, local leader is `\` (LazyVim defaults). All LazyVim [default key maps](https://www.lazyvim.org/keymaps) apply, plus:

### Pickers ([snacks.lua](./lua/plugins/snacks.lua))

| Keys | Action |
|---|---|
| `\f` | Find files, including hidden |
| `\r` | Live grep |
| `\\` | Open buffers (starts in normal mode, `dd` deletes a buffer) |
| `\;` | Resume last picker |
| `\e` | Diagnostics |
| `\s` | LSP symbols |
| `\h` | Help tags |
| `\p` | Find a plugin file |
| `<leader>e` | File explorer at the current file's folder (`-` goes up) |
| `<leader>o` | [oil.nvim](./lua/plugins/oil.lua), edit the file system like a buffer (`q` / `Esc` closes) |

### Editing and navigation ([keymaps.lua](./lua/config/keymaps.lua))

| Keys | Action |
|---|---|
| `+` / `-` | Increment / decrement number |
| `Ctrl+d` / `Ctrl+u`, `n` / `N` | Scroll / search, keeping the cursor centred |
| `dW` | Delete the word backwards |
| `Tab` / `Shift+Tab` | Next / previous buffer |
| `Ctrl+h/j/k/l` | Move between Neovim splits and tmux panes ([vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator)) |

### Debugging

| Keys | Action |
|---|---|
| `F8` | Toggle breakpoint |
| `F5` / `F9` | Continue |
| `F10` / `Shift+F10` | Step over / step into |
| `F12` | Hover variable |

## Other tweaks

- Colorscheme: [catppuccin](./lua/plugins/colorscheme.lua)
- Dashboard with a chafa-rendered image ([dash.lua](./lua/plugins/dash.lua)), other images in `walls/`
- Lualine shows only the first letter of the mode, no section separators
- LSP: no inline diagnostics (virtual text) and no inlay hints ([coding.lua](./lua/plugins/coding.lua))
- noice.nvim: hover docs have a border, the signature popup doesn't open automatically, "No information available" is hidden ([ui.lua](./lua/plugins/ui.lua))
- Completion: friendly-snippets disabled, emoji source added to blink.cmp ([cmp.lua](./lua/plugins/cmp.lua))
- [flash.nvim](https://github.com/folke/flash.nvim) disabled
- Colour column at 80
