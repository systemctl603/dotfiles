;; Set `gc-cons-threshold' early for fast init
(setq gc-cons-threshold most-positive-fixnum
      gc-cons-percentage 0.6)

;; Disable unneeded UI elements.
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; This config employs `straight' to manage packages,
;; So `package.el' should be disabled.
(setq package-enable-at-startup nil)
(setq frame-inhibit-implied-resize t)

(setq initial-major-mode 'fundamental-mode)

;; Set the font early as setting it here can have a impact on init time
(add-to-list 'default-frame-alist '(font . "Victor Mono-15:bold"))
