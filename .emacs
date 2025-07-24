(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
(global-hl-line-mode 1)
(setq make-backup-files nil)
(setq auto-save-default nil)
(add-to-list 'default-frame-alist
	     '(font . "monospace-14"))

(require 'package)
(setq package-archives
      '(("gnu" . "https://elpa.gnu.org/packages/")
        ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(evil-mode 1)

(with-eval-after-load 'evil
  (define-key evil-normal-state-map (kbd "H") 'evil-first-non-blank)
  (define-key evil-normal-state-map (kbd "L") 'evil-end-of-line)
  (define-key evil-visual-state-map (kbd "H") 'evil-first-non-blank)
  (define-key evil-visual-state-map (kbd "L") 'evil-end-of-line)
  (define-key evil-normal-state-map (kbd "M-x") 'execute-extended-command))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
