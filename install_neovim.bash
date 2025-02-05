#!/bin/bash

pkg install wget git clang ripgrep

{
	# misc
	pkg install which termux-api lua54
}

{
	# git.bash
	pkg install gh expect
}

{
	#go-to-definition
	pkg install man
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
	(
		mkdir -p ~/.termux
		curl -LJ -o ~/.termux/font.ttf  https://raw.githubusercontent.com/diamond2sword/astronvim-fun/refs/heads/main/font/JetBrainsMonoNerdFontMono-Regular.ttf
		termux-reload-settings
	)

	pkg install neovim

	git clone https://github.com/diamond2sword/astronvim-fun ~/.config/nvim

	nvim --headless +'AstroUpdate' +q
	nvim --headless +'Lazy! sync' +q
}
