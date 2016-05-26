;; ------------------------------------------------------------------------
;; @ smartrep

(define-prefix-command 'ctl-q-map)
(define-key global-map (kbd "C-q") 'ctl-q-map)
(define-key ctl-q-map (kbd "C-q") 'quoted-insert)

;; ------------------------------------------------------------------------
;; @ git-gutter
(global-git-gutter-mode +1)

(custom-set-variables
 '(git-gutter:handled-backends '(git hg svn)))

(custom-set-variables
 '(git-gutter:update-interval 10))

(git-gutter:linum-setup)

(when (require 'smartrep nil t)

    (smartrep-define-key
        global-map  "C-q" '(
            ;; Jump to next/previous hunk
            ("p" . 'git-gutter:previous-hunk)
            ("n" . 'git-gutter:next-hunk)

            ("t" . 'git-gutter:toggle)
            ("l" . 'git-gutter:popup-hunk)

            ;; Stage current hunk
            ("s" . 'git-gutter:stage-hunk)

            ;; Revert current hunk
            ("r" . 'git-gutter:revert-hunk)
        ))
)

;;; smartrepの中でset-face-backgroundを変更しているためここで色を設定
;(set-face-background 'region "dark slate blue") ;選択範囲の色

;; ------------------------------------------------------------------------
;; @ magit

(require 'git-commit)

;; Socketエラーとなるためコメント
;;;
;(require 'magit)


