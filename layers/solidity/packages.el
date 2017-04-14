;;; packages.el --- solidity layer packages file for Spacemacs.
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

(defconst solidity-packages
  '((solidity-mode :requires flycheck)
    flycheck))

(defun solidity/init-solidity-mode ()
  (use-package solidity-mode
    :defer t))

(defun solidity/post-init-flycheck ()
  (spacemacs/enable-flycheck 'solidity-mode))
;;; packages.el ends here
