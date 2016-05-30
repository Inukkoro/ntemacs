;; ------------------------------------------------------------------------
;; @ smartrep

(define-prefix-command 'ctl-q-map)
(define-key global-map (kbd "C-q") 'ctl-q-map)
(define-key ctl-q-map (kbd "C-q") 'quoted-insert)

