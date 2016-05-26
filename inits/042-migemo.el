;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ search - migemo                                               ;;;
;;;   https://github.com/emacs-jp/migemo                            ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(use-package migemo
  :config
  (setq migemo-dictionary "C:/cmigemo/dict/utf-8/migemo-dict")
  (setq migemo-command "C:/cmigemo/cmigemo.exe")
  (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)
