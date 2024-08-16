(use-package emacs
  :init
  ;; startup initial frame maximized
  (add-to-list 'initial-frame-alist '(fullscreen . maximized))
  (set-face-attribute 'default nil :height 240)
  (global-display-line-numbers-mode 1))

(use-package clojure-mode
  :ensure t)

(use-package cider
  :ensure t
  :config
  (setq cider-repl-display-help-banner nil))

(use-package magit
  :ensure t)

(use-package paredit
  :ensure t
  :after (clojure-mode cider)
  :hook (emacs-lisp-mode clojure-mode cider-repl-mode))
