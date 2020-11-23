;; Set `gc-cons-threshold' early for fast init
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Set this early so even if the config was modified and we error, the
;; autosaves go to a seperate dir
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/saves/") t)) 
(setq backup-directory-alist '(("." . "~/.emacs.d/saves"))) 

;; Disable unneeded UI elements.
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Inhibit compacting font during GC. Can speed
;; up scolling and typing in large files.
(setq inhibit-compacting-font-caches t)


;; Bootstrap `straight'
(setq straight-check-for-modifications '(check-on-save))
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

;; This config employs `straight' to manage packages,
;; So `package.el' should be disabled.
(setq package-enable-at-startup nil)

;; This setting prohibits emacs from resizing the frame when the font
;; is too big.  It can easily remove upto 0.5 -> 1 second from startup
;; time.
(setq frame-inhibit-implied-resize t)

(setq initial-major-mode 'fundamental-mode)

;; Set the font early as setting it here can have a impact on init time
(add-to-list 'default-frame-alist '(font . "Victor Mono-15:weight=bold:style=ss01"))
