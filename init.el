;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides
modifying the variable values."
  (setq-default dotspacemacs-distribution 'spacemacs
                dotspacemacs-enable-lazy-installation 'unused
                dotspacemacs-ask-for-lazy-installation t
                dotspacemacs-configuration-layer-path '()
                dotspacemacs-configuration-layers '(html
                                                    ;; Chat
                                                    (rcirc :variables rcirc-enable-authinfo-support t)
                                                    ;; Checkers
                                                    spell-checking
                                                    syntax-checking
                                                    ;; Completion
                                                    ivy
                                                    auto-completion
                                                    ;; Emacs
                                                    ibuffer
                                                    better-defaults
                                                    org
                                                    ;; E-mail
                                                    mu4e
                                                    ;; Frameworks
                                                    ;; Fun
                                                    emoji
                                                    ;; Programming and markup languages
                                                    haskell
                                                    shell-scripts
                                                    markdown
                                                    typescript
                                                    javascript
                                                    csv
                                                    yaml
                                                    (java :variables
                                                          gradle-use-gradlew t
                                                          gradle-gradlew-executable "./gradlew")
                                                    emacs-lisp
                                                    latex
                                                    bibtex
                                                    scheme
                                                    (c-c++ :variables
                                                           c-c++-default-mode-for-headers 'c-mode
                                                           c-c++-enable-clang-support t)
                                                    ;; OS
                                                    ;; Source control
                                                    git
                                                    version-control
                                                    ;; Tags
                                                    ;; Themes
                                                    ;; Tools
                                                    ansible
                                                    docker
                                                    (pdf-tools :variables
                                                               pdf-info-epdfinfo-program "~/.guix-profile/bin/epdfinfo"
                                                               pdf-annot-activate-created-annotations t
                                                               )
                                                    (shell :variables
                                                           shell-default-height 30
                                                           shell-default-position 'bottom
                                                           shell-default-shell 'eshell)
                                                    ;; Web services
                                                    ;; Custom layers
                                                    solidity
                                                    tldr
                                                    ;; Custom Configuration layers
                                                    private-org
                                                    private-rcirc
                                                    private-mu4e
                                                    pdf-private-misc)
                dotspacemacs-additional-packages '()
                dotspacemacs-frozen-packages '()
                dotspacemacs-excluded-packages '()
                dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs
initialization before layers configuration. You should not put
any user code in there besides modifying the variable values."
  (setq-default dotspacemacs-elpa-https t
                dotspacemacs-elpa-timeout 5
                dotspacemacs-check-for-update nil
                dotspacemacs-elpa-subdirectory nil
                dotspacemacs-editing-style 'vim
                dotspacemacs-verbose-loading nil
                dotspacemacs-startup-banner nil
                dotspacemacs-startup-lists '(
                                             agenda
                                             todos
                                             projects
                                             )
                dotspacemacs-startup-buffer-responsive t
                dotspacemacs-scratch-mode 'emacs-lisp-mode
                dotspacemacs-themes '(spacemacs-dark spacemacs-light)
                dotspacemacs-colorize-cursor-according-to-state t
                dotspacemacs-default-font '("Source Code Pro"
                                            :size 13
                                            :weight normal
                                            :width normal
                                            :powerline-scale 1.1)
                dotspacemacs-leader-key "SPC"
                dotspacemacs-emacs-command-key "SPC"
                dotspacemacs-ex-command-key ":"
                dotspacemacs-emacs-leader-key "M-m"
                dotspacemacs-major-mode-leader-key ","
                dotspacemacs-major-mode-emacs-leader-key "C-M-m"
                dotspacemacs-distinguish-gui-tab nil
                dotspacemacs-remap-Y-to-y$ nil
                dotspacemacs-retain-visual-state-on-shift t
                dotspacemacs-visual-line-move-text nil
                dotspacemacs-ex-substitute-global nil
                dotspacemacs-default-layout-name "Default"
                dotspacemacs-display-default-layout t
                dotspacemacs-auto-resume-layouts nil
                dotspacemacs-large-file-size 1
                dotspacemacs-auto-save-file-location 'cache
                dotspacemacs-max-rollback-slots 5
                dotspacemacs-helm-resize nil
                dotspacemacs-helm-no-header nil
                dotspacemacs-helm-position 'bottom
                dotspacemacs-helm-use-fuzzy 'always
                dotspacemacs-enable-paste-transient-state nil
                dotspacemacs-which-key-delay 0.4
                dotspacemacs-which-key-position 'bottom
                dotspacemacs-loading-progress-bar nil
                dotspacemacs-fullscreen-at-startup t
                dotspacemacs-fullscreen-use-non-native nil
                dotspacemacs-maximized-at-startup nil
                dotspacemacs-active-transparency 90
                dotspacemacs-inactive-transparency 90
                dotspacemacs-show-transient-state-title t
                dotspacemacs-show-transient-state-color-guide t
                dotspacemacs-mode-line-unicode-symbols nil
                dotspacemacs-smooth-scrolling t
                dotspacemacs-line-numbers nil
                dotspacemacs-folding-method 'evil
                dotspacemacs-smartparens-strict-mode nil
                dotspacemacs-smart-closing-parenthesis nil
                dotspacemacs-highlight-delimiters 'all
                dotspacemacs-persistent-server nil
                dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
                dotspacemacs-default-package-repository nil
                dotspacemacs-whitespace-cleanup 'changed))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer
