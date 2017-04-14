;;; packages.el --- private-mu4e layer packages file for Spacemacs.
;;
;; Author: Jelle Licht <jlicht@fsfe.org>
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


;;; Code:

(defconst private-mu4e-packages
  '(mu4e))

(defun private-mu4e/post-init-mu4e ()
  (with-eval-after-load 'mu4e
    ;; define 'g' as the shortcut
    (add-to-list 'mu4e-view-actions
                 '("gGuix patch apply" . guix-patch-message) t)
    ;; define 'g' as the shortcut
    (add-to-list 'mu4e-headers-actions
                 '("gGuix patch apply" . guix-patch-message) t)
    (add-to-list 'mu4e-headers-actions
                 '("XX patch apply" . mu4e-action-count-lines) t)

    ;; defining 'g' as the shortcut
    (add-to-list 'mu4e-view-attachment-actions
                 '("gGuix patch apply" . guix-patch-attachment) t)
    (add-to-list 'mu4e-bookmarks
                 (make-mu4e-bookmark
                  :name  "ML related"
                  :query "flag:list AND flag:unread"
                  :key ?m))

    ;; Set up some common mu4e variables
    (setq mu4e-update-interval 300
          mu4e-enable-mode-line nil
          mu4e-compose-signature-auto-include nil
          mu4e-view-show-images nil
          mu4e-maildir                "~/Documents/mail"
          mu4e-view-show-addresses t)
    (setq message-send-mail-function 'smtpmail-send-it
          smtpmail-debug-info t        ; Uncomment to debug
          smtpmail-debug-verb t        ; Uncomment to debug on server
          mail-specify-envelope-from t ; Use from field to specify sender name.
          mu4e-headers-skip-duplicates t
          mu4e-attachment-dir  "~/Downloads/attachments"
          message-kill-buffer-on-exit t
          ;; compose with the current context is no context matches;
          ;; default is to ask
          mu4e-compose-context-policy nil
          mail-envelope-from 'header) ;
    (setq mu4e-contexts
          `( ,(make-mu4e-context
               :name "gmail"
               :enter-func (lambda () (mu4e-message "Switch to the Private context"))
               :vars '(  (user-mail-address      . "wordempire@gmail.com"  )
                         (user-full-name     . "Jelle Licht" )
                         (mu4e-get-mail-command       . "mbsync gmail" )
                         (mu4e-sent-messages-behavior  . delete)
                         (mu4e-trash-folder            . "/gmail/trash")
                         (mu4e-sent-folder             . "/gmail/sent")
                         (mu4e-drafts-folder           . "/gmail/drafts")
                         (mu4e-refile-folder           . "/gmail/archive")
                         (smtpmail-default-smtp-server . "smtp.gmail.com")
                         (smtpmail-smtp-server         . "smtp.gmail.com")
                         (smtpmail-smtp-user . "wordempire@gmail.com")
                         (smtpmail-smtp-service        . 587)))
             ,(make-mu4e-context
               :name "fsfe"
               :enter-func (lambda () (mu4e-message "Switch to the opensource context"))
               :vars '(  (user-mail-address      . "jlicht@fsfe.org"  )
                         (user-full-name     . "Jelle Licht" )
                         (mu4e-get-mail-command       . "mbsync gmail" )
                         (mu4e-sent-messages-behavior  . sent)
                         (mu4e-trash-folder            . "/gmail/trash")
                         (mu4e-sent-folder             . "/gmail/sent")
                         (mu4e-drafts-folder           . "/gmail/drafts")
                         (mu4e-refile-folder           . "/gmail/archive")
                         (smtpmail-default-smtp-server . "mail.fsfe.org")
                         (smtpmail-smtp-server         . "mail.fsfe.org")
                         (smtpmail-smtp-user . "jlicht")
                         (smtpmail-smtp-service        . 587)))
             ,(make-mu4e-context
               :name "milvum"
               :enter-func (lambda () (mu4e-message "Switch to the Work context"))
               :vars '(  (user-mail-address      . "jelle.licht@milvum.com" )
                         (user-full-name     . "Jelle Licht" )
                         (mu4e-get-mail-command       . "mbsync milvum" )
                         (mu4e-sent-messages-behavior  . delete)
                         (mu4e-trash-folder            . "/milvum/trash")
                         (mu4e-sent-folder             . "/milvum/sent")
                         (mu4e-drafts-folder           . "/milvum/drafts")
                         (mu4e-refile-folder           . "/milvum/archive")
                         (smtpmail-smtp-user . "jelle.licht@milvum.com")
                         (smtpmail-default-smtp-server . "smtp.gmail.com")
                         (smtpmail-smtp-server         . "smtp.gmail.com")
                         (smtpmail-smtp-service        . 587)
                         ))
             ,(make-mu4e-context
               :name "posteo"
               :enter-func (lambda () (mu4e-message "Switch to the posteo context"))
               :vars '(  (user-mail-address      . "jlicht@posteo.net" )
                         (user-full-name     . "Jelle Licht" )

                         (mu4e-get-mail-command       . "mbsync posteo" )
                         (mu4e-trash-folder            . "/posteo/trash")
                         (mu4e-sent-folder             . "/posteo/sent")
                         (mu4e-drafts-folder           . "/posteo/drafts")
                         (mu4e-refile-folder           . "/posteo/archive")
                         (smtpmail-smtp-user . "jlicht@posteo.net")
                         (smtpmail-default-smtp-server . "posteo.de")
                         (smtpmail-local-domain        . "posteo.de")
                         (smtpmail-smtp-server         . "posteo.de")
                         (smtpmail-stream-type         . ssl)
                         (smtpmail-smtp-service        . 465)
                         ))))))

;;; packages.el ends here
