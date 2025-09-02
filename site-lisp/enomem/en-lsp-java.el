;;; enomem/en-lsp
(use-package enomem/en-lsp :load-path "site-lisp")

;;; lsp-java
(use-package lsp-java
  :after lsp-mode
  :config
  (setq lsp-java-java-path
        "/home/enomem/.jvm/openjdk-11.0.19-ga/jvm/openjdk-11.0.19/bin/java")
  (setq lsp-java-configuration-runtimes
        '[(:name "JavaSE-11.0.19-ga"
                 :path
                 "/home/enomem/.jvm/openjdk-11.0.19-ga/jvm/openjdk-11.0.19"
                 :default t)])
  (setq lsp-java-vmargs '("-XX:+UseParallelGC"
                          "-XX:GCTimeRatio=4"
                          "-XX:AdaptiveSizePolicyWeight=90"
                          "-Dsun.zip.disableMemoryMapping=true"
                          "-Xmx2G"
                          "-Xms100m"))
  :hook (java-mode . lsp-java/java-mode-setup)
  :preface
  (defun lsp-java/java-mode-setup ()
    (setq lsp-enabled-clients '(jdtls))
    (lsp-deferred)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(java-mode . java))
  (purpose-compile-user-configuration))

(provide 'enomem/en-lsp-java)
