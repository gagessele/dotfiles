;;; package --- Summary
;;; Commentary:
;;; Code:
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(setq package-selected-packages '(cider
				  clojure-mode
				  corfu
				  flycheck
				  flycheck-clj-kondo
				  go-mode
				  magit
				  marginalia
				  orderless
				  paredit
				  vertico))


(package-initialize)

(use-package emacs
  :custom
  ;; Support opening new minibuffers from inside existing minibuffers.
  (enable-recursive-minibuffers t)
  ;; Emacs 28 and newer: Hide commands in M-x which do not apply to the current
  ;; mode.  Corfu commands are hidden, since they are not used via M-x. This
  ;; setting is useful beyond Corfu.
  (read-extended-command-predicate #'command-completion-default-include-p)
  ;; Enable indentation+completion using the TAB key.
  ;; `completion-at-point' is often bound to M-TAB.
  (tab-always-indent 'complete)
  :init
  ;; startup initial frame maximized
  (add-to-list 'initial-frame-alist '(fullscreen . maximized))
  (set-face-attribute 'default nil :height 180)
  (global-display-line-numbers-mode 1)
  (setq backup-directory-alist '(("." . "~/.emacs.d/backups"))
	auto-save-file-name-transforms '((".*" "~/.emacs.d/autosaves/\\1" t))
	backup-by-copying t
	delete-old-versions t
	inhibit-splash-screen t
	kept-new-versions 6
	kept-old-versions 2
	version-control t)
  (make-directory "~/.emacs.d/autosaves/" t))

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode))

(use-package flycheck-clj-kondo
  :ensure t)

(use-package clojure-mode
  :ensure t
  :config
  (require 'flycheck-clj-kondo))

;; (use-package clojure-ts-mode
;;   :ensure t
;;   :config
;;   (require 'flycheck-clj-kondo))

(use-package cider
  :ensure t
  :config
  (setq cider-repl-display-help-banner nil))

(use-package corfu
  :ensure t
  :init
  (global-corfu-mode))

(use-package go-mode
  :ensure t
  :mode "\\.go\\'"
  :init
  (setq gofmt-command "goimports")
  :hook
  (go-mode . eglot-ensure)
  (before-save . gofmt-before-save))

(use-package yaml-mode
  :ensure t
  :mode ("\\.yaml\\'" "\\.yml\\'"))

;; (use-package eglot
;;   :hook
;;   (clojure-mode . eglot-ensure)
;;   (go-mode . eglot-ensure))

(use-package magit
  :ensure t)

(use-package marginalia
  :ensure t
  ;; Bind `marginalia-cycle' locally in the minibuffer.  To make the binding
  ;; available in the *Completions* buffer, add it to the
  ;; `completion-list-mode-map'.
  :bind (:map minibuffer-local-map
	      ("M-A" . marginalia-cycle))
  :init
  (marginalia-mode))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

(use-package paredit
  :ensure t
  :after (clojure-mode cider)
  :hook (emacs-lisp-mode clojure-mode cider-repl-mode))

(use-package vertico
  :ensure t
  :init
  (vertico-mode))

;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(clojure-ts-mode cider clojure-mode corfu flycheck flycheck-clj-kondo go-mode magit marginalia orderless paredit vertico))
 '(safe-local-variable-values
   '((inf-clojure-custom-repl-type . clojure)
     (inf-clojure-custom-startup . "clojure -A:dev"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
