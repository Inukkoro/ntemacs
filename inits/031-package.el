;; ------------------------------------------------------------------------
;; @ package
(use-package package)
(use-package cl)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(defvar installing-package-list
  '(
    ;; ここに使っているパッケージを書く。
    ; el-getでうまく行かないもの
    ;git
    magit

    ;theme
    zenburn-theme

    ))

(let ((not-installed (loop for x in installing-package-list
                            when (not (package-installed-p x))
                            collect x)))
  (when not-installed
    (package-refresh-contents)
    (dolist (pkg not-installed)
      (package-install pkg))))

