#!/bin/bash

pkg install wget git clang which termux-api lua54

{
	# lsp
	pkg install lua-language-server clang

	# debug
	pkg install gdb lldb
}

#https://docs.astronvim.com/
{
	#https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip
	mkdir -p ~/downloads/JetBrainsMono
	(
		cd ~/downloads/JetBrainsMono
		curl -LJO "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/JetBrainsMono.zip"
		unzip JetBrainsMono.zip
		cp JetBrainsMonoNerdFontMono-Regular.ttf ~/.termux/font.ttf
		termux-reload-settings
	)
	rm -rf ~/downloads/JetBrainsMono

	pkg install neovim

	pkg install nodejs-lts

	git clone https://github.com/diamond2sword/astronvim-fun ~/.config/nvim

	nvim
}

{
	# git.bash
	pkg install gh expect
}
