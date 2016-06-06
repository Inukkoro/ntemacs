;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ markdown-mode                                                 ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(use-package markdown-mode
;  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :init (setq markdown-command "multimarkdown")
;  :config
;  (defun eww-open-file-other-window (file)
;    (if (one-window-p) (split-window))
;    (other-window 1)
;    (eww-open-file file))
;
;  (defun markdown-preview-eww ()
;    (interactive)
;    (message (buffer-file-name))
;    (call-process "/usr/local/bin/grip" nil nil nil
;                  "--gfm" "--export" "/tmp/marked.html"
;                  (buffer-file-name)
;                  "/tmp/grip.html")
;    (eww-open-file-other-window "/tmp/grip.html"))
;
;  (define-key markdown-mode-map "\C-c \C-c" 'markdown-preview-eww)

)


