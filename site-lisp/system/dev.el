;;; devdocs-lookup
(use-package devdocs-lookup :load-path "site-lisp/system/dev/devdocs-lookup"
  :config
  (setq devdocs-base-url "http://localhost:9090/")
  (setq devdocs-base-index-url "http://localhost:9090/docs/")
  :preface
  (defun devdocs-lookup/devdocs-run ()
    (interactive)
    (let ((default-directory "~/docs/devdocs-docs"))
      (async-start-process "DEVDOCS" "rvm" nil "use" "3.1.2@devdocs" "do" "rackup" "--host" "127.0.0.1" "--port" "9090"))))

(provide 'system/dev)
