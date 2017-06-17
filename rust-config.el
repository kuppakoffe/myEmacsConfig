;;; This is c configuration  file for rust setup


(add-hook 'rust-mode-hook 'cargo-minor-mode)


(add-hook 'rust-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c <tab>") #'rust-format-buffer)))

(add-hook 'rust-mode-hook #'rustfmt-enable-on-save)


(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "/Users/sumitg/.opt/rust/src") ;; Rust source code PATH

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)



(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
