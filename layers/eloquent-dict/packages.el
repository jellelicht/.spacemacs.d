(defconst eloquent-dict-packages
  '(sdcv))

(defun eloquent-dict/init-sdcv ()
  (use-package sdcv
    :init
    (progn
      (spacemacs/declare-prefix "S" "spelling")
      (spacemacs/set-leader-keys
        "Ss" 'sdcv-search-input))
    :commands (sdcv-search-input)))
