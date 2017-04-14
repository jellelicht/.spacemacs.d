(defconst editorconfig-packages
  '(editorconfig))

(defun editorconfig/init-editorconfig ()
  (use-package editorconfig
    :init
    (editorconfig-mode 1)
    :config
    (spacemacs|diminish editorconfig-mode " ⓔ" " EC")))
