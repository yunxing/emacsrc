(require-package 'autopair)
(autopair-global-mode)
(global-auto-revert-mode t)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-unset-key "\C-c\C-c")
(defun my-lineup (langelem)
    ;; Copy and modified from c-lineup-arglist
    (save-excursion
          (let ((indent-pos (point)))

                  (if (c-block-in-arglist-dwim (c-langelem-2nd-pos c-syntactic-element))
                      0; DWIM case.

                    ;; Normal case.  Indent to the token after the arglist open paren.
                    (goto-char (c-langelem-2nd-pos c-syntactic-element))
                    (if (and c-special-brace-lists
                              (c-looking-at-special-brace-list))
                            ;; Skip a special brace list opener like "({".
                            (progn (c-forward-token-2)
                                      (forward-char))
                        (forward-char))
                    (let ((arglist-content-start (point)))
                        (c-forward-syntactic-ws)
                          (when (< (point) indent-pos)
                                (goto-char arglist-content-start)
                                    (skip-chars-forward " \t"))
                            (vector (current-column)))))))

(defun my-upc-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-cont-nonempty '(add my-lineup 0))
  (c-set-offset 'arglist-close '(add my-lineup 0))
  (defun upc-wrap-region (start end)
    "Refector region into a block, pass it to a function"
    (interactive "r")
    (save-excursion
      (if (> (point) (mark))
          (exchange-point-and-mark))
      (goto-char end) (insert "\n}")
      (goto-char start) (insert "^{\n")
      (backward-char 2)
      (forward-sexp)
      (c-indent-region start (point))))
  )

(add-hook 'c-mode-hook 'my-upc-mode-hook)
(add-hook 'objc-mode-hook 'my-upc-mode-hook)
(add-hook 'c++-mode-hook 'my-upc-mode-hook)
(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "C-c o") 'ff-find-other-file)))
(provide 'init-editing)
