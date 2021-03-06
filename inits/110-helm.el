;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ helm                                                          ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

;; テーマ選択
(use-package helm-config
  :config
  (helm-mode 1)

  ;; helm-projectile
  (custom-set-variables
   '(projectile-enable-caching t))
  (projectile-global-mode t)
  (setq projectile-completion-system 'helm)
  (helm-projectile-on)

  (setq helm-split-window-default-side 'below)

  (setq helm-for-files-preferred-list
        '(helm-source-buffers-list
          helm-source-recentf
          ;;helm-source-file-cache
          helm-source-files-in-current-dir
          helm-source-projectile-files-list
          ;;helm-source-locate
          ;;helm-source-bookmarks
          ))

  (define-key global-map (kbd "C-;")     'helm-for-files)
  (define-key global-map (kbd "M-x")     'helm-M-x)
  ;;(define-key global-map (kbd "M-x")     'execute-extended-command)
  (define-key global-map (kbd "C-x C-f") 'helm-find-files)
  (define-key global-map (kbd "C-x C-r") 'helm-recentf)
  (define-key global-map (kbd "C-x C-l") 'helm-locate)
  (define-key global-map (kbd "C-x C-t") 'helm-etags-select)
  (define-key global-map (kbd "M-y")     'helm-show-kill-ring)
  ;;(define-key global-map (kbd "C-c i")   'helm-imenu)
  (define-key global-map (kbd "C-x b")   'helm-buffers-list)
  (define-key global-map (kbd "M-o")     'helm-occur-from-isearch)

  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
  ;;(define-key helm-M-x-map (kbd "TAB") 'helm-execute-persistent-action)
  ;;(define-key helm-buffers-list-map (kbd "TAB") 'helm-execute-persistent-action)

  ;; Disable helm in some functions
  (add-to-list 'helm-completing-read-handlers-alist '(find-alternate-file . nil))

  ;; Emulate `kill-line' in helm minibuffer
  (setq helm-delete-minibuffer-contents-from-point t)
  (defadvice helm-delete-minibuffer-contents (before helm-emulate-kill-line activate)
    "Emulate `kill-line' in helm minibuffer"
    (kill-new (buffer-substring (point) (field-end))))

  (defadvice helm-ff-kill-or-find-buffer-fname (around execute-only-if-exist activate)
    "Execute command only if CANDIDATE exists"
    (when (file-exists-p candidate)
      ad-do-it))

  (defadvice helm-ff-transform-fname-for-completion (around my-transform activate)
    "Transform the pattern to reflect my intention"
    (let* ((pattern (ad-get-arg 0))
           (input-pattern (file-name-nondirectory pattern))
           (dirname (file-name-directory pattern)))
      (setq input-pattern (replace-regexp-in-string "\\." "\\\\." input-pattern))
      (setq ad-return-value
            (concat dirname
                    (if (string-match "^\\^" input-pattern)
                        ;; '^' is a pattern for basename
                        ;; and not required because the directory name is prepended
                        (substring input-pattern 1)
                      (concat ".*" input-pattern))))))

  (defun helm-buffers-list-pattern-transformer (pattern)
    (if (equal pattern "")
        pattern
      (let* ((first-char (substring pattern 0 1))
             (pattern (cond ((equal first-char "*")
                             (concat " " pattern))
                            ((equal first-char "=")
                             (concat "*" (substring pattern 1)))
                            (t
                             pattern))))
        ;; Escape some characters
        (setq pattern (replace-regexp-in-string "\\." "\\\\." pattern))
        (setq pattern (replace-regexp-in-string "\\*" "\\\\*" pattern))
        pattern)))

  (unless helm-source-buffers-list
    (setq helm-source-buffers-list
          (helm-make-source "Buffers" 'helm-source-buffers)))
  (add-to-list 'helm-source-buffers-list
               '(pattern-transformer helm-buffers-list-pattern-transformer))


  (use-package nadvice)

  (defun projectile-files-via-ext-command-advice (f &rest args)
    (let ((coding-system-for-read 'cp932))
      (apply f args)))

  (use-package projectile
    :config
    (when (eq window-system 'w32)
      (advice-add 'projectile-files-via-ext-command :around 'projectile-files-via-ext-command-advice)))

  ;; helm-gtagsでの大文字小文字の無視
  (setq helm-gtags-ignore-case t)

  (add-hook 'helm-gtags-mode-hook
            '(lambda ()
               ;;入力されたタグの定義元へジャンプ
               (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
               ;;入力タグを参照する場所へジャンプ
               (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
               ;;入力したシンボルを参照する場所へジャンプ
               (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
               ;;タグ一覧からタグを選択し, その定義元にジャンプする
               (local-set-key (kbd "M-l") 'helm-gtags-select)
               ;;ジャンプ前の場所に戻る
               (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)
               ;; M-fをdefaultに戻す
               (local-set-key (kbd "M-f") 'nil)
               ))

  (add-hook 'php-mode-hook 'helm-gtags-mode)

  (use-package helm-swoop
    :config
    ;; キーバインドはお好みで
    (global-set-key (kbd "M-i") 'helm-swoop)
    (global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
    (global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
    (global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)

    ;; isearch実行中にhelm-swoopに移行
    (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
    ;; helm-swoop実行中にhelm-multi-swoop-allに移行
    (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)

    ;; Save buffer when helm-multi-swoop-edit complete
    (setq helm-multi-swoop-edit-save t)

    ;; 値がtの場合はウィンドウ内に分割、nilなら別のウィンドウを使用
    (setq helm-swoop-split-with-multiple-windows nil)

    ;; ウィンドウ分割方向 'split-window-vertically or 'split-window-horizontally
    (setq helm-swoop-split-direction 'split-window-vertically)

    ;; nilなら一覧のテキストカラーを失う代わりに、起動スピードをほんの少し上げる
    (setq helm-swoop-speed-or-color t)

    ;; Go to the opposite side of line from the end or beginning of line
    (setq helm-swoop-move-to-line-cycle t)

    ;; Optional face for line numbers
    ;; Face name is `helm-swoop-line-number-face`
    (setq helm-swoop-use-line-number-face t)

    ;; If you prefer fuzzy matching
    (setq helm-swoop-use-fuzzy-match nil)

    ;; If you would like to use migemo, enable helm's migemo feature
    ;;(helm-migemo-mode 1)

    )
  )
