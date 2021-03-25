(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(backward-delete-char-untabify-method 'all)
 '(centaur-tabs-set-icons t)
 '(custom-safe-themes
   '("fdc0c900a6c64b890289d2eb54e7d001b3ef54302db7fbb92033f829cac3a26d" "edb73be436e0643727f15ebee8ad107e899ea60a3a70020dfa68ae00b0349a87" default))
 '(evil-want-fine-undo t)
 '(flycheck-disabled-checkers '(emacs-lisp-checkdoc emacs-lisp))
 '(flycheck-indication-mode 'left-margin)
 '(indent-tabs-mode nil)
 '(js-chain-indent t)
 '(js-indent-level 2)
 '(js-switch-indent-offset 2)
 '(js2-highlight-level 2)
 '(lsp-dart-flutter-widget-guides nil)
 '(lsp-document-sync-method nil)
 '(lsp-enable-on-type-formatting nil)
 '(lsp-enable-semantic-highlighting t)
 '(lsp-signature-auto-activate nil)
 '(lsp-signature-render-documentation nil)
 '(lsp-ui-sideline-show-code-actions nil)
 '(markdown-fontify-code-blocks-natively t)
 '(markdown-hide-markup-in-view-modes nil)
 '(safe-local-variable-values
   '((eval add-hook 'after-save-hook
           (lambda nil
             (org-babel-tangle))
           nil t)
     (eval add-hook 'after-save-hook
           (lambda nil
             (org-babel-tangle nil
                               (concat
                                (file-name-base
                                 (buffer-file-name))
                                ".el")
                               'emacs-lisp))
           nil t)))
 '(standard-indent 4)
 '(tab-always-indent 'complete)
 '(tab-width 2)
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(warning-suppress-log-types '((comp)))
 '(web-mode-auto-close-style 2)
 '(web-mode-comment-style 2)
 '(web-mode-enable-comment-annotation t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(js2-function-param ((t (:foreground "#ABB2BF" :slant italic))))
 '(lsp-treemacs-file-error ((t (:height 90 :inherit error))))
 '(lsp-treemacs-file-info ((t (:height 90 :inherit success))))
 '(lsp-treemacs-file-warn ((t (:height 90 :inherit warning))))
 '(lsp-treemacs-project-root-error ((t (:height 90 :inherit font-lock-keyword-face))))
 '(lsp-treemacs-project-root-info ((t (:height 90 :inherit font-lock-keyword-face))))
 '(lsp-treemacs-project-root-warn ((t (:height 90 :inherit font-lock-keyword-face))))
 '(mode-line ((t (:background "#21252B" :foreground "#9DA5B4" :box (:line-width 1 :color "#181A1F")))))
 '(vterm-color-underline ((t (:inherit vterm-color-default :underline t))))
 '(vterm-color-white ((t (:inherit term-color-white :foreground "white"))))
 '(yas-field-highlight-face ((t nil))))
