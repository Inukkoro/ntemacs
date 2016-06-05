;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ search - migemo                                               ;;;
;;;   https://github.com/emacs-jp/migemo                            ;;;
;;;   cmigemoをインストールする必要あり                              ;;;
;;;   http://www.kaoriya.net/software/cmigemo/                      ;;;
;;;                                                                 ;;;
;;;   linux                                                         ;;;
;;;   yaourt -S nkf                                                 ;;;
;;;   yaourt -S cmigemo-git                                         ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(use-package migemo
  :if (or (and (eq system-type 'windows-nt)
               (not (eq (executable-find "C:/cmigemo/cmigemo.exe") 'nil)))
          (and (eq system-type 'gnu/linux)
               (not (eq (executable-find "cmigemo") 'nil)))
          )
  :config
  ; windows
  (when (eq system-type 'windows-nt)
    (setq migemo-command "C:/cmigemo/cmigemo.exe")
    (setq migemo-dictionary "C:/cmigemo/dict/utf-8/migemo-dict")
    (setq migemo-options '("-q" "--emacs" "-i" "\a"))
  )
  ; linux
  (when (eq system-type 'gnu/linux)
    (setq migemo-command "cmigemo")
    (setq migemo-dictionary "/usr/share/migemo/utf-8/migemo-dict")
    (setq migemo-options '("-q" "--emacs"))
  )
  (setq migemo-user-dictionary nil)
  (setq migemo-regex-dictionary nil)
  (setq migemo-coding-system 'utf-8-unix)
  (load-library "migemo")
  (migemo-init)
)

