;;; -*- lexical-binding: t -*-

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package 
  evil 
  :init 
  (setq evil-want-intergration t 
        evil-want-keybinding nil 
        evil-undo-system 'undo-fu)
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

(use-package undo-fu
  :defer t)

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

(use-package atom-one-dark-theme
  :hook (after-init . (lambda () 
                        (load-theme 'atom-one-dark t))))

(setq frame-resize-pixelwise t)

(use-package 
  doom-modeline 
  :config (progn 
            (setq doom-modeline-buffer-file-name-style 'file-name
                  doom-modeline-major-mode-icon nil)
            (doom-modeline-mode t)
            ;; Disable some sections in the modeline
            (line-number-mode nil)))

(use-package 
  treemacs 
  :config (load-file (expand-file-name "lisp/treemacs-theme/theme.el" user-emacs-directory))
  :commands (treemacs))

(setq org-src-tab-acts-natively t
      org-startup-indented t
      org-hide-leading-stars t
      org-edit-src-content-indentation 0)

(use-package web-mode 
  :config
  (setq web-mode-content-types-alist
        '(("jsx" . "\\.js[x]?\\'")))
  :mode ("\\.tsx?\\'" "\\.html?\\'" "\\.s?css\\'" "\\.jsx?\\'"))

(use-package json-mode 
  :defer t)

(use-package dart-mode
  :config (progn
            (font-lock-add-keywords 'dart-mode
                                    '((":" . font-lock-constant-face)
                                      ("\\(\\<\\|\\>\\)" . font-lock-constant-face))))
  :defer t)

(use-package lsp-dart
  :defer t)

(use-package yaml-mode
  :defer t)

(use-package graphql-mode
  :defer t)

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package rust-mode
  :defer t)

(use-package 
  lsp-mode 
  :hook ((web-mode
          dart-mode) . lsp-deferred))
(use-package 
  lsp-ui 
  :after lsp-mode 
  :config (progn 
            (setq lsp-ui-doc-enable t) 
            (setq lsp-ui-doc-include-signature t) 
            (setq lsp-ui-doc-alignment 'frame)
            (setq lsp-ui-doc-position 'at-point) 
            (setq lsp-ui-doc-delay 1.5)
            ;; Disable `eldoc' in `lsp-ui'
            (setq lsp-eldoc-enable-hover nil) 
            (setq lsp-eldoc-hook nil)
            ;; Configure path of angular language server.
            (setq lsp-clients-angular-language-server-command
                  `("node"
                    ,(expand-file-name
                      "~/.local/lib/node_modules/@angular/language-server")
                    "--ngProbeLocations"
                    ,(expand-file-name
                      "~/.local/lib/node_modules")
                    "--tsProbeLocations"
                    ,(expand-file-name
                      "~/.local/lib/node_modules")
                    "--stdio"))
            (mapcar (lambda (f) (set-face-foreground f "dim gray"))
                    '(lsp-ui-sideline-code-action
                      lsp-ui-sideline-current-symbol
                      lsp-ui-sideline-symbol
                      lsp-ui-sideline-symbol-info))))

(use-package 
  company
  :init (progn
          (setq company-minimum-prefix-length 1
                company-idle-delay 0.0
                company-auto-complete nil
                company-auto-complete-chars nil
                company-backends '((company-capf
                                    company-files
                                    company-dabbrev-code
                                    company-dabbrev)))
          (add-hook 'text-mode-hook (lambda () (setq-local
                                                company-backends
                                                '(company-ispell))))) 
  :hook (window-setup . global-company-mode))

(use-package company-box
  :hook (company-mode . company-box-mode))

(use-package flycheck
  :config (progn
            (add-to-list 'flycheck-disabled-checkers '(emacs-lisp-checkdoc
                                                       emacs-lisp)))
  :hook (prog-mode . flycheck-mode))

(use-package apheleia
  :straight '(apheleia :host github :repo "raxod502/apheleia")
  :hook (window-setup . apheleia-global-mode)
  :config (progn
            ;; Modify prettier to use bracket spacing
            (setf (alist-get 'prettier apheleia-formatters)
                  '(npx
                    "prettier"
                    "--bracket-spacing"
                    "--stdin-filepath"
                    filepath))

            ;; Enable `dartfmt' for dart files.
            (setf (alist-get 'dartfmt apheleia-formatters)
                  '("dart" "format" "--fix"))

            ;; Add all the appropriate major modes for the appropriate
            ;; formatters into `apheleia-mode-alist'
            (add-to-list 'apheleia-mode-alist '(dart-mode . dartfmt))
            (add-to-list 'apheleia-mode-alist '(graphql-mode . prettier))))

(use-package magit 
  :commands magit-status) 

;; Configure `evil-magit' for evil bindings 
(use-package evil-magit 
  :after magit)

(use-package general 
  :config (progn
            ;; Bindings to open and close dedicated buffers.
            (general-define-key :prefix "SPC o" 
                                :keymaps 'normal 
                                "t" #'treemacs
                                ;; `vterm'
                                "v" #'vterm-toggle)

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
                                "k" #'counsel-descbinds)
            ;; Define restart and exit bindings
            (general-define-key :prefix "SPC q" 
                                :keymaps 'normal 
                                "R" #'emacs:restart "q" #'kill-emacs)

            ;; Allow for quick eval
            (general-define-key :prefix "SPC" 
                                :keymaps 'normal 
                                ";" #'pp-eval-expression)

            (general-define-key :keymaps 'company-active-map
                                "RET" nil
                                "<tab>" #'company-complete-selection)
            ;; Add debug keybindings
            (general-define-key :prefix "SPC d"
                                :keymaps 'normal
                                "t" #'dap-breakpoint-toggle
                                "d" #'dap-debug
                                "r a" #'dap-breakpoint-delete-all)))

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

(use-package vterm
  :commands vterm)

(use-package vterm-toggle
  :commands vterm-toggle)

(use-package exec-path-from-shell
  :hook (window-setup . exec-path-from-shell-initialize))

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

(setq scroll-conservatively 101
      auto-window-vscroll nil)

(setq-default truncate-lines t)

(defun modeline:enable-icons (_frame)
  (setq doom-modeline-icon t))

(add-hook 'after-make-frame-functions 
          #'modeline:enable-icons)

(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(add-hook 'window-setup-hook #'electric-pair-mode)

(add-hook 'emacs-lisp-mode-hook (lambda () 
                                  (require 'highlight-quoted) 
                                  (highlight-quoted-mode)))

(setq inhibit-splash-screen t)

(when (file-exists-p custom-file)
  (load-file custom-file))

(defalias 'yes-or-no-p 'y-or-n-p)

(setq read-process-output-max (* 1024 1024))

(add-hook 'window-setup-hook (lambda ()
                               (message "Emacs started in %s with %s packages and %s GCs"
                                        (emacs-init-time)
                                        (hash-table-size straight--profile-cache) gcs-done)))
