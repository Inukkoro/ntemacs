;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;
;;; @ screen - tabbar                                               ;;;
;;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ;;;

(use-package tabbar
  :config

  ;; tabbar有効化（有効：t、無効：nil）
  (call-interactively 'tabbar-mode t)

  ;; ボタン非表示
  (dolist (btn '(tabbar-buffer-home-button
                 tabbar-scroll-left-button
                 tabbar-scroll-right-button))
    (set btn (cons (cons "" nil) (cons "" nil)))
    )

  ;; タブ切替にマウスホイールを使用（有効：0、無効：-1）
  (call-interactively 'tabbar-mwheel-mode -1)
  (remove-hook 'tabbar-mode-hook      'tabbar-mwheel-follow)
  (remove-hook 'mouse-wheel-mode-hook 'tabbar-mwheel-follow)

  ;; タブグループを使用（有効：t、無効：nil）
  (defvar tabbar-buffer-groups-function nil)
  (setq tabbar-buffer-groups-function nil)

  ;; タブの表示間隔
  (defvar tabbar-separator nil)
  (setq tabbar-separator '(1.0))

  ;; タブ切り替え
  (global-set-key (kbd "C-.") 'tabbar-forward-tab)
  (global-set-key (kbd "C-,") 'tabbar-backward-tab)


  ;;header のlineを消す
  ;; Enable tabbars globally:
  (tabbar-mode 1)

   ;; I use this minor-mode mainly as a global mode (see below):
  (define-minor-mode tabbar-on-term-only-mode
    "Display tabbar on terminals and buffers in fundamental mode only."
    :init-value t
    :lighter nil
    :keymap nil
    (if tabbar-on-term-only-mode
        ;; filter is enabled
        (if (eq major-mode 'term-mode); <- this can be easily customizable...
            (tabbar-local-mode -1)
          (tabbar-local-mode 1))
      ;; always activate tabbar locally when we disable the minor mode:
      (tabbar-local-mode -1)))

  (defun tabbar-on-term-only-mode-on ()
    "Turn on tabbar if current buffer is a terminal."
    (unless (minibufferp) (tabbar-on-term-only-mode 1)))

  ;; Define a global switch for the mode. Note that this is not set for buffers
  ;; in fundamental mode.
  ;;
  ;; I use it 'cause some major modes do not run the
  ;; `after-change-major-mode-hook'...
  (define-globalized-minor-mode global-tabbar-on-term-only-mode
    tabbar-on-term-only-mode tabbar-on-term-only-mode-on)

  ;; Eventually, switch on this global filter for tabbars:
  (global-tabbar-on-term-only-mode 1)
)
