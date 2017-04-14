;;; packages.el --- emms layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: Michael Englehorn <michael@englehorn.com>
;; URL: https://github.com/K0HAX/spacemacs-emms
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
;; added to `emms-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `emms/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `emms/pre-init-PACKAGE' and/or
;;   `emms/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(setq emms-packages
      '(emms
        emms-player-mpv
        persp-mode
        emms-state))

(setq emms-excluded-packages '())

(defun emms/init-emms ()
  "Initialize my package"
  (use-package emms
    :defer t
    :init
    (progn
      (global-set-key [(f7)] 'emms-smart-browse)
      (spacemacs/declare-prefix "am" "media")
      (spacemacs/declare-prefix "ame" "EMMS")
      (spacemacs/set-leader-keys
        "ames" 'emms-streams
        "ameb" 'emms-browser
        "amep" 'emms-playlist-mode-go
        "ameo" 'emms-show
        "a SPC" 'emms-pause
        "a ." 'emms-next
        "a ," 'emms-previous
        "a RET" 'emms-smart-browse
        )

      (add-hook 'emms-browser-show-display-hook 'evil-initialize)
      (add-hook 'emms-stream-hook 'evil-initialize)
      )
    :config
    (progn
      (require 'emms-setup)
      (emms-standard)
      (require 'emms-player-simple)
      (require 'emms-source-file)
      (require 'emms-source-playlist)
      (setq emms-player-list '())
      (emms-mode-line 0)
      (emms-playing-time 1)
      (autoload 'emms-smart-browse "emms-browser.el" "Browse with EMMS" t)
      (define-key emms-browser-mode-map (kbd "D") 'emms-browser-move-files-to-trash)
      (define-key emms-browser-mode-map (kbd "t") 'emms-browser-toggle-subitems)
      (evilified-state-evilify-map emms-stream-mode-map
        :mode emms-stream-mode
        )
      (evilified-state-evilify-map emms-mark-mode-map
        :mode emms-mark-mode
        :bindings
        "t" 'emms-mark-toggle
        "u" 'emms-mark-unmark-forward
        "K" 'emms-mark-kill-marked-tracks
        "M" 'emms-mark-mode-disable
        )
      (evilified-state-evilify-map emms-playlist-mode-map
        :mode emms-playlist-mode
        :bindings
        "j" 'emms-next
        "k" 'emms-previous
        "K" 'emms-playlist-mode-first
        "J" 'emms-playlist-mode-last
        "W" 'emms-playlist-save
        ;; P also works for emms-pause but it's kind of a stupid binding.
        ;; can't use SPC, so we'll make do with TAB
        (kbd "TAB") 'emms-pause
        "," 'emms-seek-minute-backward
        "." 'emms-seek-minute-forward
        "u" 'emms-playlist-mode-undo
        "p" 'emms-playlist-mode-yank
        "P" 'emms-playlist-mode-yank-pop
        "O" 'emms-playlist-mode-insert-newline
        ;; having trouble with this because it is
        ;; sometimes calling 'emms-playlist-mode-current-kill
        ;;"K" 'emms-mark-kill-marked-tracks
        "M" 'emms-mark-mode
        )
      (evilified-state-evilify-map emms-browser-mode-map
        :mode emms-browser-mode
        :bindings
        ;; since this is normally SPC
        "t" 'emms-browser-toggle-subitems
        ;; makes more sense than C-j
        (kbd "<S-return>") 'emms-browser-add-tracks-and-play
        )
      ;; TODO: emms-browser search mode keybindings
      ;;(require 'emms-player-simple)
      ;;(require 'emms-source-file)
      ;;(require 'emms-source-playlist)
      (require 'emms-player-mpv)
      ;;(setq emms-player-list '(emms-player-mplayer))
      (setq emms-source-file-default-directory "/home/jelle/Music/")
      (emms-add-directory-tree emms-source-file-default-directory))))

(defun emms/init-emms-state ()
  (use-package emms-state
    ;; for some reason if this is deferred you can't bring up the smart browser.
    :config
    (emms-state-mode 0)))

(defun emms/init-emms-player-mpv ()
  "Initialize my package"
  (use-package emms-player-mpv
    :ensure t :defer t
    :config
    (progn
      (add-to-list 'emms-player-list 'emms-player-mpv))))

(defun emms/post-init-persp-mode ()
  ;; do not save emmss buffers
  (with-eval-after-load 'persp-mode
    (push (lambda (b) (with-current-buffer b (eq major-mode 'emms-playlist-mode)))
          persp-filter-save-buffers-functions))
  (spacemacs|define-custom-layout emms-spacemacs-layout-name
    :binding emms-spacemacs-layout-binding
    :body
    (progn
      ;; hook to add all EMMS buffers to the layout
      (defun spacemacs-layouts/add-emms-buffer-to-persp ()
        (persp-add-buffer (current-buffer)
                          (persp-get-by-name
                           emms-spacemacs-layout-name)))
      (add-hook 'emms-playlist-mode-hook #'spacemacs-layouts/add-emms-buffer-to-persp)
      ;; Start emms
      (call-interactively 'emms))))

;;; packages.el ends here
