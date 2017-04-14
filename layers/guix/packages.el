;;; packages.el --- guix layer packages file for Spacemacs.
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

(defconst guix-packages
  '(guix
    debbugs)
  "The list of Lisp packages required by the guix layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")


(defun guix/init-guix ()
  (use-package guix
    :defer t
    :init
    (progn
      (add-hook 'shell-mode-hook 'guix-prettify-mode)
      (spacemacs/declare-prefix "Ag" "guix")
      (evil-leader/set-key
        "Agg" 'guix
        "Aga" 'guix-all-available-packages
        "Agi" 'guix-installed-user-packages
        "Agp" 'guix-pull
        "Age" 'guix-edit))))

(defun guix/init-debbugs ()
  (use-package debbugs
    :defer t
    :init
    (progn
      (spacemacs/declare-prefix "Ag" "guix")
      (evil-leader/set-key
        "Agd" 'view-guix-bugs))))

;;; packages.el ends here
