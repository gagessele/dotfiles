;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-selected-packages '(cider
				  clojure-mode
				  corfu
				  exec-path-from-shell
				  flycheck
				  flycheck-clj-kondo
				  go-mode
				  magit
				  marginalia
				  orderless
				  paredit
				  vertico))


(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)

(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Hide commands in M-x which do not apply to the current mode.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)
  :init
  ;; Add all your customizations prior to loading the themes
  (setq modus-themes-italic-constructs t
        modus-themes-bold-constructs nil
        modus-themes-region '(bg-only no-extend))
  ;; startup initial frame maximized
  (add-to-list 'initial-frame-alist '(fullscreen . maximized))
  (set-face-attribute 'default nil :height 180)
  (global-display-line-numbers-mode 1)
  (setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
	auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t))
	backup-by-copying t
	delete-old-versions t
	kept-new-versions 6
	kept-old-versions 2
	version-control t)
  (make-directory "~/.emacs.d/autosaves/" t)
  :config
  ;; Load theme of your choice
  (load-theme 'modus-operandi t)
  :bind ("<f5>" . modus-themes-toggle))

(use-package dired
  :defer t
  :config
  (when (and (eq system-type 'darwin) (executable-find "gls"))
    (setq insert-directory-program "gls")))

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize))

(use-package flycheck
  :init
  (global-flycheck-mode))

(use-package flycheck-clj-kondo)

(use-package cider
  :config
  (setq cider-repl-display-help-banner nil))

(use-package clojure-mode
  :config
  (require 'flycheck-clj-kondo))

(use-package corfu
  :init
  (global-corfu-mode))

(use-package go-mode
  :mode "\\.go\\'"
  :init
  (setq gofmt-command "goimports")
  :hook
  (go-mode . eglot-ensure)
  (before-save . gofmt-before-save))

(use-package yaml-mode
  :mode ("\\.yaml\\'" "\\.yml\\'"))

(use-package magit)

(use-package marginalia
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package orderless
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package paredit
  :hook (emacs-lisp-mode clojure-mode cider-repl-mode))

(use-package vertico
  :init
  (vertico-mode))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((inf-clojure-custom-repl-type . clojure)
     (inf-clojure-custom-startup . "clojure -A:dev"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
