;; -*- geiser-scheme-implementation: guile -*-
(use-modules (guix)
             (guix build-system trivial)
             (gnu packages code)
             (gnu packages emacs)
             (gnu packages fonts)
             (gnu packages version-control))

(package
 (name "jlicht-spacemacs-config")
 (version "0.0")
 (source #f)
 (propagated-inputs
  `(("font-adobe-source-code-pro" ,font-adobe-source-code-pro)
    ("the-silver-searcher" ,the-silver-searcher)
    ("emacs" ,emacs)
    ;;("emacs-pdf-tools" ,emacs-pdf-tools) ;; TODO: splice deps of this package in here
    ;; TODO: Add tern js server dependency
    ;; TODO: Add meghanada server dependency
    ;; TODO: Add sdcv
    ("git" ,git)))
 (build-system trivial-build-system)
 (arguments '(#:builder (mkdir %output)))
 (home-page "https://github.com/wordempire/.spacemacs.d")
 (synopsis "Dummy package for my personal spacemacs config")
 (description "This package serves as an easy way to install dependencies for my
personalized @code{Spacemacs} configuration. As such, it only contains the
propagated-inputs for my actual config.")
 (license #f))
