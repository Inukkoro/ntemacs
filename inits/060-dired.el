;; ------------------------------------------------------------------------
;; dired

(add-hook 'dired-mode-hook
  (lambda ()
    (define-key dired-mode-map (kbd "z") 'dired-exec-windows-file)))

(add-hook 'dired-mode-hook
  (lambda ()
    (define-key dired-mode-map (kbd "E") 'dired-exec-windows-explorer)))

(defun dired-exec-windows-file()
  "In dired, execute windows file"
  (interactive)
  (dired-exec-windows (dired-get-filename)))

(defun dired-exec-windows-explorer()
  "In dired, execute windows explorer"
  (interactive)
  (dired-exec-windows (dired-current-directory)))

(defun dired-exec-windows(fname)
  (if (eq major-mode 'dired-mode)
    (let ()
      (w32-shell-execute "open" fname)
      (recentf-add-file fname)
      (message "win-started %s" fname))))

(define-key dired-mode-map (kbd "g") 'dired-k)
(add-hook 'dired-initial-position-hook 'dired-k)

(define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)

;; カーソル下にあるファイルやURLを適切に開いてくれる
(ffap-bindings)

;; ウィンドウ分割の際にもう片方のバッファにコピーする
(setq dired-dwim-target t)
