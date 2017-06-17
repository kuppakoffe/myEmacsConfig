;; This file will have all the visual customizations required
;; Custom mode for mac
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)
(setq ns-function-modifier 'control)

(setq inhibit-startup-message t) ;; hide the startup message
(load-theme 'material t) ;; load material theme
(fset 'yes-or-no-p 'y-or-n-p)
;;; (global-linum-mode t) ;; enable line numbers globally  --> This  is making things go worse, commenting out


;; Getting Unod in tree form
(use-package undo-tree
  :diminish undo-tree-mode
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)))

;;; UTF-8 everywhere

(prefer-coding-system 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))

;;; Adding smart scan mode
(use-package smartscan
  :defer t
  :config (global-smartscan-mode t))

;; adding shell env variables
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))



(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)
(global-auto-complete-mode t)

(require 'smartparens-config)
(smartparens-global-mode t)

(global-hl-line-mode t) ;; To enable line highlighting
(set-face-background 'hl-line "#101316") ;; change with the color that you like


;; helm dash related configuration

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "M-d") 'helm-dash)
(setq helm-move-to-line-cycle-in-source t)



(defun cv-doc ()
  (interactive)
  (setq-local helm-dash-docsets '("Opencv Python")))

(add-hook 'python-mode-hook 'cv-doc)



;; Raninbow delimiter settings
(use-package rainbow-delimiters
    :ensure t
    :config (progn
               (add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
               (add-hook 'org-mode-hook #'rainbow-delimiters-mode)))


(setq tab-width 4)
(setq indent-tabs-mode nil)
(setq-default fill-column 79)




;; Helm settings

(use-package helm
    :ensure t
    :init (helm-mode 1)
    :config (progn
               (helm-autoresize-mode 1)

               ;; We don't want helm taking up too much room
               (setq helm-autoresize-max-height 15)
               (setq helm-autoresize-min-height 15)
               (setq helm-split-window-in-side-p t)))



(use-package helm-dash
    :init (progn
              ;; Define where we want the docsets to live
              (setq helm-dash-docsets-path (format "%s/.emacs.d/docsets" (getenv "HOME")))



              ;; Define the docsets we want installed - IMPORTANT! The names that go here need to match EXACTLY the name of
              ;; docset as defined in the list at this URL (https://github.com/Kapeli/feeds)
              (defvar required-docsets '("Django"
                                         "Docker"
                                         "Emacs_Lisp"
                                         "Haskell"
                                         "Python_2"
                                         "Opencv Python"
                                         "Python_3")
               )


              (setq helm-dash-browser-func 'eww)
              (setq helm-dash-docsets '())

              ))

(setq helm-dash-browser-func 'eww)

(defun god ()
  (interactive)
  (setq-local helm-dash-docsets '("Go")))

(add-hook 'go-mode-hook 'go-doc)



(defun pyd ()
  (interactive)
  (setq-local helm-dash-docsets '(
    "Python 3"
    "OpenCV Python"
    "NumPy"
    "Matplotlib")))

(add-hook 'python-mode-hook 'pyd)


(defun helm-dash-browse-url-other-window (search-result)

  (let ((docset-name (car search-result))
    (filename (nth 2 (cadr search-result)))
    (anchor (nth 3 (cadr search-result))))
    (if (< (length (window-list)) 2)
        (split-window-horizontally))
    (other-window 1)
    (funcall helm-dash-browser-func (helm-dash-result-url docset-name filename anchor))))


(defun helm-dash-actions (actions doc-item)
  "Return an alist with the possible actions to execute with DOC-ITEM."
  `(("Go to doc" . helm-dash-browse-url)
    ("Go to doc other window" . helm-dash-browse-url-other-window)
    ("Copy to clipboard" . helm-dash-copy-to-clipboard)))






; make carriage returns blue and tabs green
(custom-set-faces
 '(my-carriage-return-face ((((class color)) (:background "blue"))) t)
 '(my-tab-face ((((class color)) (:background "green"))) t)
 )
; add custom font locks to all buffers and all files
(add-hook
 'font-lock-mode-hook
 (function
  (lambda ()
    (setq
     font-lock-keywords
     (append
      font-lock-keywords
      '(
        ("\r" (0 'my-carriage-return-face t))
        ("\t" (0 'my-tab-face t))
        ))))))

; make characters after column 80 purple
(setq whitespace-style
  (quote (face trailing tab-mark lines-tail)))
(add-hook 'find-file-hook 'whitespace-mode)

; transform literal tabs into a right-pointing triangle
(setq
 whitespace-display-mappings ;http://ergoemacs.org/emacs/whitespace-mode.html
 '(
   (tab-mark 9 [9654 9] [92 9])
   ;others substitutions...
   ))

;;; MultiCursor mode
;;(require 'multiple-cursors)
;;(global-set-key (kbd "M-s") 'mc/edit-lines)
;;(global-set-key (kbd "M->") 'mc/mark-next-like-this)
;;(global-set-key (kbd "M-<") 'mc/mark-previous-like-this)
;;(global-set-key (kbd "M-a") 'mc/mark-all-like-this)



;; Adding icons
(require 'all-the-icons)
(setq neo-theme 'icons)
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))


;; Adding emmet mode
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.

(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (select-frame frame)
            (load-theme 'material t)
            (set-face-background 'hl-line "#101316")))
    (load-theme 'material t)
    (set-face-background 'hl-line "#101316"))


