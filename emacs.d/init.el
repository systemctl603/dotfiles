(add-to-list 'load-path "~/.emacs.d/elisp")

(add-hook 'window-setup-hook (lambda ()
			       (setq gc-cons-threshold 100000000)
			       (message "Loaded %d packages in %s"
					(length (hash-table-keys straight--success-cache))
					(emacs-init-time))))

(load-library "packages")
(load-library "options")
(load-library "keybinds")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["#21252B" "#E06C75" "#98C379" "#E5C07B" "#61AFEF" "#C678DD" "#56B6C2" "#ABB2BF"])
 '(custom-safe-themes
	 '("fdc0c900a6c64b890289d2eb54e7d001b3ef54302db7fbb92033f829cac3a26d" "b30ab3b30e70f4350dad6bfe27366d573ace2190cc405c619bd5e602110c6e0c" default))
 '(display-battery-mode t)
 '(fci-rule-color "#3E4451")
 '(js-indent-level 2)
 '(js2-idle-timer-delay 0.01)
 '(js2-mode-show-parse-errors nil t)
 '(lsp-document-sync-method nil)
 '(lsp-eldoc-enable-hover nil)
 '(lsp-enable-semantic-highlighting t)
 '(lsp-ui-sideline-diagnostic-max-line-length 20)
 '(lsp-ui-sideline-show-diagnostics nil)
 '(markdown-command "pandoc")
 '(smooth-scroll/hscroll-step-size 1)
 '(smooth-scroll/vscroll-step-size 1)
 '(standard-indent 2)
 '(tab-always-indent t)
 '(tetris-x-colors
	 [[229 192 123]
		[97 175 239]
		[209 154 102]
		[224 108 117]
		[152 195 121]
		[198 120 221]
		[86 182 194]])
 '(treemacs-filewatch-mode t)
 '(web-mode-auto-close-style 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(mode-line ((t (:background "#21252B" :foreground "#9DA5B4" :box (:line-width 1 :color "#181A1F") :height 1.0 :width normal))))
 '(vterm-color-black ((t (:inherit term-color-black :foreground "black"))))
 '(vterm-color-default ((t (:inherit default :family "Noto Sans TC"))))
 '(vterm-color-inverse-video ((t (:inherit vterm-color-default :foreground "black"))))
 '(vterm-color-underline ((t (:inherit vterm-color-default :foreground "green" :underline t))))
 '(vterm-color-white ((t (:inherit term-color-white :foreground "white")))))
