;;; packages.el --- pdf-private-misc layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Jelle Licht <wordempire@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


;;; Code:

(defconst pdf-private-misc-packages
  '(helm-bibtex
    org-ref-core))

(defun pdf-private-misc/pre-init-helm-bibtex ()
  (setq bibtex-completion-pdf-field "file"))

(defun pdf-private-misc/post-init-org-ref-core ()
  (setq org-ref-open-pdf-function 'my/org-ref-open-pdf-at-point))

;;; packages.el ends here
