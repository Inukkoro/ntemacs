;; ------------------------------------------------------------------------
;; @ el-get

;(require 'cl)
;(require 'package)

; gnupack標準
(el-get-bundle hiwin)
(el-get-bundle migemo)
(el-get-bundle tabbar)


; テーマ
;(el-get-bundle molokai-theme)
;(el-get-bundle zenburn-theme)

; use-package
(el-get-bundle! use-package)

; helm
(el-get-bundle helm)
(el-get-bundle helm-gtags)
(el-get-bundle helm-projectile)

;dired
(el-get-bundle dired+)
(el-get-bundle dired-k)

;undo
(el-get-bundle undo-tree)

;git
(el-get-bundle smartrep)
(el-get-bundle git-gutter)
;(el-get-bundle magit) ; el-getでうまく行かないためpackageで取得

;which-key
(el-get-bundle which-key)

;履歴など
(el-get-bundle recentf-ext)
(el-get-bundle session)

;major-mode
(el-get-bundle php-mode)
(el-get-bundle elpa:csharp-mode)
(el-get-bundle vbnet-mode)

;region選択
(el-get-bundle expand-region)
(el-get-bundle highlight-symbol)
