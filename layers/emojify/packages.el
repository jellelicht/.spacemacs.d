;;; packages.el --- emojify layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author:  <jlicht@fsfe.org>
;; URL: https://github.com/wordempire/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst emojify-packages
  '(emojify))


(defun emojify/init-emojify ()
  (use-package emojify
    :init
    (progn
      (emojify-set-emoji-styles '(github))
      (setq emojify-point-entered-behaviour 'uncover)
      (global-emojify-mode))))

;;; packages.el ends here
