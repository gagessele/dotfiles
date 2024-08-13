(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

(unless (package-installed-p 'paredit)
(package-install 'paredit))

(unless (package-installed-p 'cider)
  (package-install 'cider))

(unless (package-installed-p 'clojure-mode)
  (package-install 'clojure-mode))

(autoload 'enable-paredit-mode "paredit"
  "Turn on pseudo-structural editing of Lisp code."
  t)
(add-hook 'emacs-lisp-mode-hook 'enable-paredit-mode)
(add-hook 'clojure-mode-hook 'enable-paredit-mode)
(add-hook 'cider-repl-mode-hook 'enable-paredit-mode)

(setq cider-save-file-on-load t)

(unless (package-installed-p 'magit)
  (package-install 'magit))

(unless (package-installed-p 'exec-path-from-shell)
  (package-install 'exec-path-from-shell))
(exec-path-from-shell-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-line-numbers t)
 '(package-selected-packages '(magit cider)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "White" :foreground "Black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 150 :width normal :foundry "nil" :family "Menlo")))))

(add-to-list 'initial-frame-alist '(fullscreen . maximized))

