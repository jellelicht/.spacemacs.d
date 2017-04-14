;;; packages.el --- private-rcirc layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Jelle Licht <jelle@flip>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst private-rcirc-packages
  '(rcirc))

(defun private-rcirc/pre-init-rcirc ()
  (setq rcirc-server-alist
        '(("irc.freenode.net" :port 6697 :encryption tls
           :channels ("#guix" "#guile" "#tribler")
           :nick "jlicht")
          ("irc.rizon.net" :port 6697 :encryption tls
           :channels ("#gilvum")
           :nick "jlicht"))))

(defun private-rcirc/post-init-rcirc ()
  (with-eval-after-load 'rcirc
    (add-hook 'rcirc-mode-hook 'rcirc-block-connection-ping)))

;;; packages.el ends here
