(defconst research-packages
  '(zotxt
    (org-pdcite :location (recipe
                           :fetcher gitlab
                           :repo "egh/org-pdcite"))))

(defun research/init-org-pdcite ()
  (use-package org-pdcite))

(defun research/init-zotxt ()
  ;; load zotxt when org is actually loaded
  (use-package zotxt
    :init
    (add-hook 'org-mode-hook

              (lambda ()
                (org-zotxt-mode 1)
                (org-add-link-type "zotero" 'org-zotxt-open-attachment
                                   #'research/org-zotero-link-export)))
    (setq org-zotxt-link-description-style :betterbibtexkey)
    :config
    (setq zotxt-default-bibliography-style "mkbehr-short")))

(defun research/org-zotero-link-export (path desc format)
  (let ((lp (research/org-zotero-link-parse-desc desc)))
    (when (not (null lp))
      (cond ((eq format 'latex)
             (format "\\autocite{%s}" (plist-get lp :citekey)))
            ;; TODO, add switches so the correct bibtex command is
            ;; chosen depending on suppress-author etc + arguments
            ((eq format 'md)
             (format "[%s]" desc)) ;;should work reasonably with pandoc-citeproc
            ((eq format 'html)
             (deferred:$
               (zotxt-get-item-bibliography-deferred
                `(:key , (org-zotxt-extract-link-id-from-link path)))
               (deferred:nextc it
                 (lambda (item)
                   (plist-get item :citation-html)))
               (deferred:sync! it)))
            ((eq format 'odt)
             (let ((rtos (split-string
                          (deferred:$
                            (zotxt-get-item-deferred
                             `(:key , (org-zotxt-extract-link-id-from-link path))
                             :248bebf1-46ab-4067-9f93-ec3d2960d0cd)
                            (deferred:nextc it
                              (lambda (item)
                                (plist-get item :248bebf1-46ab-4067-9f93-ec3d2960d0cd)))
                            (deferred:sync! it))
                          "{\\||\\|}" nil " +")))
               (format "{%s | %s | %s %s | %s |%s}"
                       (or (plist-get lp :prefix) " ")
                       (concat
                        (when (plist-get lp :suppress-author) "-")
                        (nth 2 rtos))
                       (or (plist-get lp :locator-word) " ")
                       (or (plist-get lp :locator) " ")
                       (or (plist-get lp :suffix) " ")
                       (nth 5 rtos))))
            (t nil)))))

(defun research/org-zotero-link-parse-desc (desc)
  (with-temp-buffer
    (insert desc)
    (goto-char (point-min))
    (org-pdcite-full-cite-parser)))
