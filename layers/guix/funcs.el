;;; funcs.el --- guix layer functions file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Jelle Licht <jelle@flip>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun view-guix-bugs ()
  "view guix bugs."
  (interactive)
  (debbugs-gnu nil "guix" nil nil nil))
