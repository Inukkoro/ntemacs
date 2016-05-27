;; ------------------------------------------------------------------------
;; @ colors

;; 半角スペースや全角スペースなどを色付け表示する
;(defface my-face-b-1 '((t (:background "medium aquamarine"))) nil) ; 全角スペース
(defface my-face-b-1 '((t (:background "dark turquoise"))) nil) ; 全角スペース
;(defface my-face-b-2 '((t (:background "cyan"))) nil) ; タブ
(defface my-face-b-2 '((t (:background "DimGray"))) nil) ; タブ
(defface my-face-u-1 '((t (:foreground "SteelBlue" :underline t))) nil) ; 行末空白
(defvar my-face-b-1 'my-face-b-1)
(defvar my-face-b-2 'my-face-b-2)
(defvar my-face-u-1 'my-face-u-1)

(defadvice font-lock-mode (before my-font-lock-mode ())
  (font-lock-add-keywords
   major-mode
  '(
    ("　" 0 my-face-b-1 append)
    ("\t" 0 my-face-b-2 append)
    ("[ ]+$" 0 my-face-u-1 append)
    ("^[ ]+$" 0 my-face-u-1 append)
  )))

(ad-enable-advice 'font-lock-mode 'before 'my-font-lock-mode)
(ad-activate 'font-lock-mode)
(add-hook 'find-file-hooks '(lambda ()
  (if font-lock-mode
   nil
   (font-lock-mode t))))

(custom-set-faces '(hl-line ((t (:background "gray15")))))
(set-face-background 'region "dark green")
