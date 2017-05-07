;; To launch Emacs with another .emacs than the $HOME one :
;; emacs -q(--no-init-file) -l .emacs_to_load
; remove clutter
(menu-bar-mode -1)
(tool-bar-mode -1)

; set theme
(custom-set-variables
 '(custom-enabled-themes (quote (wombat)))
 )

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(unless (package-installed-p 'scala-mode)
  (package-refresh-contents) (package-install 'scala-mode))

(unless (package-installed-p 'go-mode)
  (package-refresh-contents) (package-install 'go-mode))

; no ~ files
(setq make-backup-files nil)

; json 2 spaces indent with js mode
(setq js-indent-level 2)
; no tabs
(setq-default indent-tabs-mode nil)

(eval-after-load 'php-mode
  '(require 'php-ext))
