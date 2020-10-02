;; Disable startup screen
(setq inhibit-startup-message t)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq mac-command-modifier 'meta)

(setq custom-file "~/.emacs.d/custom-file.el")
(load-file custom-file)

(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(load-theme 'zenburn)
(evil-mode 1)
(elpy-enable)
