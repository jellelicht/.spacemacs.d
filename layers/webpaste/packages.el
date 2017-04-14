;;; packages.el --- webpaste layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Jelle Licht <jelle@lumo>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `webpaste-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `webpaste/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `webpaste/pre-init-PACKAGE' and/or
;;   `webpaste/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst webpaste-packages
  '(webpaste))

(defun webpaste/init-webpaste ()
  (use-package webpaste
    :bind (("C-c C-p C-b" . webpaste-paste-buffer)
           ("C-c C-p C-r" . webpaste-paste-region))
    :config
    (progn
      (setq webpaste-paste-confirmation t)
      (add-to-list
       'webpaste-providers-alist
       '("paste.lisp.com"
         :uri "http://paste.lisp.com/submit"
         :post-field "content"
         :success-lambda webpaste--providers-success-location-header))
      (setq webpaste-provider-priority '("paste.lisp.com")))))
;;; packages.el ends here
