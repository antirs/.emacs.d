;;; ledger-mode
(use-package ledger-mode
  :init
  (setq ledger-reconcile-default-commodity "R")
  :config
  (setq ledger-reports
        `(;; default
          ("account" ,(concat "%(binary) [[ledger-mode-flags]] "
                              "-f %(ledger-file) reg %(account)"))
          ("bal" ,(concat "%(binary) [[ledger-mode-flags]] "
                          "-f %(ledger-file) bal"))
          ("payee" ,(concat "%(binary) [[ledger-mode-flags]] "
                            "-f %(ledger-file) reg @%(payee)"))
          ("reg" ,(concat "%(binary) [[ledger-mode-flags]] "
                          "-f %(ledger-file) reg"))
          ;; real
          ("acouunt-real" ,(concat "%(binary) "
                                   "-f /home/enomem/.org/account/ledger/auto.ledger "
                                   "-f /home/enomem/.org/account/ledger/budget.ledger "
                                   "-f /home/enomem/.org/account/ledger/accounts.ledger "
                                   "-f /home/enomem/.org/account/ledger/commodities.ledger "
                                   "-f /home/enomem/.org/account/ledger/inventory.ledger "
                                   "-f /home/enomem/.org/account/ledger/payees.ledger "
                                   "-f /home/enomem/.org/account/ledger/tags.ledger "
                                   "-f %(ledger-file) reg %(account) "
                                   "--real"))
          ("bal-real" ,(concat "%(binary) "
                               "-f /home/enomem/.org/account/ledger/auto.ledger "
                               "-f /home/enomem/.org/account/ledger/budget.ledger "
                               "-f /home/enomem/.org/account/ledger/accounts.ledger "
                               "-f /home/enomem/.org/account/ledger/commodities.ledger "
                               "-f /home/enomem/.org/account/ledger/inventory.ledger "
                               "-f /home/enomem/.org/account/ledger/payees.ledger "
                               "-f /home/enomem/.org/account/ledger/tags.ledger "
                               "-f %(ledger-file) bal "
                               "--real"))
          ;; cleared
          ("account-cleared" ,(concat "%(binary) "
                                      "-f /home/enomem/.org/account/ledger/auto.ledger "
                                      "-f /home/enomem/.org/account/ledger/budget.ledger "
                                      "-f /home/enomem/.org/account/ledger/accounts.ledger "
                                      "-f /home/enomem/.org/account/ledger/commodities.ledger "
                                      "-f /home/enomem/.org/account/ledger/inventory.ledger "
                                      "-f /home/enomem/.org/account/ledger/payees.ledger "
                                      "-f /home/enomem/.org/account/ledger/tags.ledger "
                                      "-f %(ledger-file) reg %(account) " "--cleared"))
          ("account-uncleared" ,(concat "%(binary) "
                                        "-f /home/enomem/.org/account/ledger/auto.ledger "
                                        "-f /home/enomem/.org/account/ledger/budget.ledger "
                                        "-f /home/enomem/.org/account/ledger/accounts.ledger "
                                        "-f /home/enomem/.org/account/ledger/commodities.ledger "
                                        "-f /home/enomem/.org/account/ledger/inventory.ledger "
                                        "-f /home/enomem/.org/account/ledger/payees.ledger "
                                        "-f /home/enomem/.org/account/ledger/tags.ledger "
                                        "-f %(ledger-file) reg %(account) " "--uncleared"))
          ;; actual
          ("bal-actual" ,(concat "%(binary) "
                                 "-f /home/enomem/.org/account/ledger/auto.ledger "
                                 "-f /home/enomem/.org/account/ledger/budget.ledger "
                                 "-f /home/enomem/.org/account/ledger/accounts.ledger "
                                 "-f /home/enomem/.org/account/ledger/commodities.ledger "
                                 "-f /home/enomem/.org/account/ledger/inventory.ledger "
                                 "-f /home/enomem/.org/account/ledger/payees.ledger "
                                 "-f /home/enomem/.org/account/ledger/tags.ledger "
                                 "-f %(ledger-file) reg " "--actual"))
          ;; budget
          ("account-budget" ,(concat "%(binary) "
                                     "-f /home/enomem/.org/account/ledger/auto.ledger "
                                     "-f /home/enomem/.org/account/ledger/budget.ledger "
                                     "-f /home/enomem/.org/account/ledger/accounts.ledger "
                                     "-f /home/enomem/.org/account/ledger/commodities.ledger "
                                     "-f /home/enomem/.org/account/ledger/inventory.ledger "
                                     "-f /home/enomem/.org/account/ledger/payees.ledger "
                                     "-f /home/enomem/.org/account/ledger/tags.ledger "
                                     "-f %(ledger-file) reg %(account) "
                                     "--budget"))
          ;; collapse
          ("bal-collapse" ,(concat "%(binary) "
                                   "-f /home/enomem/.org/account/ledger/auto.ledger "
                                   "-f /home/enomem/.org/account/ledger/budget.ledger "
                                   "-f /home/enomem/.org/account/ledger/accounts.ledger "
                                   "-f /home/enomem/.org/account/ledger/commodities.ledger "
                                   "-f /home/enomem/.org/account/ledger/inventory.ledger "
                                   "-f /home/enomem/.org/account/ledger/payees.ledger "
                                   "-f /home/enomem/.org/account/ledger/tags.ledger "
                                   "-f %(ledger-file) reg " "--collapse"))
          ;; effective
          ("bal-effective" ,(concat "%(binary) [[ledger-mode-flags]] -f %(ledger-file) reg " "--effective"))
          ;; pedantic
          ("print-pedantic" ,(concat "%(binary) [[ledger-mode-flags]] " "-f /home/enomem/.org/account/ledger/accounts.ledger -f /home/enomem/.org/account/ledger/commodities.ledger -f /home/enomem/.org/account/ledger/payees.ledger -f /home/enomem/.org/account/ledger/tags.ledger " "-f %(ledger-file) print " "--pedantic --check-payees"))
          ;; related
          ("bal-related" ,(concat "%(binary) [[ledger-mode-flags]] -f %(ledger-file) reg " "--related"))
          ;; collapse
          ("bal-subtotal" ,(concat "%(binary) [[ledger-mode-flags]] -f %(ledger-file) reg " "--subtotal"))
          ;; filter
          ("account-filter" ,(concat "%(binary) [[ledger-mode-flags]] -f %(ledger-file) reg %(account) "
                                     "and not '('^Equity or ^Inventory or ^Reimbursements:Expenses or ^Budget')'"))
          ("bal-filter" ,(concat "%(binary) [[ledger-mode-flags]] -f %(ledger-file) bal "
                                 "not '('^Equity or ^Inventory or ^Reimbursements:Expenses or ^Budget')'"))
          ("payee-filter" ,(concat "%(binary) [[ledger-mode-flags]] -f %(ledger-file) reg @%(payee) "
                                   "and not '('^Equity or ^Inventory or ^Reimbursements:Expenses or ^Budget')'"))
          ("reg-filter" ,(concat "%(binary) [[ledger-mode-flags]] -f %(ledger-file) reg "
                                 "not '('^Equity or ^Inventory or ^Reimbursements:Expenses or ^Budget')'"))))
  :bind (:map ledger-mode-map
              ("M-t l a" . ledger-add-transaction)
              ("M-t l b" . 'ledger-post-edit-amount)
              ("M-t l c" . 'ledger-toggle-current)
              ("M-t l d" . 'ledger-delete-current-transaction)
              ("M-t l e" . 'ledger-toggle-current-transaction)
              ("M-t l f" . 'ledger-occur)
              ("M-t l k" . 'ledger-copy-transaction-at-point)
              ("M-t l l" . 'ledger-display-ledger-stats)
              ("M-t l p" . 'ledger-display-balance-at-point)
              ("M-t l q" . 'ledger-post-align-xact)
              ("M-t l r" . 'ledger-reconcile)
              ("M-t l s" . 'ledger-sort-region)
              ("M-t l t" . 'ledger-insert-effective-date)
              ("M-t l u" . 'ledger-schedule-upcoming)
              ("M-t l R" . 'ledger-report)
              ("M-t l S" . 'ledger-report-save)
              ("M-t l Q" . 'ledger-report-quit))
  :bind (:map ledger-reconcile-mode-map
              ("g" . ledger-reconcile-refresh))
  :bind (:map ledger-report-mode-map
              ("t" . 'ledger-report-toggle-default-commodity)
              ("r" . 'ledger-report-redo)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(ledger-mode . ledger))
  (add-to-list 'purpose-user-mode-purposes '(ledger-reconcile-mode . ledger-reconcile))
  (add-to-list 'purpose-user-mode-purposes '(ledger-report-mode . ledger-report))
  (purpose-compile-user-configuration))

(provide 'enomem/en-ledger)
