;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ screen - hiwin                                                ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(use-package hiwin
  :config

  ;; hiwin-modeを有効化
  (hiwin-activate)

  ; hiwinの色を変更
  (custom-set-faces
   '(hiwin-face ((t (:background "gray1"))) t)
   '(hiwin-focus-out-face ((t (:background "gray1" :foreground "gray-65"))) t)
   '(font-lock-comment-face ((t (:foreground "dark gray" :slant italic)))))
)
