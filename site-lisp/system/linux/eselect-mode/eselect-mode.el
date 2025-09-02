;;; eselect-mode.el --- edit eselect files

;; Copyright 2006-2023 Gentoo Authors

;; Author: Matthew Kennedy <mkennedy@gentoo.org>
;;	Diego Pettenò <flameeyes@gentoo.org>
;;	Christian Faulhammer <fauli@gentoo.org>
;;	Ulrich Müller <ulm@gentoo.org>
;; Maintainer: <emacs@gentoo.org>
;; Keywords: languages

;; This file is part of the 'eselect' tools framework.

;; eselect is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 2 of the License, or
;; (at your option) any later version.

;; eselect is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with eselect.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'sh-script)
(require 'font-lock)

;;; Variables.

(defgroup eselect nil
  "Major mode for Gentoo eselect modules."
  :group 'languages)

(defcustom eselect-mode-fix-whitespace t
  "If non-nil, delete trailing whitespace before writing a file."
  :type 'boolean
  :group 'eselect)

(defcustom eselect-mode-update-copyright t
  "If non-nil, update copyright years before writing a file."
  :type 'boolean
  :group 'eselect)

(defvar eselect-mode-copyright-regexp
  "^#[ \t]*Copyright[ \t]+\\([1-9][0-9]+\\)\\(?:-\\([1-9][0-9]+\\)\\)?\
[ \t]+\\(.*\\<Gentoo Authors\\>.*\\)")

;;; Font-lock.

(defvar eselect-mode-keywords-warn
  '(("eval")
    font-lock-warning-face))

(defvar eselect-mode-keywords-core
  '(("die" "check_do" "do_action" "inherit" "sed")
    font-lock-type-face))

(defvar eselect-mode-keywords-output
  '(("write_error_msg" "write_warning_msg" "write_list_start"
     "write_numbered_list_entry" "write_kv_list_entry"
     "write_numbered_list" "highlight" "highlight_warning"
     "highlight_marker" "is_output_mode" "space")
    font-lock-type-face))

(defvar eselect-mode-keywords-tests
  '(("has" "is_function" "is_number")
    font-lock-type-face))

(defvar eselect-mode-keywords-path-manipulation
  '(("basename" "dirname" "canonicalise" "relative_name")
    font-lock-type-face))

(defvar eselect-mode-keywords-config
  '(("store_config" "load_config" "append_config")
    font-lock-type-face))

(defvar eselect-mode-keywords-multilib
  '(("list_libdirs" "get_libdir")
    font-lock-type-face))

(defvar eselect-mode-keywords-package-manager
  '(("arch" "envvar" "best_version" "has_version" "get_repositories"
     "get_repo_news_dir" "env_update")
    font-lock-type-face))

(defvar eselect-mode-font-lock-keywords
  (mapcar
   (lambda (x)
     (cons (regexp-opt (car x) 'words)
	   (cadr x)))
   (list
    eselect-mode-keywords-warn
    eselect-mode-keywords-core
    eselect-mode-keywords-output
    eselect-mode-keywords-tests
    eselect-mode-keywords-path-manipulation
    eselect-mode-keywords-config
    eselect-mode-keywords-multilib
    eselect-mode-keywords-package-manager)))

;;; Mode definitions.

(defun eselect-mode-update-copyright ()
  "Update the copyright notice in the file's header."
  (save-excursion
    (goto-char (point-min))
    (let ((case-fold-search nil))
      (when (re-search-forward eselect-mode-copyright-regexp 400 t)
	(let* ((y1 (string-to-number (match-string 1)))
	       (y2 (and (match-string 2)
			(string-to-number (match-string 2))))
	       (year (save-match-data (format-time-string "%Y" nil t)))
	       (y (string-to-number year)))
	  (if y2
	      ;; Update range of years
	      (if (or (> 2005 y1) (>= y1 y2) (> y2 y))
		  (lwarn 'eselect :warning
			 "Suspicious range of copyright years: %d-%d" y1 y2)
		(if (/= y2 y)
		    (replace-match year t t nil 2)))
	    ;; Update single year and convert to range if necessary
	    (if (or (> 2005 y1) (> y1 y))
		(lwarn 'eselect :warning "Suspicious copyright year: %d" y1)
	      (if (/= y1 y)
		  (replace-match (concat "\\1-" year) t nil nil 1)))))))))

(defun eselect-mode-before-save ()
  (when eselect-mode-fix-whitespace
    (delete-trailing-whitespace))
  (when eselect-mode-update-copyright
    (eselect-mode-update-copyright)
    ;; call it only once per buffer
    (set (make-local-variable 'eselect-mode-update-copyright) nil))
  ;; return nil, otherwise the file is presumed to be written
  nil)

;;;###autoload
(define-derived-mode eselect-mode shell-script-mode "Eselect"
  "Major mode for .eselect files."
  (add-hook 'write-contents-functions 'eselect-mode-before-save t t)
  (sh-set-shell "bash")
  (setq tab-width 4)
  (setq indent-tabs-mode t))

(add-hook 'eselect-mode-hook
	  (lambda () (font-lock-add-keywords
		      nil eselect-mode-font-lock-keywords)))


;;;###autoload
(add-to-list 'auto-mode-alist '("\\.eselect\\'" . eselect-mode))

(provide 'eselect-mode)

;; Local Variables:
;; coding: utf-8
;; End:

;;; eselect-mode.el ends here
