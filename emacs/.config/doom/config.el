;; -*- lexical-binding: t -*-

(setq user-full-name "Arjun S."
      user-mail-address "arjunsenthilvel1@gmail.com")

(setq doom-font "Victor Mono-16"
      doom-variable-pitch-font "Noto Sans TC-9")

(setq doom-theme 'atom-one-dark)

(setq org-directory (concat doom-private-dir "org/"))

(setq display-line-numbers-type nil)

(use-package! atom-one-dark-theme)

(visual-line-mode nil)

(after! treemacs
  (treemacs-resize-icons 16)
  (load! "treemacs-theme/theme")
  (dolist (face '(treemacs-git-unmodified-face
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
    (set-face-attribute face nil :family "Noto Sans TC" :height 90)))

(after! lsp-ui
  (setq lsp-ui-doc-enable t
        lsp-ui-doc-max-width 150
        lsp-ui-doc-include-signature t
        lsp-eldoc-hook nil
        lsp-ui-doc-delay 1.25))

(after! lsp-mode
  (setq lsp-signature-auto-activate nil
        lsp-signature-render-documentation nil))

(after! company
  (setq company-idle-delay 0
        company-minimum-prefix-length 1))

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
