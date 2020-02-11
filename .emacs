;;; Addition package sources:
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)
;(package-refresh-contents)

(unless package-archive-contents (package-refresh-contents))
(package-install-selected-packages) 

;;; VIM-mode:
(unless (package-installed-p 'evil)
  (package-install 'evil))

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
;;; (require 'airline-themes)

(require 'go-mode nil t)

;;; Rust-mode
(require 'rust-mode)
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)

;;; enable KJ for ESC
(require 'key-chord)
(key-chord-mode 1)
(with-eval-after-load 'evil-maps
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-define evil-replace-state-map "jk" 'evil-normal-state)
  (key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
  (global-set-key (kbd "C-s") 'save-buffer)
)

(menu-bar-mode -1)
(setq-default display-line-numbers 'relative)
;(global-display-line-numbers-mode)

;;; https://github.com/keith/evil-tmux-navigator
(require 'navigate)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (rust-mode navigate zenburn-theme zenburn use-package powerline-evil key-chord go-mode evil-visual-mark-mode evil-surround))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
