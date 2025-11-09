(setq debug-on-error t)

;; startup
(setq gc-cons-threshold (* 100 1000 1000))
(add-hook 'emacs-startup-hook #'(lambda () (message "Startup in %s sec with %d garbage collections" (emacs-init-time "%.2f") gcs-done)))

(tool-bar-mode -1)
(menu-bar-mode -1)
(tab-bar-mode 1)
(scroll-bar-mode 0)
(global-hl-line-mode 1)
(blink-cursor-mode -1)
(which-key-mode)
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode t)

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name
        "straight/repos/straight.el/bootstrap.el"
        (or (bound-and-true-p straight-base-dir)
            user-emacs-directory)))
      (bootstrap-version 7))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t
      use-package-always-defer t)

(use-package emacs
  :init
  (set-frame-font "monospace-14" nil t)
  (set-charset-priority 'unicode)
  (setq locale-coding-system 'utf-8
	coding-system-for-read 'utf-8
	coding-system-for-write 'utf-8)
  (set-terminal-coding-system 'utf-8)
  (set-keyboard-coding-system 'utf-8)
  (set-selection-coding-system 'utf-8)
  (prefer-coding-system 'utf-8)
  (setq default-process-coding-system '(utf-8-unix . utf-8-unix))

  (setq-default indent-tabs-mode nil
		tab-width 8)
  
  (setq initial-scratch-message nil
	inhibit-splash-screen t
	use-file-dialog nil
        use-dialog-box nil
	make-backup-files nil
	auto-save-default nil)
  (fset 'yes-or-no-p 'y-or-n-p))

(use-package evil
  :demand
  :init
  (setq evil-want-C-u-scroll t)
  :config
  (evil-mode 1))

(use-package gruvbox-theme
  :demand
  :config
  (load-theme 'gruvbox-dark-hard t))

(use-package eglot
  :straight (:type built-in)
  :hook ((c-mode . eglot-ensure)
         (c++-mode . eglot-ensure)))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

(use-package paredit
  :ensure t)

(use-package elisp-format
  :ensure t)

(electric-pair-mode 1)
(add-hook 'scheme-mode-hook #'paredit-mode)

(use-package rainbow-delimiters
  :ensure t
  :hook (scheme-mode . rainbow-delimiters-mode))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
              ("C-c p" . projectile-command-map)))

(use-package company
  :ensure t
  :hook (prog-mode . company-mode))

(defun my-c-mode-hook ()
  (setq c-basic-offset 8)
  (setq tab-width 8)
  (setq indent-tabs-mode nil))

(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

(use-package tree-sitter
  :hook ((prog-mode . turn-on-tree-sitter-mode)
         (tree-sitter-after-on . tree-sitter-hl-mode)))

(use-package tree-sitter-langs
  :after
  tree-sitter)
