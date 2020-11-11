;; Enable all the icons in doom-modeline if run in daemon mode
(setq doom-modeline-icon t)

(if (file-exists-p (expand-file-name "config.el" user-emacs-directory))
    (load-file (expand-file-name "config.el" user-emacs-directory))
    (org-babel-load-file (expand-file-name "config.org" user-emacs-directory)))
