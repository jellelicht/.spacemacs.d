;;; funcs.el --- private-rcirc layer functions file for Spacemacs.
;;
;; Author: Jelle Licht <jelle@flip>
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun rcirc-block-connection-ping ()
  (when (= (length rcirc-target) 0)
    (rcirc-toggle-ignore-buffer-activity)))
