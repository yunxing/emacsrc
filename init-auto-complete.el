(require-package 'auto-complete)
(require-package 'pos-tip)
(require-package 'fuzzy)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(setq ac-expand-on-auto-complete t)
(setq ac-quick-help-prefer-pos-tip t)
(setq ac-auto-start t)
(setq ac-use-quick-help t)
(setq ac-dwim nil) ; To get pop-ups with docs even if a word is uniquely completed
(setq ac-auto-show-menu t)
(setq ac-use-fuzzy t)
(setq ac-fuzzy-enable t)
(setq ac-quick-help-delay 0.5)

;; (define-key ac-completing-map (kbd "C-f") 'ac-complete)
;;----------------------------------------------------------------------------
;; Use Emacs' built-in TAB completion hooks to trigger AC (Emacs >= 23.2)
;;----------------------------------------------------------------------------
(setq tab-always-indent 'complete)  ;; use 't when auto-complete is disabled
(add-to-list 'completion-styles 'initials t)
(set-default 'ac-sources
             '(ac-source-imenu
               ac-source-dictionary
               ac-source-words-in-buffer
               ac-source-words-in-same-mode-buffers
               ac-source-words-in-all-buffer))
(dolist (mode '(magit-log-edit-mode log-edit-mode org-mode text-mode haml-mode
                sass-mode yaml-mode csv-mode espresso-mode haskell-mode
                html-mode nxml-mode sh-mode smarty-mode clojure-mode
                lisp-mode textile-mode markdown-mode tuareg-mode
                js3-mode css-mode less-css-mode sql-mode ielm-mode))
  (add-to-list 'ac-modes mode))


(provide 'init-auto-complete)
