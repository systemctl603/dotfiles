;;; -*- lexical-binding: t -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

;; Configures `straight.el' to check for packages only when saved in emacs
;; WARN: Speeds up startup time, but modification of packages must be done within emacs.
(setq straight-check-for-modifications 'live)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el"
			 user-emacs-directory)) 
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

(use-package 
  evil 
  :init 
  (setq evil-want-intergration t) 
  (setq evil-want-keybinding nil) 
  :hook (window-setup . evil-mode))
;; Configure `treemacs' to use `evil'
(use-package 
  treemacs-evil 
  :after treemacs)

(use-package yasnippet 
  :defer t 
  :hook (prog-mode . yas-minor-mode)) 
(use-package yasnippet-snippets 
  :after yasnippet)

(use-package 
  counsel 
  :hook (window-setup . counsel-mode))
(use-package 
  ivy 
  :after counsel 
  :config (ivy-mode t))
(use-package 
  ivy-rich 
  :after counsel 
  :config (ivy-rich-mode t))

(use-package 
  atom-one-dark-theme 
  :hook (after-init . (lambda () 
			(load-theme 'atom-one-dark t))))

(setq frame-resize-pixelwise t)

(use-package 
  doom-modeline 
  :config (progn 
	    (setq doom-modeline-buffer-file-name-style 'file-name)
	    (display-battery-mode t) 
	    (doom-modeline-mode t)))

(use-package 
  treemacs 
  :config (load-file (expand-file-name "lisp/treemacs-theme/theme.el" user-emacs-directory))
  :commands (treemacs))

(setq org-src-tab-acts-natively t
      org-startup-indented t
      org-hide-leading-stars t
      org-edit-src-content-indentation 0)

(use-package rjsx-mode
  :mode "\\.jsx?\\'"
  :config (progn
	    (setq js2-mode-show-parse-errors nil)
	    (setq js2-mode-show-strict-warnings nil)
	    (setq js2-idle-timer-delay 0)))

(use-package json-mode 
  :defer t)

(use-package web-mode 
  :mode ("\\.tsx?\\'" "\\.html?\\'" "\\.s?css\\'"))

(use-package 
  lsp-mode 
  :hook ((rjsx-mode) . lsp-deferred))
(use-package 
  lsp-ui 
  :after lsp-mode 
  :config (progn 
	    (setq lsp-ui-doc-enable t) 
	    (setq lsp-ui-doc-header t)
	    (setq lsp-ui-doc-include-signature t) 
	    (setq lsp-ui-doc-alignment 'frame)
	    (setq lsp-ui-doc-position 'at-point) 
	    (setq lsp-ui-doc-delay 1.5)
	    ;; Disable `eldoc' in `lsp-ui'
	    (setq lsp-eldoc-enable-hover nil) 
	    (setq lsp-eldoc-hook nil)))

(use-package 
  company
  :init (setq company-minimum-prefix-length 1
	      company-idle-delay 0.0
	      company-auto-complete nil
	      company-auto-complete-chars nil
	      company-backends '((company-yasnippet
				  company-capf
				  company-files
				  company-dabbrev-code
				  company-dabbrev))) 
  :hook (window-setup . global-company-mode))

(use-package flycheck
  :hook (after-init . flycheck-mode))

(use-package apheleia
  :straight '(apheleia :host github :repo "raxod502/apheleia")
  :hook (window-setup . apheleia-global-mode)
  :config (progn
	    (setf (alist-get 'prettier apheleia-formatters)
		  '("prettier" "--bracket-spacing" "--stdin-filepath" filepath))))

(use-package magit 
  :commands magit-status) 
;; Configure `evil-magit' for evil bindings 
(use-package evil-magit 
  :after magit)

(use-package 
  general 
  :config (progn
	    ;; Open and close `treemacs'
	    (general-define-key :prefix "SPC o" 
				:keymaps 'normal 
				"t" #'treemacs)
	    (general-define-key :prefix "SPC o" 
				:keymaps 'treemacs-mode-map 
				:states 'treemacs 
				"t" #'treemacs)
	    ;; Add `treemacs' specific bindings
	    (general-define-key :prefix "SPC p"
				:keymaps 'treemacs-mode-map 
				:states 'treemacs 
				"a" #'treemacs-add-project-to-workspace "d"
				#'treemacs-remove-project-from-workspace "r"
				#'treemacs-rename-project "j" #'treemacs-move-project-down "k"
				#'treemacs-move-project-up) ;; Add help bindings
	    (general-define-key :prefix "SPC h" 
				:keymaps 'normal 
				"v" #'counsel-describe-variable "f" #'counsel-describe-function
				"k" #'counsel-descbinds) ;; Define restart and exit bindings
	    (general-define-key :prefix "SPC q" 
				:keymaps 'normal 
				"R" #'emacs:restart "q" #'kill-emacs)
	    ;; Allow for quick eval
	    (general-define-key :prefix "SPC" 
				:keymaps 'normal 
				";" #'pp-eval-expression)))
;; Setup `evil-collection' for vim binding everywhere
(use-package 
  evil-collection 
  :after evil 
  :init (setq evil-collection-company-use-tng nil) 
  :config (evil-collection-init))

(use-package esup :commands esup)

(use-package dap-mode :defer t)

(use-package rainbow-delimiters :hook (prog-mode . rainbow-delimiters-mode))

(use-package gcmh
  :hook (window-setup . gcmh-mode))

(defun org:add-src-block () 
  "Create a src block in org and enter special edit mode" 
  (interactive)
  (let ((ft (read-string "Enter language: "))) 
    (insert (format "#+BEGIN_SRC %s \n\n#+END_SRC" ft))
    (previous-line) 
    (org-edit-special)))

;; Define functions to launch emacs again
(defun emacs:launch-in-terminal () 
  (suspend-emacs "fg ; emacs -nw"))
(defun emacs:launch-under-x () 
  (call-process "sh" nil nil nil "-c" "emacs &"))
(defun emacs:restart () 
  "Restart emacs" 
  (interactive)
  ;; We need the new emacs to be spawned after all kill-emacs-hooks
  ;; have been processed and there is nothing interesting left
  (let ((kill-emacs-hook (append kill-emacs-hook (list (if (display-graphic-p)
							   #'emacs:launch-under-x
							 #'emacs:launch-in-terminal))))) 
    (save-buffers-kill-emacs)))

(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/saves/") t)) 
(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))

(setq scroll-conservatively 101)

(setq-default truncate-lines t)

(add-hook 'window-setup-hook #'electric-pair-mode)

(add-hook 'emacs-lisp-mode-hook (lambda () 
				  (require 'highlight-quoted) 
				  (highlight-quoted-mode)))

(setq inhibit-splash-screen t)

(when (file-exists-p custom-file)
  (load-file custom-file))

(defalias 'yes-or-no-p 'y-or-n-p)

(add-hook 'after-save-hook (lambda () 
			     (when (and (string=
					 (file-name-directory (buffer-file-name))
					 (expand-file-name user-emacs-directory)) 
					(equal major-mode 'org-mode)) 
			       (org-babel-tangle nil (concat (file-name-base
							      (buffer-file-name))
							     ".el")
						 'emacs-lisp))))

(add-hook 'window-setup-hook (lambda ()
			       (message "Emacs started in %s with %s packages and %s GCs"
					(emacs-init-time)
					(hash-table-size straight--profile-cache) gcs-done)))
