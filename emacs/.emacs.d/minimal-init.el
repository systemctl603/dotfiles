;; This is a config meant for simply initiating bug reports and
;; isolating the source of a problem. It sets up the bare essectials.
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq packages-to-install '(dart-mode))

(dolist (package packages-to-install)
  (unless (package-installed-p)
    (package-install package)))
