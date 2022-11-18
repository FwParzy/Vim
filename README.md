# My configs
All of my configs and .rc files that I need to properly function.  
Make sure Brew is installed before continuing.  
  
## To install tmux :
1. $ `Brew install tmux`
1. $ `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
1. Open Tmux and do `ctrl-a + I`

## To Install Vim :
1. Open Vim and do :`PlugInstall`
1. Should be good? Idk been a while since i set it up. Will add extra steps for more robust plugins.

## To Install NeoVim :
1. $ `Brew install neovim`
1. $ `cd ~/.config/nvim`
1. $ `ln -s ../../MyVim/init.vim init.vim` -- creating a symlink from your config to the repo
1. Install LSPs with brew that are located in `nvim/lua/isaac/lsp/null-ls.lua`
1. open up nvim and do : `LspInstall jdtls@1.12.0-202206011637`
    - This is the most stable version of jdtls at the time of 9/24/2022
1. Open up Nvim and go to the plugins.lua file and save the file to install plugins. Do this a few times.

## Nerdfonts
1. [I am using Hurmit nerdfont at the moment](https://www.programmingfonts.org/#hermit)  
   
## Other
1. If nvim in tmux looks horrible you need to figure out how to enable *italics* for tmux and your perfered term
1. We have to do some extra steps if neovim is installed inside wsl [clipboard fix](https://github.com/neovim/neovim/wiki/FAQ#how-to-use-the-windows-clipboard-from-wsl)   
  
  
| Class Name                    | DAYS | Time              | Date        |
| ----------------------------- | ---- | ----------------- | ----------- |
| Internet Software Development | MW   | 05:30 pm-08:20 pm | 03/13-05/04 |
| Systems Analysis and Design   | TR   | 01:00 pm-02:15 pm | 01/17-05/04 |
| Comp Sci 2                    | MW   | 01:30 pm-03:15 pm | 01/17-05/04 |
| ASSEMBLY & COMPUTER ORG       | MW   | 08:00 am-09:15 am | 01/17-05/04 | 
