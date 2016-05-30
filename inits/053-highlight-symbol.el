;; ------------------------------------------------------------------------
;; @ expand-region

(use-package highlight-symbol
  :config
  ;; 使いたい色を設定、repeat してくれる
  (setq highlight-symbol-colors '("DarkOrange" "DodgerBlue1" "DeepPink1"))
  ;; キーバインドの設定
  (global-set-key (kbd "C-c h") 'highlight-symbol-at-point)
  (global-set-key (kbd "C-c H") 'highlight-symbol-remove-all)

  ;;; 1秒後自動ハイライトされるようになる
  (setq highlight-symbol-idle-delay 1.0)
  ;;; 自動ハイライトをしたいならば
  (add-hook 'prog-mode-hook 'highlight-symbol-mode)
  ;;; ソースコードにおいてM-p/M-nでシンボル間を移動
  (add-hook 'prog-mode-hook 'highlight-symbol-nav-mode)
  ;;; シンボル置換
  (global-set-key (kbd "M-s M-r") 'highlight-symbol-query-replace)

  (set-face-background 'highlight-symbol-face "DarkGoldenrod3")

)
