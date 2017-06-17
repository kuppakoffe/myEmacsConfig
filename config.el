;; This file should just requre other files and nothing more than that
;; Each package installed should have its own configuration file to
;; manage things easily

(require 'package)
(package-initialize)
(elpy-enable)
(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/"))

(add-to-list
 'package-archives
 '("melpa" . "http://melpa.org/packages/"))


(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))


;; Adding list of packages to be added

(defvar local-packages '(better-defaults
			 projectile
			 auto-complete
             autopair
             smartparens
             epc
             ein
             sublimity
             column-marker
             flycheck
             py-autopep8
             py-isort
             py-yapf
             flx-ido
             helm
             helm-dash

             paredit
             mode-icons
             magit
             ace-jump-mode
             multiple-cursors

             fill-column-indicator
             expand-region
             use-package
             jedi
             elpy
             python-mode
             py-yapf
             exec-path-from-shell
             material-theme
             rainbow-delimiters
             rust-mode
             cargo
             racer
             company
             flycheck-rust
             toml
             smartscan
             smart-mode-line
             undo-tree
             web-mode))



(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      local-packages)



(provide 'config)


