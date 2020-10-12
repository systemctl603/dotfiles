(setq read-process-output-max (* 1024 1024)) ;; 1mb
(setq set-fringe-mode 0)
(setq doom-modeline-height 40)
(setq inhibit-startup-message t)
(setq projectile-completion-system 'ivy)
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/saves/" t)))
(setq esup-depth 0)
(setq backup-directory-alist '(("." . "~/.emacs.d/saves")))

(setq straight-use-package-by-default t)
(setq web-mode-content-types-alist
  '(("jsx" . "\\.js[x]?\\'")))
(setq web-mode-enable-comment-annotation t)
(setq company-idle-delay 0.1)
(setq company-minimum-prefix-length 0)

(setq markdown-fontify-code-blocks-natively t)
(setq
    lsp-signature-auto-activate nil
    lsp-signature-doc-lines 1)

(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(setq lsp-eldoc-render-all nil)

(setq lsp-idle-delay 0.15)
(setq lsp-completion-provider :capf)
(setq lsp-completion-enable t)
(setq lsp-auto-configure t)
(setq lsp-semantic-highlighting t)
(setq lsp-ui-doc-enable t)
(setq lsp-ui-doc-delay 1)
(setq lsp-use-plists t)
(setq js2-mode-show-parse-errors nil)
(setq js2-mode-show-strict-warnings nil)
(setq treemacs-file-watch-delay 50)

;; Create functions to be able to run `restart-emacs'
(defun open-config ()
  (interactive)
  (dired "~/.emacs.d"))

(defun launch-separate-emacs-in-terminal ()
  (suspend-emacs "fg ; emacs -nw"))

(defun launch-separate-emacs-under-x ()
  (call-process "sh" nil nil nil "-c" "emacs &"))
;; Create an interactive command to restart emacs
(defun restart-emacs ()
  (interactive)
  (let ((kill-emacs-hook (append kill-emacs-hook (list (if (display-graphic-p)
                                                           #'launch-separate-emacs-under-x
                                                         #'launch-separate-emacs-in-terminal)))))
  (save-buffers-kill-emacs)))

(add-to-list 'default-frame-alist '(font . "Victor Mono-14:weight=semibold"))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-fontset-font t nil (font-spec :size 14 :name "VictorMono NF"))


(electric-pair-mode t)
(treemacs-resize-icons 16)
(set-default 'truncate-lines t)
(global-eldoc-mode nil)

(add-hook 'prog-mode-hook (lambda () (display-line-numbers-mode t)))


(defalias 'yes-or-no-p 'y-or-n-p)
