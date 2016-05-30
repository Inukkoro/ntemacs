;; ------------------------------------------------------------------------
;; @ expand-region

(use-package expand-region
  :config

  (use-package smartrep
    :config
    (smartrep-define-key
        global-map  "C-q" '(
            ("w" . 'er/expand-region) ;; リージョンを広げる
            ("W" . 'er/contract-region) ;; リージョンを狭める
        ))
)

  ;; transient-mark-modeが nilでは動作しませんので注意
  (transient-mark-mode t)
)
