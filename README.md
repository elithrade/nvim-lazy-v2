# 💤 nvim-lazy

This version of config started from LazyVim v14.x, and the main change is to replace `snacks` with `telescope` for searching files.

My Neovim config files started from [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.
Press Space + L, and U to update plugins.

## Installation

### Clone the repo

For Windows
`git clone git@github.com:elithrade/nvim-lazy.git $env:LOCALAPPDATA\nvim`

For Linux
`git clone git@github.com:elithrade/nvim-lazy.git ~/.config/nvim`

Below you can find OS specific install instructions for Neovim and dependencies.

### Windows Installation

<details><summary>Windows with Microsoft C++ Build Tools and CMake</summary>
Installation may require installing build tools and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```

</details>
<details><summary>Windows with gcc/make using chocolatey</summary>
Alternatively, one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
   either follow the instructions on the page or use winget,
   run in cmd as **admin**:

```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
   open a new one so that choco path is set, and run in cmd as **admin**:

```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```

</details>
<details><summary>WSL (Windows Subsystem for Linux)</summary>

```
wsl --install
wsl
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip neovim
```

</details>

### Linux Installation

<details><summary>Ubuntu Install Steps</summary>

```
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install make gcc ripgrep unzip neovim
```

</details>

### Dependencies

- [ripgrep](https://github.com/BurntSushi/ripgrep), is required for live_grep and grep_string and is the first priority for find_files.
- On Linux, `fd` might cause issues with telescope-file-browser, I removed `fd` from my WSL2 at work.

## Custom key maps

See comment [here](./lua/config/keymaps.lua)

## Custom tweaks

- Custom colorscheme defined in [colorscheme.lua](./lua/plugins/colorscheme.lua)
- Add [telescope-file-browser.nvim](https://github.com/nvim-telescope/telescope-file-browser.nvim) extension and [remapped default keys](./lua/plugins/editor.lua). Most telescope-file-browser keys starts with `;`, `sf` to open telescope-file-browser.
- Suppress "No information available" notification in [noice.nvim](https://www.google.com/url?sa=t&source=web&rct=j&opi=89978449&url=https://github.com/folke/noice.nvim&ved=2ahUKEwiYmd_s3I6FAxX_s1YBHTSyDqAQFnoECAYQAQ&usg=AOvVaw1sogSR1BTc2Hp5hZ7TNBpv).
- Add a border to hover over documentation when press Shift + K.
- Change default notification timeout to 10 seconds.
- Disabled [flash.nvim](https://github.com/folke/flash.nvim)
- Disabled "o" and "<C-o>>" mapping to launch file default system application.
- Disabled [nvim-neo-tree/neo-tree.nvim](https://github.com/nvim-neo-tree/neo-tree.nvim) plugin.
- Added a [scroll animation](https://github.com/echasnovski/mini.animate) for fun.
- Added few [coding](./lua/plugins/coding.lua) related plugins.
