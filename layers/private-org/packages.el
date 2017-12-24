;;; packages.el --- private-org layer packages file for Spacemacs.
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

(defconst private-org-packages
  '(org))

(defun private-org/pre-init-org ()
  (use-package ox-latex
    :config
    (setq org-latex-pdf-process
          '("pdflatex %f" "biber %b" "pdflatex %f" "pdflatex %f"))
    (add-to-list 'org-latex-classes
                 '("ieeetran"
                   "\\documentclass[hidelinks]{IEEEtran}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))))

(defun private-org/post-init-org ()
  (spacemacs|use-package-add-hook org
    :post-config (progn (add-to-list 'org-babel-load-languages '(python . t))
                        (add-to-list 'org-babel-load-languages '(emacs-lisp . t))
                        ))
  (with-eval-after-load 'org
    (require 'org-protocol)
    (setq org-directory "~/Documents/org"
          org-default-file (concat org-directory "/notes.org")
          org-agenda-files (list (concat org-directory "/agenda.org")
                                 (concat org-directory "/gmail.org")
                                 (concat org-directory "/datumprikker.org")
                                 (concat org-directory "/milvum.org")
                                 (concat org-directory "/notes.org")
                                 )
          org-default-notes-file org-default-file)))

;;; packages.el ends here
