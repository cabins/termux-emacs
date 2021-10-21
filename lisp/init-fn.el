;;; init-fn.el --- define some useful interactive functions -*- lexical-binding: t -*-
;; Author: Cabins
;; Maintainer: Cabins

;;; Commentary:
;; the functions are all for debuging.
;; (c) Cabins Kong, 2020-2021

;;; Code:

;;;###autoload
(defmacro tenon/timer (&rest body)
  "Measure the time of code BODY running."
  `(let ((time (current-time)))
     ,@body
     (float-time (time-since time))))

;;;###autoload
(defun tenon/tmp-reset-elpa-repo ()
  "Reset Elpa temporary.  Useful when emacs-china sync fails."

  (interactive)
  (setq package-archives '(("gnu"   . "http://elpa.gnu.org/packages/")
                           ("melpa" . "http://melpa.org/packages/"))))

;;;###autoload
(defun tenon/cleaner-gui ()
  "Make GUI cleaner, with less UI elements."

  (interactive)
  ;; scrollbar
  (when (and (fboundp 'scroll-bar-mode) (not (eq scroll-bar-mode -1)))
    (scroll-bar-mode -1))
  ;; tool-bar
  (when (and (fboundp 'tool-bar-mode) (not (eq tool-bar-mode -1)))
    (tool-bar-mode -1))
  ;; menu-bar, keep on macos
  (unless (memq (window-system) '(mac ns))
    (when (and (fboundp 'menu-bar-mode) (not (eq menu-bar-mode -1)))
      (menu-bar-mode -1)))
  ;; tooltips in echo-aera
  (when (and (fboundp 'tooltip-mode) (not (eq tooltip-mode -1)))
    (tooltip-mode -1))
  (fringe-mode 0))

(tenon/cleaner-gui)

;;;###autoload
(defun tenon/reload-init-file ()
  "Reload Emacs init file."

  (interactive)
  (load-file user-init-file))

;;;###autoload
(defun tenon/update-config ()
  "Update tenon config."

  (interactive)
  (cd user-emacs-directory)
  (shell-command "git pull"))

;;;###autoload
(defun tenon/change-theme ()
  "Change theme."

  (interactive)
  (if custom-enabled-themes
      (let ((theme-list custom-enabled-themes))
	(call-interactively 'load-theme)
	(dolist (current-theme theme-list)
	  (disable-theme current-theme)))
    (call-interactively 'load-theme)))

(provide 'init-fn)

;; Local Variables:
;; byte-compile-warnings: (not free-vars unresolved)
;; End:
;;; init-fn.el ends here
