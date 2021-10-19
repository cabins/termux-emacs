;;; init-eglot.el --- config for eglot -*- lexical-binding: nil -*-
;;; Commentary:

;;; Code:

(use-package eglot
  :config
  ;; (setq eglot-ignored-server-capabilities '(:documentHighlightProvider))
  :init
  (dolist (hook '(c-mode-hook
		  c++-mode-hook
		  go-mode-hook
		  java-mode-hook
		  js-mode-hook
		  python-mode-hook
		  rust-mode-hook))
    (add-hook hook 'eglot-ensure)))

(provide 'init-eglot)
;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
;;; init-eglot.el ends here