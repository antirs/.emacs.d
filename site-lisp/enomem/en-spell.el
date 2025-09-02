;;; system/spell
(use-package system/spell :load-path "site-lisp")

;;; ispell
(use-package ispell
  :config
  (setq ispell-really-hunspell t)
  (setq ispell-program-name "hunspell")
  (setq ispell-extra-args '("-d" "en_US,ru_RU"))
  (setq ispell-personal-dictionary "~/.local/share/hunspell/personal")
  (setq ispell-hunspell-dict-paths-alist
        '(("ru_RU" . ("/usr/share/hunspell/ru_RU.aff"))
          ("en_US" . ("/usr/share/hunspell/en_US.aff"))))
  (ispell-hunspell-add-multi-dic "en_US,ru_RU")
  (ispell-set-spellchecker-params))

;;; langtool
(use-package langtool :disabled
  :config
  (setq langtool-default-language "ru")
  (setq langtool-mother-tongue "ru")
  (setq langtool-disabled-rules "MORFOLOGIK_RULE_RU_RU")
  (setq langtool-java-classpath
        "/usr/share/languagetool:/usr/share/java/languagetool/*"))

(provide 'enomem/en-spell)
