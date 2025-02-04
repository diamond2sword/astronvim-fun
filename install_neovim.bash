#!/bin/bash

pkg install wget git clang

{
	# misc
	pkg install which termux-api lua54
}

{
	# git.bash
	pkg install gh expect
}

{
	# treesitter
	pkg install clang

	# lsp
	pkg install lua-language-server clang

	# debug
	pkg install gdb lldb
}

#https://docs.astronvim.com/
{
	#https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
	# mkdir -p ~/downloads/JetBrainsMono
	# (
	# 	cd ~/downloads/JetBrainsMono
	# 	curl -LJO "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
	# 	unzip JetBrainsMono.zip
	# 	cp JetBrainsMonoNerdFontMono-Regular.ttf ~/.termux/font.ttf
	# 	termux-reload-settings
	# )
	# rm -rf ~/downloads/JetBrainsMono
	(
		mkdir -p ~/.termux
		cd ~/.termux
		curl -LJO https://raw.githubusercontent.com/diamond2sword/astronvim-fun/refs/heads/main/font/JetBrainsMonoNerdFontMono-Regular.ttf
	)

	pkg install neovim

	git clone https://github.com/diamond2sword/astronvim-fun ~/.config/nvim

	nvim
}
