;;; funcs.el --- private-pdf-misc layer functions file for Spacemacs.
;;
;; Author: Jelle Licht <jelle@flip>
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defun my/org-ref-open-pdf-at-point ()
  "Open the pdf for bibtex key under point if it exists."
  (interactive)
  (let* ((results (org-ref-get-bibtex-key-and-file))
         (key (car results))
         (pdf-file (car (bibtex-completion-find-pdf key))))
    (message "Res: %s" results)
    (message "Key %s" key)
    (message "meta: %s" (bibtex-completion-find-pdf key))
    (if (file-exists-p pdf-file)
        (find-file pdf-file)
      (message "No PDF found for %s" key))))
