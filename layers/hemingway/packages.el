;;; packages.el --- hemingway layer packages file for Spacemacs.
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

(defconst hemingway-packages
  '(writeroom-mode
    writegood-mode))

(defun hemingway/init-writeroom-mode ()
  (use-package writeroom-mode
    :defer t
    :init
    (add-hook 'writeroom-mode-hook 'auto-fill-mode)
    (spacemacs/set-leader-keys-for-major-mode 'org-mode
      "Tw" 'writeroom-mode)
    :config
    (spacemacs|diminish writeroom-mode " R" " R")))

(defun hemingway/init-writegood-mode ()
  (use-package writegood-mode
    :config
    (writegood-mode)))

;;; packages.el ends here