configuration executes. This function is mostly useful for
variables that need to be set before packages are loaded. If you
are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  (require 'iso-transl))

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs
initialization after layers configuration. This is the place
where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a
package is loaded, you should place your code here."


  ;; Mitigate Bug#28350 (security) in Emacs 25.2 and earlier.
  (eval-after-load "enriched"
    '(defun enriched-decode-display-prop (start end &optional param)
       (list start end)))
  (setq projectile-switch-project-action 'magit-status)
  (display-time-mode 1)
  (spacemacs/toggle-mode-line-battery-on)
  (setq browse-url-browser-function 'eww-browse-url)
  ;; keybindings are exactly the same as in vimperator unless otherwise stated
  (evil-define-key 'normal eww-mode-map
    ;; "&" 'eww-browse-with-external-browser ;; default in eww-mode
    ;; "q" 'quit-window ;; different in vimperator (run macro)
    "a" 'eww-add-bookmark
    "yy" 'eww-copy-page-url
    "f" 'eww-lnum-follow
    "F" 'eww-lnum-universal ;; in vimperator open new tab
    "gu" 'eww-up-url
    "gt" 'eww-top-url
    "f" 'eww-lnum-follow
    "F" 'eww-lnum-universal
    "h" 'eww-back-url ;; H in vimperator, because h is :help, but I think lowercase is better for us
    "l" 'eww-forward-url ;; in vimperator, L is used for consistency, but again I think lower case is nicer for us
    "r" 'eww-reload)
  (setq hippie-expand-try-functions-list
        '(try-expand-dabbrev
          try-expand-dabbrev-all-buffers
          try-complete-lisp-symbol-partially
          try-complete-lisp-symbol
          try-complete-file-name-partially
          try-complete-file-name))
  (spacemacs/set-leader-keys-for-major-mode 'eww-mode
    "h"     'eww-history
    "ba"    'eww-add-bookmark ;; also "a" in normal state
    "bb"    'eww-list-bookmarks
    "s"     'eww-view-source
    "c"     'url-cookie-list)
  (with-eval-after-load 'pdf-tools
    (define-key pdf-view-mode-map (kbd "C-s") 'isearch-forward))
  (with-eval-after-load 'geiser-guile
    (add-to-list 'geiser-guile-load-path "~/Documents/src/guix")
    (add-to-list 'geiser-guile-load-path "~/Documents/guix-pkgs")))



;; No more custom nonsense in my init.el!
(setq custom-file "~/.spacemacs.d/custom.el")
(when (file-exists-p custom-file)
  (load-file custom-file))
