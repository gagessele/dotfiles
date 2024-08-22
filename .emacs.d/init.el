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
	backup-by-copying t
	delete-old-versions t
	inhibit-splash-screen t
	kept-new-versions 6
	kept-old-versions 2
	version-control t))

(use-package clojure-mode
  :ensure t)

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
  :hook
  (go-mode . eglot-ensure)
  (before-save . gofmt-before-save))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(go-mode orderless marginalia cider corfu magit paredit vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
