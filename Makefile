.PHONY: all
all: mimic.el

mimic.el: make.el mimic-template.el do-evil.el
	emacs --batch -l make.el
