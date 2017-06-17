;; This file should just requre other files and nothing more than that
;; Each package installed should have its own configuration file to
;; manage things easily


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/config.el")

(load-file "~/.emacs.d/customizations.el")

(load-file "~/.emacs.d/font.el")

(load-file "~/.emacs.d/projectile.el")


(load-file "~/.emacs.d/web-mode-config.el")

(load-file "~/.emacs.d/yasnippet-config.el")

(load-file "~/.emacs.d/magit-config.el")


(load-file "~/.emacs.d/python-config.el")

(load-file "~/.emacs.d/rust-config.el")


(load-file "~/.emacs.d/markdown-config.el")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#ffffff" "#f36c60" "#8bc34a" "#fff59d" "#4dd0e1" "#b39ddb" "#81d4fa" "#262626"))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "ff7625ad8aa2615eae96d6b4469fcc7d3d20b2e1ebc63b761a349bebbb9d23cb" "98cc377af705c0f2133bb6d340bf0becd08944a588804ee655809da5d8140de6" default)))
 '(fci-rule-color "#3a3a3a")
 '(hl-sexp-background-color "#121212")
 '(minimap-hide-fringes t)
 '(minimap-minimum-width 30)
 '(minimap-mode nil)
 '(minimap-width-fraction 0.25)
 '(minimap-window-location (quote right))
 '(nyan-mode t)
 '(package-selected-packages
   (quote
    (dracula-theme emmet-mode all-the-icons nyan-mode neotree powerline esqlite markdown-preview-mode material-theme elpy jedi epc auto-complete projectile better-defaults)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#263238" :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 130 :width normal :foundry "nil" :family "Fira Code"))))
 '(Info-quoted ((t (:family "Fira Code"))))
 '(minimap-active-region-background ((t (:background "#021e0a"))))
 '(minimap-font-face ((t (:weight semi-light :height 50 :family "Source Code Pro"))))
 '(my-carriage-return-face ((((class color)) (:background "blue"))) t)
 '(my-tab-face ((((class color)) (:background "green"))) t))






