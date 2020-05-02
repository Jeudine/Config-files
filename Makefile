BASHRC	:= ~/.bashrc
XMONAD	:= ~/.xmonad/xmonad.hs
XMOBAR	:= ~/.xmonad/xmobar.hs
XSESSION:= ~/.xsession
KITTY	:= ~/.config/kitty/kitty.conf
NEOVIM	:= ~/.config/nvim

TARGETS	= $(BASHRC) $(XMONAD) $(XSESSION) $(KITTY) $(XMOBAR) $(NEOVIM)

ABSPATH	:= $(realpath .)

install: $(TARGETS)

clean:
	$(RM) $(TARGETS)

$(TARGETS):
	FILE="$(shell echo $@ | rev | cut -d '/' -f 1 | rev)";\
	ln -sv $(ABSPATH)/$$FILE $@

.PHONY: install clean
