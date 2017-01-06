;;; package --- Summary
;;; Commentary:
;;; Code:


(add-to-list 'load-path "~/.emacs.d")
;; (require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil)
(defconst *is-a-mac* (eq system-type 'darwin))
(defconst *is-cocoa-emacs* (and *is-a-mac* (eq window-system 'ns)))

(require 'init-compat)
(require 'init-utils)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

(require-package 'wgrep)
(require-package 'project-local-variables)
(require-package 'diminish)
(require-package 'scratch)
(require-package 'mwe-log-commands)
(require-package 'go-mode)
(setq-default tab-width 4)

;; (add-hook 'go-mode-hook (lambda ()
;;                           (add-hook 'before-save-hook 'gofmt-before-save)))
;; (add-to-list 'load-path (concat (getenv "GOPATH")  "/src/github.com/golang/lint/misc/emacs"))
;; (require 'golint)

;; (require 'init-yasnippet)
(require 'init-frame-hooks)
(require 'init-maxframe)
(require 'init-dired)
(require 'init-auto-complete)
(require 'init-isearch)
(require 'init-uniquify)
(require 'init-ibuffer)
(require 'init-flycheck)
(require 'init-ido)
(require-package 'iedit)
(require 'init-editing-utils)

;;----------------------------------------------------------------------------
;; My init files
;;----------------------------------------------------------------------------
(require 'init-buffers)
(require 'init-editing)
(require 'init-my-git)
(require 'init-haskell)
(require 'init-clang)

;;----------------------------------------------------------------------------
;; Reason setup
;;----------------------------------------------------------------------------


;; (setq opam (substring (shell-command-to-string "opam config var prefix 2> /dev/null") 0 -1))
;; (add-to-list 'load-path (concat opam "/share/emacs/site-lisp"))
;; (setq refmt-command "/Users/yunxing/programming/infer/node_modules/reason/_build/ocamlfind/bin/refmt")
;; (setq reason-merlinfmt-command (concat opam "/bin/refmt_merlin"))
;; (require 'reason-mode)
;; (require 'merlin)
;; (setq merlin-ac-setup t)
;; (add-hook 'reason-mode-hook (lambda ()
;;                               (add-hook 'before-save-hook 'refmt-before-save)
;;                               (merlin-mode)
;;                               ))

(require 'yarn-reason)
(add-hook 'reason-mode-hook (lambda ()
                              (add-hook 'before-save-hook 'refmt-before-save)))


;;----------------------------------------------------------------------------
;; Allow access from emacsclient
;;----------------------------------------------------------------------------
(require 'server)
(unless (server-running-p)
  (server-start))
(vc-mode -1)
(setq vc-handled-backends ())
(message "init completed in %.2fms"
         (sanityinc/time-subtract-millis (current-time) before-init-time))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" default)))
 '(warning-minimum-level :error))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
