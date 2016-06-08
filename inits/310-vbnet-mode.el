;; ------------------------------------------------------------------------
;; @ vbnet-mode

(autoload 'vbnet-mode "vbnet-mode" "Mode for editing VB.NET code." t)
(setq auto-mode-alist (append '(("\\.\\(frm\\|bas\\|cls\\|vb\\)$" .
                                 vbnet-mode)) auto-mode-alist))

(defun my-vbnet-mode-fn ()
  "My hook for VB.NET mode"
  (interactive)
  ;; This is an example only.
  ;; These statements are not required to use VB.NET, but
  ;; you might like them.
  (turn-on-font-lock)
  (turn-on-auto-revert-mode)
  (setq indent-tabs-mode nil)
  ;; (require 'flymake)
  ;; (flymake-mode 1)
  ;;  ...other mode-setup code here...
  (custom-set-faces '(vbnet-funcall-face ((t (:background "nevy")))))
  )
(add-hook 'vbnet-mode-hook 'my-vbnet-mode-fn)
