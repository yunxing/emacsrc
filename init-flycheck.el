(when (eval-when-compile (>= emacs-major-version 24))
  (require-package 'flycheck)
  (setq flycheck-clang-include-path (split-string "
/Users/yunxing/source/upthere/include
"))
  (add-hook 'after-init-hook 'global-flycheck-mode))

(provide 'init-flycheck)
