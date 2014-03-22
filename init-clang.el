(require-package 'auto-complete-clang-async)
(require 'auto-complete-clang-async)
(defun ac-cc-mode-setup ()
  (setq ac-clang-complete-executable "~/.emacs.d/clang-complete")
  (setq ac-sources '(ac-source-clang-async ac-source-yasnippet))
  (setq ac-clang-cflags (split-string
                         "
-D_GNU_SOURCE
-std=gnu99
-O2
-g
-I/Users/yunxing/source/upthere/include/portability/supplement
-I/Users/yunxing/source/upthere/include
-I/Users/yunxing/source/upthere/include/portability/replace
-I/Users/yunxing/source/upthere/build/darwin/include
-I/Users/yunxing/source/upthere/lib/runtime
-I/Users/yunxing/source/upthere/test/include
-Wall
-Wextra
-Werror
-fblocks
-Wno-unused-parameter
-Wno-unused-function
-Wno-#warnings
-fPIC
-Wno-deprecated
-fdiagnostics-show-note-include-stack
-fmacro-backtrace-limit=0
-Wtrigraphs
-Wmissing-prototypes
-Wmissing-braces
-Wparentheses
-Wswitch
-Wswitch-enum
-Wunreachable-code
-Wunused-label
-Wunused-variable
-Wunused-value
-Wempty-body
-Wuninitialized
-Wno-shadow
-Wunknown-pragmas
-Wfour-char-constants
-Wno-conversion
-Wconstant-conversion
-Wint-conversion
-Wenum-conversion
-Wno-shorten-64-to-32
-Wpointer-sign
-Wno-newline-eof
-fasm-blocks
-Wdeprecated-declarations
-Wno-sign-conversion
-Wno-unknown-warning-option
-Wno-unused-variable
-Wno-constexpr-not-const
-D'OSNAME=\"darwin\"'
-I/Users/yunxing/source/upthere/3rdparty/openssl/include
-I/Users/yunxing/source/upthere/3rdparty/curl/include
-I/Users/yunxing/source/upthere/3rdparty/ev/include
-I/Users/yunxing/source/upthere/3rdparty/website/include
-I/Users/yunxing/source/upthere/3rdparty/ev/include/ev
"))
  (ac-clang-launch-completion-process)
  )

(defun my-ac-config ()
  (add-hook 'c-mode-common-hook 'ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))

(my-ac-config)
(provide 'init-clang)
