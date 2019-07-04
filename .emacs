;;; Addition package sources:
(require 'package)
  (push '("marmalade" . "http://marmalade-repo.org/packages/")
        package-archives )
  (push '("melpa" . "http://melpa.milkbox.net/packages/")
        package-archives)
  (package-initialize)

;;; VIM-mode:
(require 'evil)
(evil-mode 1)
(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))

;;; Style and theme:
(load-theme 'zenburn t)

;;; Powerline (+ evil support):
(require 'powerline)
(require 'powerline-evil)
(powerline-evil-vim-color-theme)
;;(require 'airline-themes)
