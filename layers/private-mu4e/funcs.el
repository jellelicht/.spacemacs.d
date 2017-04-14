;;; funcs.el --- private-mu4e layer functions file for Spacemacs.
;;
;; Author: Jelle Licht <jelle@flip>
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defconst guix-patch-cmd
  "git -C /home/jelle/Documents/src/guix/ am > /dev/null")

(defun guix-patch-attachment (msg attachnum)
  "Patch our guix tree with the attachment patch"
  (mu4e-view-pipe-attachment msg attachnum guix-patch-cmd))

(defun guix-patch-message (dc)
  "Patch our guix tree with the message body as a patch"
  (mu4e-view-pipe guix-patch-cmd))
