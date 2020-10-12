(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(setq lsp-eldoc-hook nil)
(setq lsp-prefer-flymake nil)



;; Evil mode
(use-package evil
  :defer 2
  :init (evil-mode t))

(use-package exec-path-from-shell)

;; Yasnippet
(use-package yasnippet
  :config (yas-global-mode))

;; Format all
(use-package format-all
  :defer t)

;; UI based modules
(use-package atom-one-dark-theme
  :init (load-theme 'atom-one-dark t))
(use-package ivy
  :defer 1
  :init (ivy-mode t))
(use-package doom-modeline
  :init (doom-modeline-mode t))

;; vterm module
(use-package vterm
    :defer 2)

;; Function to set treemacs font and load custom theme
(defun init-treemacs ()
  (dolist (face '(treemacs-root-face
                    treemacs-git-unmodified-face
                    treemacs-git-modified-face
                    treemacs-git-renamed-face
                    treemacs-git-ignored-face
                    treemacs-git-untracked-face
                    treemacs-git-added-face
                    treemacs-git-conflict-face
                    treemacs-directory-face
                    treemacs-directory-collapsed-face
                    treemacs-file-face
                    treemacs-tags-face))
    (set-face-attribute face nil :weight 'semi-light :family "Noto Sans TC" :height 100))
    (load-library "treemacs-theme/theme"))

;; Treemacs and evil bindings
(use-package treemacs
	:defer t
  :commands treemacs
  :config (init-treemacs))
(use-package treemacs-evil
  :after (treemacs))

;; Langage server related extensions
(defun lsp-setup ()
  (add-hook 'before-save-hook #'format-all-buffer nil t)
  (lsp))

(use-package lsp-mode
  :hook (
	 ((
		 dart-mode
	   web-mode
	   python-mode
	 ) . lsp-setup)))

(use-package lsp-dart
	:defer t)
(use-package lsp-python-ms
  :defer 3
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred

(use-package lsp-ui
  :config
     (setq lsp-ui-doc-enable t
     lsp-ui-doc-position 'at-point
     lsp-ui-doc-include-signature t))

;; Auto completion and flycheck
(use-package company
  :after lsp-ui)
(use-package flycheck
  :after lsp-ui)

;; Starup profiling
(use-package esup
  :commands esup)

;; Languages
(use-package web-mode
  :mode ("\\.tsx?$" "\\.jsx?$"))

;; Aesthetics
(use-package all-the-icons
  :config (setq all-the-icons-scale-factor 1.0))
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))
