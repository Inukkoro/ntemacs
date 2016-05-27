;; ------------------------------------------------------------------------
;; @ session

(use-package session
  :config
  (setq session-save-file-coding-system 'utf-8)
  (setq session-save-file (expand-file-name "~/.session/.session"))
  (setq session-initialize '(session places))
  (setq session-globals-max-size 1024)
  (setq session-globals-max-string (* 1024 1024))
  (setq session-globals-include '((kill-ring 512)
                                  (minibuffer-history 512)
                                  (query-replace-history 512)
                                  (search-ring 512)
                                  (iswitchb-history 512)
                                  (command-history 512)
                                  (buffer-name-history 512)
                                  (session-file-alist 512)
                                  (file-name-history 512)
                                  (tags-table-set-list 128)
                                  (tags-table-list 128)))
  (add-hook 'after-init-hook 'session-initialize)
  ;; Save session info every 30 minutes
  (setq my-timer-for-session-save-session (run-at-time t 1800 'session-save-session))
)
