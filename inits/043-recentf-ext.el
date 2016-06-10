;; ------------------------------------------------------------------------
;; @ recentf-ext

;; 自動保存
(use-package recentf-ext
  :config
  (setq recentf-max-saved-items 1000)
  (setq recentf-exclude '(".recentf"))
  (setq recentf-auto-cleanup 10)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1))

