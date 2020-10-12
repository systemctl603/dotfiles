(evil-define-key 'treemacs treemacs-mode-map (kbd "-") #'treemacs)
(evil-define-key 'normal 'global (kbd "-") #'treemacs)
(evil-define-key 'normal lsp-mode-map "<f2>" #'lsp-rename)
