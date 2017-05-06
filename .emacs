;; To launch Emacs with another .emacs than the $HOME one :
;; emacs -q(--no-init-file) -l .emacs_to_load

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

(unless (package-installed-p 'go-mode)
  (package-refresh-contents) (package-install 'go-mode))

; remove clutter
(menu-bar-mode nil)
(tool-bar-mode nil)

; set theme
(custom-enabled-themes (quote (wombat)))

; no ~ files
(setq make-backup-files nil)

; json 2 spaces indent with js mode
(setq js-indent-level 2)
; no tabs
(setq-default indent-tabs-mode nil)

(eval-after-load 'php-mode
  '(require 'php-ext))
