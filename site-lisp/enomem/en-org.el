;;; enomem/en-org
(use-package enomem/en-org :load-path "site-lisp" :defer t
  :bind (:map org-mode-map
              ("M-o M-r F" . 'enomem/en-org/org-roam-ref-copy-and-find))
  :preface
  (defun enomem/en-org/org-roam-ref-copy-and-find ()
    (interactive)
    (org-roam-ref-find (car (org-ref-get-bibtex-key-and-file)))))

;;; system/org
(use-package system/org :load-path "site-lisp"
  :config
  (setq org-fc-directories '("~/.org/drill"))
  :bind (:map enomem-mode-map
              ("M-o M-D U" . 'org-fc-update-all)
              ("M-o M-D d" . 'org-fc-dashboard)
              ("M-o M-D h" . 'org-fc-hydra/body)
              ("M-o M-D t" . 'org-fc-hydra-type/body)
              ("M-o M-D u" . 'org-fc-update))
  :bind (:map org-fc-review-rate-mode-map
              ("a" . 'org-fc-review-rate-again)
              ("e" . 'org-fc-review-rate-easy)
              ("g" . 'org-fc-review-rate-good)
              ("h" . 'org-fc-review-rate-hard)
              ("p" . 'org-fc-review-edit)
              ("q" . 'org-fc-review-quit)
              ("s" . 'org-fc-review-suspend-card)))

;;; org
(use-package org
  :config
  (delete '("\\.pdf\\'" . default) org-file-apps)
  (add-to-list 'org-file-apps '("\\.pdf\\'" . "zathura %s"))
  (setq org-modules '(ol-bbdb
                      ol-bibtex
                      ol-docview
                      ol-gnus
                      ol-info
                      ol-mhe
                      ol-w3m
                      org-collector
                      org-crypt
                      org-expiry
                      org-habit
                      org-id
                      org-inlinetask
                      org-interactive-query
                      org-mobile
                      org-protocol
                      org-screen
                      org-toc))
  (setq org-hide-leading-stars t)
  (setq org-cycle-separator-lines 0)
  (setq org-cycle-emulate-tab t)
  (setq org-cycle-open-archived-trees t)
  (setq org-sparse-tree-open-archived-trees t)
  (setq org-special-ctrl-a/e t)
  (setq org-special-ctrl-k t)
  (setq org-table-automatic-realign nil)
  (setq org-yank-adjusted-subtrees t)
  (setq org-clone-delete-id t)
  (setq org-catch-invisible-edits 'error)
  (setq org-directory "~/.org")
  (setq org-default-notes-file "~/.org/notes/notes.org")
  (setq org-log-done 'time)
  (setq org-log-repeat 'time)
  (setq org-log-into-drawer t)
  (setq org-log-state-notes-insert-after-drawers nil)
  (setq org-log-reschedule t)
  (setq org-deadline-past-days 10000)
  (setq org-deadline-warning-days 7)
  (setq org-scheduled-delay-days 0)
  (setq org-scheduled-past-days 10000)
  (setq org-columns-default-format
        "%8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM")
  (setq org-agenda-prefix-format
        '((agenda . " %i %-15 c%?-12t% s")
          (todo . " %i %-15 c")
          (tags . " %i %-15 c")
          (search . " %i %-15 c")))
  (setq org-startup-truncated t)
  (setq org-global-properties
        '(("Effort_ALL". "00:00 00:05 00:15 00:30 01:00 02:00 03:00 04:00 06:00 08:00 10:00 12:00 16:00 20:00 24:00")
          ("activity_ALL". "activity break idle browsing chatting chilling coding composing cooking learning listening meeting painting planning reading shopping sleeping talking training traveling walking watching writing")))
  (setq org-sort-agenda-noeffort-is-high nil)
  (setq org-enforce-todo-dependencies t)
  (setq org-todo-keywords
        '((sequence
           "TODO(t)"                    ; todo task
           "NEXT(n!)"                   ; next task
           "STARTED(s!)"                ; started task
           "PROGRESS(p@/!)"             ; progress task
           "FROZEN(f!)"                 ; stuck task
           "WAITING(w@/!)"              ; pending task
           "SOMEDAY(#@/!)"              ; delayes task
           "DEPENDENCY(~)"              ; external task
           "|" "DONE(d!)" "CANCELLED(c@)")
          (sequence "GOAL(g)" "|" "PASS(P!)" "FAIL(F!)")))
  (setq org-todo-keyword-faces
        '(("TODO" . (:foreground "green" :weight bold))
          ("NEXT" . (:background "black" :foreground "DeepSkyBlue1" :weight bold))
          ("STARTED" . (:foreground "green" :weight bold))
          ("PROGRESS" . (:foreground "green" :weight bold))
          ("FROZEN" . (:foreground "gray" :weight bold))
          ("WAITING" . (:foreground "red" :weight bold))
          ("SOMEDAY" . (:foreground "gray" :weight bold))
          ("DEPENDENCY" . (:foreground "brightwhite" :weight bold))
          ("DONE" . (:foreground "cyan" :weight bold))
          ("CANCELLED" . (:foreground "red" :weight bold))
          ("GOAL" . (:foreground "purple" :weight bold))
          ("PASS" . (:foreground "cyan" :weight bold))
          ("FAIL" . (:foreground "red" :weight bold))))
  (setq org-todo-state-tags-triggers
        '(("" ("ACTIVE"))
          ("TODO" ("ACTIVE"))
          ("NEXT" ("ACTIVE"))
          ("STARTED" ("ACTIVE" . t))
          ("PROGRESS" ("ACTIVE" . t))
          ("FROZEN" ("ACTIVE"))
          ("WAITING" ("ACTIVE"))
          ("SOMEDAY" ("ACTIVE"))
          ("DEPENDENCY" ("ACTIVE"))
          ("GOAL" ("GOAL" . t))
          (done ("ACTIVE"))))
  (setq org-tag-faces
        '(("ACTIVE" . (:foreground "green" :weight bold))
          ;; Activities
          ("activity" . (:foreground "pink" :weight bold))
          ("browsing" . (:foreground "pink" :weight bold))
          ("chatting" . (:foreground "pink" :weight bold))
          ("chilling" . (:foreground "pink" :weight bold))
          ("coding" . (:foreground "pink" :weight bold))
          ("composing" . (:foreground "pink" :weight bold))
          ("cooking" . (:foreground "pink" :weight bold))
          ("learning" . (:foreground "pink" :weight bold))
          ("listening" . (:foreground "pink" :weight bold))
          ("meeting" . (:foreground "pink" :weight bold))
          ("painting" . (:foreground "pink" :weight bold))
          ("planning" . (:foreground "light sky blue" :weight bold))
          ("reading" . (:foreground "pink" :weight bold))
          ("shopping" . (:foreground "pink" :weight bold))
          ("sleeping" . (:foreground "pink" :weight bold))
          ("talking" . (:foreground "pink" :weight bold))
          ("training" . (:foreground "pink" :weight bold))
          ("traveling" . (:foreground "pink" :weight bold))
          ("walking" . (:foreground "pink" :weight bold))
          ("watching" . (:foreground "pink" :weight bold))
          ("writing" . (:foreground "pink" :weight bold))
          ;; Basic context
          ("@business" . (:foreground "green" :weight bold))
          ("@city" . (:foreground "green" :weight bold))
          ("@country" . (:foreground "green" :weight bold))
          ("@community" . (:foreground "green" :weight bold))
          ("@earth" . (:foreground "green" :weight bold))
          ("@home" . (:foreground "green" :weight bold))
          ("@internet" . (:foreground "green" :weight bold))
          ("@self" . (:foreground "green" :weight bold))
          ("@socium" . (:foreground "green" :weight bold))
          ("@system" . (:foreground "green" :weight bold))
          ("@travel" . (:foreground "green" :weight bold))
          ("@universe" . (:foreground "green" :weight bold))
          ("@work" . (:foreground "green" :weight bold))
          ;; Goto (context group)
          ("@@cinema" . (:foreground "purple" :weight bold))
          ("@@concert" . (:foreground "purple" :weight bold))
          ("@@meetup" . (:foreground "purple" :weight bold))
          ("@@theatre" . (:foreground "purple" :weight bold))
          ;; Project (context group)
          ("@@@code" . (:foreground "white" :weight bold))
          ("@@@docs" . (:foreground "white" :weight bold))
          ("@@@infra" . (:foreground "white" :weight bold))
          ("@@@plan" . (:foreground "white" :weight bold))
          ("@@@qa" . (:foreground "white" :weight bold))
          ;; Mobile (context)
          ("@@@@mobile" . (:foreground "green" :weight bold))
          ;; Resource
          ("article" . (:foreground "blue" :weight bold))
          ("book" . (:foreground "blue" :weight bold))
          ("draft" . (:foreground "blue" :weight bold))
          ("drill" . (:foreground "blue" :weight bold))
          ("fc" . (:foreground "blue" :weight bold))
          ("reference" . (:foreground "blue" :weight bold))
          ("web" . (:foreground "blue" :weight bold))
          ;; Subjects and objects
          ("#analytics" . (:foreground "cyan" :weight bold))
          ("#archive" . (:foreground "cyan" :weight bold))
          ("#backlog" . (:foreground "cyan" :weight bold))
          ("#code" . (:foreground "cyan" :weight bold))
          ("#diary" . (:foreground "cyan" :weight bold))
          ("#device" . (:foreground "cyan" :weight bold))
          ("#dictionary" . (:foreground "cyan" :weight bold))
          ("#emacs" . (:foreground "cyan" :weight bold))
          ("#food" . (:foreground "cyan" :weight bold))
          ("#habit" . (:foreground "cyan" :weight bold))
          ("#health" . (:foreground "cyan" :weight bold))
          ("#journal" . (:foreground "cyan" :weight bold))
          ("#link" . (:foreground "cyan" :weight bold))
          ("#list" . (:foreground "cyan" :weight bold))
          ("#linux" . (:foreground "cyan" :weight bold))
          ("#money" . (:foreground "cyan" :weight bold))
          ("#note" . (:foreground "cyan" :weight bold))
          ("#people" . (:foreground "cyan" :weight bold))
          ("#plan" . (:foreground "cyan" :weight bold))
          ("#project" . (:foreground "cyan" :weight bold))
          ("#quiz" . (:foreground "cyan" :weight bold))
          ("#report" . (:foreground "cyan" :weight bold))
          ("#review" . (:foreground "cyan" :weight bold))
          ("#sketch" . (:foreground "cyan" :weight bold))
          ("#stuck" . (:foreground "cyan" :weight bold))
          ("#task" . (:foreground "cyan" :weight bold))
          ("#thing" . (:foreground "cyan" :weight bold))
          ("#wishlist" . (:foreground "cyan" :weight bold))
          ("#workspace" . (:foreground "cyan" :weight bold))
          ;; Targets and indicators
          ("GOAL" . (:foreground "purple" :weight bold))))
  (setq org-fast-tag-selection t)
  (setq org-tag-alist '(;; TODOs
                        (:startgroup)
                        ("ACTIVE" . ?0)
                        (:endgroup)
                        ("GOAL" . ?4)
                        ;; Activities
                        ("activity" . ?a)
                        (:startgroup)
                        ("browsing" . ?b)
                        ("chatting" . ?c)
                        ("chilling" . ?d)
                        ("coding" . ?e)
                        ("composing" . ?f)
                        ("cooking" . ?g)
                        ("learning" . ?h)
                        ("listening" . ?i)
                        ("meeting" . ?j)
                        ("painting" . ?k)
                        ("planning" . ?l)
                        ("reading" . ?m)
                        ("shopping" . ?n)
                        ("sleeping" . ?o)
                        ("talking" . ?p)
                        ("training" . ?q)
                        ("traveling" . ?r)
                        ("walking" . ?s)
                        ("watching" . ?t)
                        ("writing" . ?u)
                        (:endgroup)
                        ;; Basic context
                        (:startgroup)
                        ("@business" . ?!)
                        ("@city" . ?@)
                        ("@community" . ?#)
                        ("@country" . ?%)
                        ("@earth" . ?^)
                        ("@home" . ?~)
                        ("@internet" . ?&)
                        ("@self" . ?.)
                        ("@socium" . ?,)
                        ("@system" . ?/)
                        ("@travel" . ?')
                        ("@universe" . ?*)
                        ("@work" . ?$)
                        (:endgroup)
                        ;; Goto (context group)
                        (:startgroup)
                        ("@@cinema" . ?)
                        ("@@concert" . ?)
                        ("@@meetup" . ?)
                        ("@@theatre" . ?)
                        (:endgroup)
                        ;; Project (context group)
                        (:startgroup)
                        ("@@@code" . ?)
                        ("@@@docs" . ?)
                        ("@@@infra" . ?)
                        ("@@@plan" . ?)
                        ("@@@qa" . ?)
                        (:endgroup)
                        ;; Mobile (context group)
                        (:startgroup)
                        ("@@@@mobile" . ?)
                        (:endgroup)
                        ;; Resource
                        ("reference" . ?)
                        (:startgroup)
                        ("article" . ?)
                        ("book" . ?)
                        ("standard" . ?)
                        ("web" . ?)
                        (:endgroup)
                        ("drill" . ?)
                        ("draft" . ?)
                        ("fc" . ?)
                        ;; Subjects and objects
                        ("#analytics" . ?A)
                        ("#archive" . ?B)
                        ("#backlog" . ?C)
                        ("#code" . ?D)
                        ("#diary" . ?E)
                        ("#device" . ?F)
                        ("#dictionary" . ?G)
                        ("#emacs" . ?H)
                        ("#food" . ?I)
                        ("#habit" . ?J)
                        ("#health" . ?K)
                        ("#init" . ?L)
                        ("#journal" . ?M)
                        ("#link" . ?N)
                        ("#list" . ?O)
                        ("#linux" . ?P)
                        ("#money" . ?Q)
                        ("#note" . ?R)
                        ("#people" . ?S)
                        ("#plan" . ?T)
                        ("#project" . ?U)
                        ("#quiz" . ?V)
                        ("#report" . ?W)
                        ("#review" . ?X)
                        ("#sketch" . ?Y)
                        ("#stuck" . ?Z)
                        ("#task" . ?)
                        ("#thing" . ?)
                        ("#wishlist" . ?)
                        ("#workspace" . ?)))
  (setq org-stuck-projects
        '("+#project-#journal-#list-#habit-#stuck-#note-@mobile-ACTIVE-activity|+#task-#journal-#list-#habit-#stuck-#note-@mobile-ACTIVE-activity|+learning-#journal-#list-#habit-#stuck-#note-@mobile-ACTIVE-activity|+reading-#journal-#list-#habit-#stuck-#note-@mobile-ACTIVE-activity/-TODO-DEPENDENCY-SOMEDAY-FROZEN-WAITING-DONE-CANCELLED" ("NEXT" "STARTED" "PROGRESS") ("*") "\\<IGNORE\\>"))
  (setq org-src-fontify-natively t)
  (setq org-src-tab-acts-natively t)
  (setq org-src-preserve-indentation t)
  (setq org-edit-src-content-indentation 0)
  (setq org-reverse-note-order t)
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))
  (setq org-habit-graph-column 50)
  (setq org-habit-show-habits-only-for-today nil)
  (setq org-habit-show-habits nil)
  (setq org-agenda-persistent-filter t)
  (setq org-use-speed-commands t)
  (setq org-speed-commands (append '(("J" org-metadown)
                                     ("K" org-metaup)
                                     ("L" org-metaright)
                                     ("H" org-metaleft)
                                     ("N" org-narrow-to-subtree)
                                     ("W" widen))
                                   org-speed-commands))
  (org-clock-persistence-insinuate)
  :bind (:map org-mode-map
              ("C-j" . org-return)
              ("C-m" . org-return)
              ;; org heading keys
              ("M-o b" . 'org-backward-heading-same-level)
              ("M-o f" . 'org-forward-heading-same-level)
              ("M-n" . org-next-visible-heading)
              ("M-p" . org-previous-visible-heading)
              ;; org item keys
              ("M-O M-N" . org-next-item)
              ("M-O M-P" . org-previous-item)
              ;; org link keys
              ("M-o M-l M-n" . org-next-link)
              ("M-o M-l M-p" . org-previous-link)
              ;; org edit keys
              ("M-o C-w" . org-cut-special)
              ("M-o M-#" . org-mark-element)
              ("M-o M-@" . org-mark-subtree)
              ("M-o M-w" . org-copy-special)
              ("M-o M-y" . org-paste-special)
              ("M-o M-C t" . org-clone-subtree-with-time-shift)
              ;; org sort keys
              ("M-o M-s e" . 'org-sort-list)
              ("M-o M-s l" . 'org-sort-list)
              ("M-o M-s s" . org-sort)
              ;; org insert keys
              ("M-o M-i d" . org-insert-drawer)
              ("M-o M-i h" . org-insert-heading)
              ("M-o M-i i" . org-insert-item)
              ("M-o M-i l" . org-insert-link)
              ("M-o M-i s" . org-insert-subheading)
              ("M-o M-i t" . org-insert-structure-template)
              ;; org tab keys
              ("M-o M-1" . org-ctrl-c-tab-1)
              ("M-o M-2" . org-ctrl-c-tab-2)
              ("M-o M-3" . org-ctrl-c-tab-3)
              ("M-o M-4" . org-ctrl-c-tab-4)
              ("M-o M-5" . org-ctrl-c-tab-5)
              ;; org blocks
              ("M-o h" . org-hide-block-all)
              ("M-o M-N" . org-next-block)
              ("M-o M-P" . org-previous-block)
              ;; org image keys
              ("M-o o" . org-open-at-point)
              ("M-o s" . org-save-all-org-buffers)
              ;; org image keys
              ("M-o M-o M-i" . org-redisplay-inline-images)
              ;; org babel keys
              ("M-o M-n" . org-babel-next-src-block)
              ("M-o M-p" . org-babel-previous-src-block)
              ;; org timestamp keys
              ("M-o M-o M-J" . org-timestamp-down)
              ("M-o M-o M-K" . org-timestamp-up)
              ;; org table keys
              ("M-o t e" . org-table-expand)
              ("M-o t s" . org-table-shrink)
              ;; org buffer keys
              ("M-o M-b" . nil)
              ("M-o M-b b" . 'org-switchb)
              ("M-o M-b i d" . 'org-indirect-buffer-display)
              ("M-o M-b i l" . 'org-last-indirect-buffer)
              ("M-o M-b i t" . 'org-tree-to-indirect-buffer)
              ;; org tree keys
              ("M-o M-S" . 'org-sparse-tree)
              ("M-o M-Q" . 'org-remove-occur-highlights)
              ;; org property keys
              ("M-o M-e" . org-set-effort)
              ("M-o M-i a" . org-property-action)
              ("M-o M-i p" . org-set-property)
              ;; org agenda keys
              ("M-o a c" . 'org-cycle-agenda-files)
              ;; org column keys
              ("M-o C-c C-c" . org-columns)
              ("M-o C-c i" . org-columns-insert-dblock)
              ("M-o C-c u" . 'org-update-all-dblocks)
              ;; org toggle/display keys
              ("M-o d i" . org-display-inline-images)
              ("M-o t h" . org-toggle-heading)
              ("M-o t i" . org-toggle-inline-images)
              ("M-o t t" . org-toggle-timestamp-type)
              ;; org priority keys
              ("M-o p d" . org-priority-down)
              ("M-o p p" . org-priority)
              ("M-o p u" . org-priority-up)
              ;; org highlight
              ("M-o M-h" . nil)
              ("M-o M-h h" . 'org-mode-highlight-region)
              ("M-o M-h u" . 'org-mode-unhighlight-region))
  :hook (org-mode . eldoc-mode)
  :hook (org-mode . org-mode-setup)
  :hook (after-save . org-mode-highlight)
  :preface
  (defun org-mode-setup ()
    (org-mode-highlight)
    (setq tab-width 8)
    (setq org-id-files (org-mode-id-files)))
  (defun org-mode-id-files ()
    (let (org-id-files)
      (org-id-locations-load)
      (maphash (lambda (id loc) (push loc org-id-files)) org-id-locations)
      (mapcar #'expand-file-name (delete-dups org-id-files))))
  (defun org-mode-highlight ()
    (cond ((eq 'org-mode major-mode)
           (hlt-unhighlight-all-prop 'hlt-region-or-buffer-limits)
           (hlt-unhighlight-region)
           (let ((isearch-regexp "\\(\u3000\\([^\u3000\n]\\|\n\\)*?\u3000\\)"))
             (hlt-highlight-isearch-matches 'en-hi-red nil nil nil "\\(\u3000\\([^\u3000\n]\\|\n\\)*?\u3000\\)"))
           (let ((isearch-regexp "\\(\u2000\\([^\u2000\n]\\|\n\\)*?\u2000\\)"))
             (hlt-highlight-isearch-matches 'en-hi-aquamarine nil nil nil "\\(\u2000\\([^\u2000\n]\\|\n\\)*?\u2000\\)"))
           (let ((isearch-regexp "\\(\u2001\\([^\u2001\n]\\|\n\\)*?\u2001\\)"))
             (hlt-highlight-isearch-matches 'en-hi-pink-b nil nil nil "\\(\u2001\\([^\u2001\n]\\|\n\\)*?\u2001\\)"))
           (let ((isearch-regexp "\\(\u2002\\([^\u2002\n]\\|\n\\)*?\u2002\\)"))
             (hlt-highlight-isearch-matches 'en-hi-pink nil nil nil "\\(\u2002\\([^\u2002\n]\\|\n\\)*?\u2002\\)"))
           (let ((isearch-regexp "\\(\u2003\\([^\u2003\n]\\|\n\\)*?\u2003\\)"))
             (hlt-highlight-isearch-matches 'en-hi-blue nil nil nil "\\(\u2003\\([^\u2003\n]\\|\n\\)*?\u2003\\)"))
           (let ((isearch-regexp "\\(\u2004\\([^\u2004\n]\\|\n\\)*?\u2004\\)"))
             (hlt-highlight-isearch-matches 'en-hi-salmon nil nil nil "\\(\u2004\\([^\u2004\n]\\|\n\\)*?\u2004\\)"))
           (let ((isearch-regexp "\\(\u2005\\([^\u2005\n]\\|\n\\)*?\u2005\\)"))
             (hlt-highlight-isearch-matches 'en-hi-green nil nil nil "\\(\u2005\\([^\u2005\n]\\|\n\\)*?\u2005\\)"))
           (let ((isearch-regexp "\\(\u2006\\([^\u2006\n]\\|\n\\)*?\u2006\\)"))
             (hlt-highlight-isearch-matches 'en-hi-gray nil nil nil "\\(\u2006\\([^\u2006\n]\\|\n\\)*?\u2006\\)"))
           (let ((isearch-regexp "\\(\u2007\\([^\u2007\n]\\|\n\\)*?\u2007\\)"))
             (hlt-highlight-isearch-matches 'en-hi-white nil nil nil "\\(\u2007\\([^\u2007\n]\\|\n\\)*?\u2007\\)")))))
  (setq marker-alist '((?1 "red (main)" "\u3000")         ; main
                       (?2 "aquamarine (ideas)" "\u2000") ; ideas
                       (?3 "pink-b (terms)" "\u2001")   ; terms, kernel, anchors
                       (?4 "pink (keywords)" "\u2002")  ; tags, keywords
                       (?5 "blue (abbrv)" "\u2003")     ; abbreviations, index
                       (?6 "salmon (lists)" "\u2004")   ; lists, enums
                       (?7 "green (sections)" "\u2005") ; sections, groups
                       (?8 "gray (lines)" "\u2006")     ; paragraph, lines
                       (?9 "white (context)" "\u2007"))) ; commentary, note, context
  (defun org-mode-unhighlight-region ()
    (interactive)
    (hlt-unhighlight-region)
    (let ((rstart (region-beginning))
          (rend (region-end))
          (marker-1 (nth 2 (assoc ?1 marker-alist)))
          (marker-2 (nth 2 (assoc ?2 marker-alist)))
          (marker-3 (nth 2 (assoc ?3 marker-alist)))
          (marker-4 (nth 2 (assoc ?4 marker-alist)))
          (marker-5 (nth 2 (assoc ?5 marker-alist)))
          (marker-6 (nth 2 (assoc ?6 marker-alist)))
          (marker-7 (nth 2 (assoc ?7 marker-alist)))
          (marker-8 (nth 2 (assoc ?7 marker-alist)))
          (marker-9 (nth 2 (assoc ?7 marker-alist))))
      (save-excursion
        (mapcar (lambda (item)
                  (let ((marker (nth 2 item)))
                    (goto-char rstart)
                    (while (re-search-forward marker rend t)
                      (goto-char (match-beginning 0))
                      (delete-char 1))))
                marker-alist))))
  (defun org-mode-highlight-region ()
    (interactive)
    (hlt-unhighlight-region)
    (let* ((choice (read-char-choice
                    (mapconcat
                     (lambda (item) (format "%c: %s" (car item) (cadr item))) marker-alist "\n")
                    (mapcar #'car marker-alist)))
           (marker (nth 2 (assoc choice marker-alist)))
           (rstart (region-beginning))
           (rend (region-end)))
      (save-excursion
        (let ((regexp marker))
          (goto-char rstart)
          (while (re-search-forward regexp rend t)
            (goto-char (match-beginning 0))
            (delete-char 1))))
      (save-excursion
        (insert marker)
        (goto-char (region-beginning))
        (insert marker))))
  :preface
  (defun org-ctrl-c-tab-1 ()
    (interactive)
    (org-ctrl-c-tab 1))
  (defun org-ctrl-c-tab-2 ()
    (interactive)
    (org-ctrl-c-tab 2))
  (defun org-ctrl-c-tab-3 ()
    (interactive)
    (org-ctrl-c-tab 3))
  (defun org-ctrl-c-tab-4 ()
    (interactive)
    (org-ctrl-c-tab 4))
  (defun org-ctrl-c-tab-5 ()
    (interactive)
    (org-ctrl-c-tab 5))
  (defun last-sunday-p (date)
    (let* ((month (first date))
           (day (nth 1 date))
           (year (first (last date)))
           (week-day (calendar-day-of-week date))
           (last-day (calendar-last-day-of-month month year)))
      (and (eq week-day 0) (> (+ day 7) last-day)))))

;;; org-persist
(use-package org-persist
  :config
  (setq org-persist-default-expiry 30))

;;; org-modern
(use-package org-modern :disabled
  :config
  (setq org-modern-todo t)
  (setq org-modern-todo-faces
        '(("TODO" . (:foreground "green" :weight bold))
          ("NEXT" . (:background "black" :foreground "DeepSkyBlue1" :weight bold))
          ("STARTED" . (:foreground "green" :weight bold))
          ("PROGRESS" . (:foreground "green" :weight bold))
          ("FROZEN" . (:foreground "gray" :weight bold))
          ("WAITING" . (:foreground "red" :weight bold))
          ("SOMEDAY" . (:foreground "gray" :weight bold))
          ("DEPENDENCY" . (:foreground "brightwhite" :weight bold))
          ("DONE" . (:foreground "cyan" :weight bold))
          ("CANCELLED" . (:foreground "red" :weight bold))
          ("GOAL" . (:foreground "purple" :weight bold))
          ("PASS" . (:foreground "cyan" :weight bold))
          ("FAIL" . (:foreground "red" :weight bold))))
  :hook (org-mode . org-modern-mode))

;;; org-archive
(use-package org-archive
  :bind (:map org-mode-map
              ("M-o M-A t" . 'org-archive-set-tag)
              ("M-o M-A s" . 'org-archive-subtree)
              ("M-o M-A g" . 'org-toggle-archive-tag)
              ("M-o M-A a" . 'org-archive-to-archive-sibling)))

;;; org-expire
(use-package org-expiry
  :bind (:map org-mode-map
              ("M-o M-E c" . 'org-expiry-insert-created)
              ("M-o M-E e" . 'org-expiry-insert-expiry)
              ("M-o M-E p" . 'org-expiry-process-entries)))

;;; org-capture
(use-package org-capture
  :config
  (setq org-capture-use-agenda-date t)
  (setq org-basic-task-template "* TODO %^{Task}
%t
%i")
  (setq org-capture-templates
        `(("t" "TASKS")
          ("tt" "TASK" entry
           (file+headline "~/.org/todo/todo.org" "Tasks (unsorted)")
           ,org-basic-task-template
           :prepend t :empty-lines 1)
          ("tb" "TASK BACKLOG" entry
           (file+headline "~/.org/todo/todo.org" "Tasks (backlog)")
           ,org-basic-task-template
           :prepend t :empty-lines 1)
          ("tq" "QUICK TASK" entry
           (file+headline "~/.org/todo/todo.org" "Tasks (quick)")
           "* TODO %^{Task}\nSCHEDULED: %t\n%t"
           :prepend t :empty-lines 1)
          ("ti" "INTERRUPTING TASK" entry
           (file+headline "~/.org/todo/todo.org" "Tasks (interrupt)")
           "* STARTED %^{Task}\nSCHEDULED: %t\n%t"
           :clock-in :clock-keep :prepend t :empty-lines 1)
          ("tg" "GOAL" entry
           (file+headline "~/.org/todo/todo.org" "Tasks (goals)")
           "* GOAL %? [/]\n"
           :prepend t :empty-lines 1)
          ("td" "DONE" entry
           (file+headline "~/.org/todo/todo.org" "Tasks (archive)")
           "* DONE %^{Task}\nSCHEDULED: %^t\n%?")
          ("p" "PROJECTS")
          ("pp" "PROJECT" entry
           (file+headline "~/.org/projects/projects.org" "Project (tasks)")
           "* %^{Project}\n")
          ("pt" "PROJECT TASK" entry
           (file+headline "~/.org/todo/todo.org" "Tasks (unsorted)")
           "* %^{Project}\n")
          ("a" "ACTIVITY TRACKING")
          ("a0" "BREAK" plain
           (file+headline "~/.org/activity/activity.org" "Break")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("a1" "IDLE" plain
           (file+headline "~/.org/activity/activity.org" "Idle")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("aa" "ACTIVITY" plain
           (file+headline "~/.org/activity/activity.org" "Activity")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ab" "BROWSING" plain
           (file+headline "~/.org/activity/activity.org" "Browsing")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ac" "CHATTING" plain
           (file+headline "~/.org/activity/activity.org" "Chatting")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ad" "CHILLING" plain
           (file+headline "~/.org/activity/activity.org" "Chilling")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ae" "CODING" plain
           (file+headline "~/.org/activity/activity.org" "Coding")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)

          ("af" "COMPOSING" plain
           (file+headline "~/.org/activity/activity.org" "Composing")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ag" "COOKING" plain
           (file+headline "~/.org/activity/activity.org" "Cooking")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ah" "LEARNING" plain
           (file+headline "~/.org/activity/activity.org" "Learning")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ai" "LISTENING" plain
           (file+headline "~/.org/activity/activity.org" "Listening")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ag" "MEETING" plain
           (file+headline "~/.org/activity/activity.org" "Meeting")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ak" "PAINTING" plain
           (file+headline "~/.org/activity/activity.org" "Painting")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("al" "PLANNING" plain
           (file+headline "~/.org/activity/activity.org" "Planning")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("am" "READING" plain
           (file+headline "~/.org/activity/activity.org" "Reading")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("an" "SHOPPING" plain
           (file+headline "~/.org/activity/activity.org" "Shopping")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ao" "SLEEPING" plain
           (file+headline "~/.org/activity/activity.org" "Sleeping")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ap" "TALKING" plain
           (file+headline "~/.org/activity/activity.org" "Talking")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("aq" "TRAINING" plain
           (file+headline "~/.org/activity/activity.org" "Training")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("ar" "TRAVELING" plain
           (file+headline "~/.org/activity/activity.org" "Traveling")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("as" "WALKING" plain
           (file+headline "~/.org/activity/activity.org" "Walking")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("at" "WATCHING" plain
           (file+headline "~/.org/activity/activity.org" "Watching")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("au" "WRITING" plain
           (file+headline "~/.org/activity/activity.org" "Writing")
           "%?"
           :clock-in :clock-keep :prepend t :jump-to-captured t)
          ("c" "CONNECTIONS")
          ("cc" "CHAT" entry
           (file+headline "~/.org/todo/socium/socium.org" "Socium (tasks)")
           "* TODO CHAT with %^{Name} on %^{Subject}\nSCHEDULED: %t\n%a"
           :immediate-finish t :jump-to-captured t)
          ("ct" "TALK" entry
           (file+headline "~/.org/todo/socium/socium.org" "Socium (tasks)")
           "* TODO TALK with %^{Name} on %^{Subject}\nSCHEDULED: %t\n%a"
           :immediate-finish t :jump-to-captured t)
          ("cm" "MAIL" entry
           (file+headline "~/.org/todo/socium/socium.org" "Socium (tasks)")
           "* TODO MAIL to %:from on %:subject\nSCHEDULED: %t\n%a"
           :immediate-finish t :jump-to-captured t)
          ("cp" "POST" entry
           (file+headline "~/.org/todo/socium/socium.org" "Socium (tasks)")
           "* TODO POST to %a\nSCHEDULED: %t"
           :immediate-finish t :jump-to-captured t)
          ("n" "NOTES")
          ("nb" "BRAINSTORM" entry
           (file+datetree "~/.org/notes/brainstorm.org")
           "* %^{Title}\n%U\n%?"
           :jump-to-captured t)
          ("nn" "NOTE" entry
           (file+headline "~/.org/notes/notes.org" "Notes")
           "* %^{Title}\n%i\n%U"
           :jump-to-captured t :empty-lines 1)
          ("nl" "LINK" item
           (file+headline "~/.org/notes/links.org" "Links")
           "%a"
           :immediate-finish t)
          ("ny" "TUBE" item
           (file+headline "~/.org/notes/links.org" "Tube")
           "%a"
           :immediate-finish t)
          ("nq" "QUICK NOTE" item
           (file+headline "~/.org/notes/quick.org" "Quick (notes)"))
          ("nc" "CODE NOTE" entry
           (file+headline "~/.org/notes/notes.org" "Code (notes)")
           "* %^{Title}\nURL: %a\n\n#+begin_src %^{Language}\n%i\n#+end_src\n\n%U"
           :jump-to-captured t :empty-lines 1)
          ("nh" "HTML NOTE" entry
           (file+olp "~/.org/notes/notes.org" "HTML (notes)")
           "* %c\n\n%?%:initial\n\n%U"
           :jump-to-captured t :empty-lines 1)
          ("nw" "WEB NOTE" entry
           (file+headline "~/.org/notes/notes.org" "Web (notes)")
           "* %^{Title}\nURL: %a\n\n%i\n\n%U"
           :jump-to-captured t :empty-lines 1)
          ("nd" "DICTIONARY NOTES")
          ("ndd" "EN-RU DICTIONARY NOTE" item
           (file+headline "~/.org/notes/dictionary.org" "English: Unsorted (dictionary)") "%i"
           :immediate-finish t :prepend t :empty-lines 1)
          ("nde" "EN DICTIONARY NOTE" item
           (file+headline "~/.org/notes/dictionary.org" "English: Untranslated (dictionary)") "%i"
           :immediate-finish t :prepend t :empty-lines 1)
          ("ndc" "CONTEXT NOTE" entry
           (file+headline "~/.org/notes/dictionary.org" "English: context (dictionary)") "** %^{Word}\n\n%i"
           :immediate-finish t :prepend t :empty-lines 1)
          ("ndf" "PATTERNS NOTE" item
           (file+headline "~/.org/notes/dictionary.org" "English: patterns (dictionary)") "%i"
           :immediate-finish t :prepend t :empty-lines 1)
          ("nds" "SYNONYMS NOTE" entry
           (file+headline "~/.org/notes/dictionary.org" "English: synonyms (dictionary)") "* %^{Title}\n%i"
           :immediate-finish t :prepend t :empty-lines 1)
          ("j" "JOURNAL")
          ("jj" "JOURNAL ENTRY" plain
           (file+datetree "~/.org/journal/journal.org")
           "**** %^{Entry}\n%U\n\n%?\n%i"
           :unnarrowed t :jump-to-captured t :empty-lines 1)
          ("jd" "JOURNAL ENTRY WITH DATE" plain
           (file+datetree+prompt "~/.org/journal/journal.org")
           "**** %^{Entry}\n%U\n\n%?\n%i"
           :time-prompt t :unnarrowed t :jump-to-captured t :empty-lines 1)
          ("l" "LEDGER")
          ("lc" "ASSETS < EQUITY" plain
           (file "~/.org/account/ledger/main.ledger")
           "%(org-read-date) %^{Account}
    ; %?
    Assets:%^{Account}  R%^{Amount}
    Equity:%^{Source}"
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("le" "ASSETS > PAYEE" plain
           (file "~/.org/account/ledger/main.ledger")
           "%(org-read-date) %^{Payee}
    ; %?
    Expenses:%^{Category}  R%^{Amount}
    Assets:%^{Account}"
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("li" "ASSETS < INCOME" plain
           (file "~/.org/account/ledger/main.ledger")
           "%(org-read-date) %^{Account}
    ; %?
    Assets:%^{Account}  R%^{Amount}
    Income:%^{Source}"
           :immediate-finish t :jump-to-captured t :empty-lines 1)))
  :bind (:map global-map
              ("M-o M-c" . org-capture)))

;;; org-agenda
(use-package org-agenda
  :config
  (kill-local-variable 'org-agenda-files)
  (setq org-agenda-files
        (delete-dups
         (append
          (directory-files-recursively "/home/enomem/.org/account" "\\.org$")
          (directory-files-recursively "/home/enomem/.org/activity" "\\.org$")
          (directory-files-recursively "/home/enomem/.org/analytics" "\\.org$")
          (directory-files-recursively "/home/enomem/.org/drill" "\\.org$")
          (directory-files-recursively "/home/enomem/.org/habits" "\\.org$")
          (directory-files-recursively "/home/enomem/.org/mobile" "\\.org$")
          (directory-files-recursively "/home/enomem/.org/planning" "\\.org$")
          (directory-files-recursively "/home/enomem/.org/reports" "\\.org$")
          (directory-files-recursively "/home/enomem/.org/reviews" "\\.org$")
          (directory-files-recursively "/home/enomem/.org/todo" "\\.org$"))))
  (add-to-list 'warning-suppress-types '(undo discard-info))
  (setq org-agenda-todo-ignore-with-date nil)
  (setq org-agenda-todo-ignore-deadlines nil)
  (setq org-agenda-todo-ignore-scheduled nil)
  (setq org-agenda-todo-ignore-timestamp nil)
  (setq org-agenda-skip-deadline-if-done t)
  (setq org-agenda-skip-scheduled-if-done t)
  (setq org-agenda-skip-scheduled-if-deadline-is-shown t)
  (setq org-agenda-skip-scheduled-delay-if-deadline nil)
  (setq org-agenda-skip-timestamp-if-done t)
  (setq org-agenda-span 1)
  (setq org-agenda-start-day "0d")
  (setq org-agenda-start-on-weekday nil)
  (setq org-agenda-show-log t)
  (setq org-agenda-start-with-log-mode nil)
  (setq org-agenda-log-mode-items '(closed clock state))
  (setq org-agenda-tag-filter-preset '("-#journal" "-#list" "-#note" "#-quiz"))
  (setq org-agenda-custom-commands
        '(("@@" agenda "Agenda"
           ((org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#journal" "-#list" "-#note" "-#quiz"))))
          ("@a" agenda "Active (agenda)"
           ((org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#note" "-#quiz"))))
          ("@o" agenda "Orphan (agenda)"
           ((org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#journal" "-#list" "-#note" "-#quiz" "-@self" "-@work" "-learning" "-#project"))))
          ("@l" agenda "Learning (agenda)"
           ((org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#backlog" "-#journal" "-#list" "-#note" "-#quiz"))))
          ("@p" agenda "Project (agenda)"
           ((org-agenda-tag-filter-preset '("+@project" "-@mobile" "-#backlog" "-#journal" "-#list" "-#note" "-#quiz"))))
          ("@s" agenda "Self (agenda)"
           ((org-agenda-tag-filter-preset '("+@self" "-@mobile" "-#backlog" "-#journal" "-#list" "-#note" "-#quiz"))))
          ("@w" agenda "Work (agenda)"
           ((org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#backlog" "-#journal" "-#list" "-#note" "-#quiz"))))
          ("@g" agenda "GOAL (agenda)"
           ((org-agenda-tag-filter-preset '("+GOAL" "-@mobile" "-#backlog" "-#journal" "-#note" "-#quiz"))))
          ("@q" agenda "QUIZ (agenda)"
           ((org-agenda-tag-filter-preset '("+#quiz" "-@mobile" "-#backlog" "-#journal" "-#list" "-#note"))))

          ;; TODO
          ("ott" "All (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN|GOAL"
           ((org-agenda-overriding-header "All (tasks)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#note"))))
          ("otd" "TODO (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
           ((org-agenda-overriding-header "TODO (tasks)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
          ("otm" alltodo "Mobile (tasks)"
           ((org-agenda-overriding-header "Mobile (tasks)")
            (org-agenda-tag-filter-preset '("+@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
          ("ota" alltodo "Activity (tasks)"
           ((org-agenda-overriding-header "Activity (tasks)")
            (org-agenda-tag-filter-preset '("+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oth" alltodo "Habit (tasks)"
           ((org-agenda-overriding-header "Habit (tasks)")
            (org-agenda-tag-filter-preset '("+#habit" "-@mobile" "-#backlog" "-#note" "-#list" "-#stuck" "-#journal"))))
          ("otA" alltodo "Active (tasks)"
           ((org-agenda-overriding-header "Active (tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("otc" alltodo "Current (tasks)"
           ((org-agenda-overriding-header "Current (tasks)")
            (org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("otn" "Next (todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (todo)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))))
          ("otb" alltodo "Backlog (tasks)"
           ((org-agenda-overriding-header "Backlog (tasks)")
            (org-agenda-tag-filter-preset  '("+#backlog" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ot," alltodo "Stuck (tasks)"
           ((org-agenda-overriding-header "Stuck (tasks)")
            (org-agenda-tag-filter-preset '("+#stuck" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
          ("oto" alltodo "Orphan (tasks)"
           ((org-agenda-overriding-header "Orphan (tasks)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-learning" "-#project"))))
          ("ot." alltodo "Self (tasks)"
           ((org-agenda-overriding-header "Self (tasks)")
            (org-agenda-tag-filter-preset '("+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("otl" alltodo "Learning (tasks)"
           ((org-agenda-overriding-header "Learning (tasks)")
            (org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("otp" alltodo "Project (tasks)"
           ((org-agenda-overriding-header "Project (tasks)")
            (org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("otw" alltodo "Work (tasks)"
           ((org-agenda-overriding-header "Work (tasks)")
            (org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ot-" "Not scheduled (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
           ((org-agenda-overriding-header "Not scheduled (tasks)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#note"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadlined))))
          ("ot+" "Scheduled (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
           ((org-agenda-overriding-header "Scheduled (tasks)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#note"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))))
          ("ot=" "Deadlined (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
           ((org-agenda-overriding-header "Deadlined (tasks)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#note"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))))
          ("ot*" alltodo "All (tasks)"
           ((org-agenda-overriding-header "All (tasks)")
            (org-agenda-tag-filter-preset '())))

          ;; Activity
          ("ova" alltodo "Activity"
           ((org-agenda-overriding-header "Activity")
            (org-agenda-tag-filter-preset '("+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovba" alltodo "Browsing (activities)"
           ((org-agenda-overriding-header "Browsing (activities)")
            (org-agenda-tag-filter-preset '("+browsing" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovbv" alltodo "Browsing (activities)"
           ((org-agenda-overriding-header "Browsing (activities)")
            (org-agenda-tag-filter-preset '("+browsing" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovca" alltodo "Chatting (activities)"
           ((org-agenda-overriding-header "Chatting (activities)")
            (org-agenda-tag-filter-preset '("+chatting" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovcv" alltodo "Chatting (activities)"
           ((org-agenda-overriding-header "Chatting (activities)")
            (org-agenda-tag-filter-preset '("+chatting" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovda" alltodo "Chilling (activities)"
           ((org-agenda-overriding-header "Chilling (activities)")
            (org-agenda-tag-filter-preset '("+chilling" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovdv" alltodo "Chilling (activities)"
           ((org-agenda-overriding-header "Chilling (activities)")
            (org-agenda-tag-filter-preset '("+chilling" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovea" alltodo "Coding (activities)"
           ((org-agenda-overriding-header "Coding (activities)")
            (org-agenda-tag-filter-preset '("+coding" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovev" alltodo "Coding (activities)"
           ((org-agenda-overriding-header "Coding (activities)")
            (org-agenda-tag-filter-preset '("+coding" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovfa" alltodo "Composing (activities)"
           ((org-agenda-overriding-header "Composing (activities)")
            (org-agenda-tag-filter-preset '("+composing" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovfv" alltodo "Composing (activities)"
           ((org-agenda-overriding-header "Composing (activities)")
            (org-agenda-tag-filter-preset '("+composing" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovga" alltodo "Cooking (activities)"
           ((org-agenda-overriding-header "Cooking (activities)")
            (org-agenda-tag-filter-preset '("+cooking" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovgv" alltodo "Cooking (activities)"
           ((org-agenda-overriding-header "Cooking (activities)")
            (org-agenda-tag-filter-preset '("+cooking" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovha" alltodo "Learning (activities)"
           ((org-agenda-overriding-header "Learning (activities)")
            (org-agenda-tag-filter-preset '("+learning" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovhv" alltodo "Learning (activities)"
           ((org-agenda-overriding-header "Learning (activities)")
            (org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovia" alltodo "Listening (activities)"
           ((org-agenda-overriding-header "Listening (activities)")
            (org-agenda-tag-filter-preset '("+listening" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oviv" alltodo "Listening (activities)"
           ((org-agenda-overriding-header "Listening (activities)")
            (org-agenda-tag-filter-preset '("+listening" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovja" alltodo "Meeting (activities)"
           ((org-agenda-overriding-header "Meeting (activities)")
            (org-agenda-tag-filter-preset '("+meeting" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovjv" alltodo "Meeting (activities)"
           ((org-agenda-overriding-header "Meeting (activities)")
            (org-agenda-tag-filter-preset '("+meeting" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovka" alltodo "Painting (activities)"
           ((org-agenda-overriding-header "Painting (activities)")
            (org-agenda-tag-filter-preset '("+painting" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovkv" alltodo "Painting (activities)"
           ((org-agenda-overriding-header "Painting (activities)")
            (org-agenda-tag-filter-preset '("+painting" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovla" alltodo "Planning (activities)"
           ((org-agenda-overriding-header "Planning (activities)")
            (org-agenda-tag-filter-preset '("+planning" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovlv" alltodo "Planning (activities)"
           ((org-agenda-overriding-header "Planning (activities)")
            (org-agenda-tag-filter-preset '("+planning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovma" alltodo "Reading (activities)"
           ((org-agenda-overriding-header "Reading (activities)")
            (org-agenda-tag-filter-preset '("+reading" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovmv" alltodo "Reading (activities)"
           ((org-agenda-overriding-header "Reading (activities)")
            (org-agenda-tag-filter-preset '("+reading" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovna" alltodo "Shopping (activities)"
           ((org-agenda-overriding-header "Shopping (activities)")
            (org-agenda-tag-filter-preset '("+shopping" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovnv" alltodo "Shopping (activities)"
           ((org-agenda-overriding-header "Shopping (activities)")
            (org-agenda-tag-filter-preset '("+shopping" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovoa" alltodo "Sleeping (activities)"
           ((org-agenda-overriding-header "Sleeping (activities)")
            (org-agenda-tag-filter-preset '("+sleeping" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovov" alltodo "Sleeping (activities)"
           ((org-agenda-overriding-header "Sleeping (activities)")
            (org-agenda-tag-filter-preset '("+sleeping" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovpa" alltodo "Talking (activities)"
           ((org-agenda-overriding-header "Talking (activities)")
            (org-agenda-tag-filter-preset '("+talking" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovpv" alltodo "Talking (activities)"
           ((org-agenda-overriding-header "Talking (activities)")
            (org-agenda-tag-filter-preset '("+talking" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovqa" alltodo "Training (activities)"
           ((org-agenda-overriding-header "Training (activities)")
            (org-agenda-tag-filter-preset '("+training" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovqv" alltodo "Training (activities)"
           ((org-agenda-overriding-header "Training (activities)")
            (org-agenda-tag-filter-preset '("+training" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovra" alltodo "Traveling (activities)"
           ((org-agenda-overriding-header "Traveling (activities)")
            (org-agenda-tag-filter-preset '("+traveling" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovrv" alltodo "Traveling (activities)"
           ((org-agenda-overriding-header "Traveling (activities)")
            (org-agenda-tag-filter-preset '("+traveling" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovsa" alltodo "Walking (activities)"
           ((org-agenda-overriding-header "Walking (activities)")
            (org-agenda-tag-filter-preset '("+walking" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovsv" alltodo "Walking (activities)"
           ((org-agenda-overriding-header "Walking (activities)")
            (org-agenda-tag-filter-preset '("+walking" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovta" alltodo "Watching (activities)"
           ((org-agenda-overriding-header "Watching (activities)")
            (org-agenda-tag-filter-preset '("+watching" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovtv" alltodo "Watching (activities)"
           ((org-agenda-overriding-header "Watching (activities)")
            (org-agenda-tag-filter-preset '("+watching" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovua" alltodo "Writing (activities)"
           ((org-agenda-overriding-header "Writing (activities)")
            (org-agenda-tag-filter-preset '("+writing" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ovuv" alltodo "Writing (activities)"
           ((org-agenda-overriding-header "Writing (activities)")
            (org-agenda-tag-filter-preset '("+writing" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

          ;; ACTIVE (in work)
          ("oAa" alltodo "Active (tasks)"
           ((org-agenda-overriding-header "Active (tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oAo" alltodo "Active (orphan tasks)"
           ((org-agenda-overriding-header "Active (orphan tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-learning" "-#project"))))
          ("oAl" alltodo "Active (learning tasks)"
           ((org-agenda-overriding-header "Active (learning tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "+learning" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oAp" alltodo "Active (project tasks)"
           ((org-agenda-overriding-header "Active (project tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "+#project" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oAs" alltodo "Active (self tasks)"
           ((org-agenda-overriding-header "Active (self tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "+@self" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oAw" alltodo "Active (work tasks)"
           ((org-agenda-overriding-header "Active (work tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "+@work" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oAb" alltodo "Active (backlog tasks)"
           ((org-agenda-overriding-header "Active (backlog tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "+#backlog" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oA-" alltodo "Active (not scheduled tasks)"
           ((org-agenda-overriding-header "Active (not scheduled tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadlined))))
          ("oA+" alltodo "Active (scheduled tasks)"
           ((org-agenda-overriding-header "Active (scheduled tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))))
          ("oA=" alltodo "Active (deadlined tasks)"
           ((org-agenda-overriding-header "Active (deadlined tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))))
          ("oA*" alltodo "Active (all tasks)"
           ((org-agenda-overriding-header "Active (all tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

          ;; Entries
          ("oe1" tags "LEVEL=1")
          ("oe2" tags "LEVEL<=2")
          ("oee" tags "LEVEL>=1")

          ;; Current
          ("occ" "Current (todo)" todo "TODO|NEXT|STARTED|PROGRESS"
           ((org-agenda-overriding-header "Current (tasks)")
            (org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oco" "Current (orphan todo)" todo "TODO|NEXT|STARTED|PROGRESS"
           ((org-agenda-overriding-header "Current (orphan tasks)")
            (org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-learning" "-#project"))))
          ("ocl" "Current (learning todo)" todo "TODO|NEXT|STARTED|PROGRESS"
           ((org-agenda-overriding-header "Current (learning tasks)")
            (org-agenda-tag-filter-preset '("+#task" "+learning" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ocp" "Current (project todo)" todo "TODO|NEXT|STARTED|PROGRESS"
           ((org-agenda-overriding-header "Current (projects tasks)")
            (org-agenda-tag-filter-preset '("+#task" "+#project" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ocs" "Current (self todo)" todo "TODO|NEXT|STARTED|PROGRESS"
           ((org-agenda-overriding-header "Current (self tasks)")
            (org-agenda-tag-filter-preset '("+#task" "+@self" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ocw" "Current (work todo)" todo "TODO|NEXT|STARTED|PROGRESS"
           ((org-agenda-overriding-header "Current (work tasks)")
            (org-agenda-tag-filter-preset '("+#task" "+@work" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oc-" "Current (not scheduled todo)" todo "TODO|NEXT|STARTED|PROGRESS"
           ((org-agenda-overriding-header "Current (not scheduled tasks)")
            (org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadlined))))
          ("oc+" "Current (scheduled todo)" todo "TODO|NEXT|STARTED|PROGRESS"
           ((org-agenda-overriding-header "Current (scheduled tasks)")
            (org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))))
          ("oc=" "Current (deadlined todo)" todo "TODO|NEXT|STARTED|PROGRESS"
           ((org-agenda-overriding-header "Current (deadlined tasks)")
            (org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))))
          ("oc*" "Current (all todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
           ((org-agenda-overriding-header "Current (all tasks)")
            (org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

          ;; NEXT (todo)
          ("onn" "Next (todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (todo)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))))
          ("ono" "Next (orphan todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (orphan todo)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal" "-@self" "-@work" "-learning" "-#project"))))
          ("onl" "Next (learning todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (learning todo)")
            (org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("onp" "Next (projects todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (projects todo)")
            (org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("ons" "Next (self todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (self todo)")
            (org-agenda-tag-filter-preset '("+@self" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("onw" "Next (work todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (work todo)")
            (org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("onb" "Next (backlog todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (backlog todo)")
            (org-agenda-tag-filter-preset '("+#backlog" "-@mobile" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))))
          ("on-" "Next (not scheduled todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (not scheduled todo)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadlined))))
          ("on+" "Next (scheduled todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (scheduled todo)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))))
          ("on=" "Next (deadlined todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (deadlined todo)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
            (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))))
          ("on*" "Next (all todo)" todo "NEXT"
           ((org-agenda-overriding-header "Next (all todo)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))))

          ;; Backlog
          ("obb" alltodo "Backlog (tasks)"
           ((org-agenda-overriding-header "Backlog (tasks)")
            (org-agenda-tag-filter-preset  '("+#backlog" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("obo" alltodo "Backlog (orphan tasks)"
           ((org-agenda-overriding-header "Backlog (orphan tasks)")
            (org-agenda-tag-filter-preset  '("+#backlog" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-learning" "-#project"))))
          ("obl" alltodo "Backlog (learning tasks)"
           ((org-agenda-overriding-header "Backlog (learning tasks)")
            (org-agenda-tag-filter-preset  '("+#backlog" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("obp" alltodo "Backlog (project tasks)"
           ((org-agenda-overriding-header "Backlog (project tasks)")
            (org-agenda-tag-filter-preset  '("+#backlog" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("obs" alltodo "Backlog (self tasks)"
           ((org-agenda-overriding-header "Backlog (self tasks)")
            (org-agenda-tag-filter-preset  '("+#backlog" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("obw" alltodo "Backlog (work tasks)"
           ((org-agenda-overriding-header "Backlog (work tasks)")
            (org-agenda-tag-filter-preset  '("+#backlog" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

          ;; Stuck
          ("o,," alltodo "Stuck (tasks)"
           ((org-agenda-overriding-header "Stuck (tasks)")
            (org-agenda-tag-filter-preset '("+#stuck" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
          ("o,o" alltodo "Stuck (orphan tasks)"
           ((org-agenda-overriding-header "Stuck (orphan tasks)")
            (org-agenda-tag-filter-preset '("+#stuck" "-@mobile" "-#journal" "-#list" "-#habit" "-#note" "-@work" "-learning" "-#project"))))
          ("o,l" alltodo "Stuck (learning tasks)"
           ((org-agenda-overriding-header "Stuck (learning tasks)")
            (org-agenda-tag-filter-preset '("+#stuck" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
          ("o,p" alltodo "Stuck (project tasks)"
           ((org-agenda-overriding-header "Stuck (project tasks)")
            (org-agenda-tag-filter-preset '("+#stuck" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
          ("o,." alltodo "Stuck (self tasks)"
           ((org-agenda-overriding-header "Stuck (self tasks)")
            (org-agenda-tag-filter-preset '("+#stuck" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
          ("o,w" alltodo "Stuck (work tasks)"
           ((org-agenda-overriding-header "Stuck (work tasks)")
            (org-agenda-tag-filter-preset '("+#stuck" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))

          ;; Self
          ("o.." alltodo "Self (tasks)"
           ((org-agenda-overriding-header "Self (tasks)")
            (org-agenda-tag-filter-preset '("+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("o.o" alltodo "Self (orphan tasks)"
           ((org-agenda-overriding-header "Self (orphan tasks)")
            (org-agenda-tag-filter-preset '("+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@work" "-learning" "-#project"))))
          ("o.l" alltodo "Self (learning tasks)"
           ((org-agenda-overriding-header "Self (learning tasks)")
            (org-agenda-tag-filter-preset '("+@self" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("o.p" alltodo "Self (project tasks)"
           ((org-agenda-overriding-header "Self (project tasks)")
            (org-agenda-tag-filter-preset '("+@self" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("o.w" alltodo "Self (work tasks)"
           ((org-agenda-overriding-header "Self (work tasks)")
            (org-agenda-tag-filter-preset '("+@self" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

          ;; Learning
          ("oLl" alltodo "Learning (tasks)"
           ((org-agenda-overriding-header "Learning (tasks)")
            (org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oLo" alltodo "Learning (orphan tasks)"
           ((org-agenda-overriding-header "Learning (orphan tasks)")
            (org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-#project"))))
          ("oLp" alltodo "Learning (project tasks)"
           ((org-agenda-overriding-header "Learning (project tasks)")
            (org-agenda-tag-filter-preset '("+learning" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oLs" alltodo "Learning (self tasks)"
           ((org-agenda-overriding-header "Learning (self tasks)")
            (org-agenda-tag-filter-preset '("+learning" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oLw" alltodo "Learning (work tasks)"
           ((org-agenda-overriding-header "Learning (work tasks)")
            (org-agenda-tag-filter-preset '("+ACTIVE" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

          ;; Project
          ("oPp" alltodo "Project (tasks)"
           ((org-agenda-overriding-header "Project (tasks)")
            (org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oPo" alltodo "Project (orphan tasks)"
           ((org-agenda-overriding-header "Project (orphan tasks)")
            (org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-learning"))))
          ("oPl" alltodo "Project (learning tasks)"
           ((org-agenda-overriding-header "Project (learning tasks)")
            (org-agenda-tag-filter-preset '("+#project" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oPs" alltodo "Project (self tasks)"
           ((org-agenda-overriding-header "Project (self tasks)")
            (org-agenda-tag-filter-preset '("+#project" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("oPw" alltodo "Project (work tasks)"
           ((org-agenda-overriding-header "Project (work tasks)")
            (org-agenda-tag-filter-preset '("+#project" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

          ;; Work
          ("o$w" alltodo "Work (tasks)"
           ((org-agenda-overriding-header "Work (tasks)")
            (org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("o$o" alltodo "Work (orphan tasks)"
           ((org-agenda-overriding-header "Work (orphan tasks)")
            (org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-learning" "-#project"))))
          ("o$l" alltodo "Work (learning tasks)"
           ((org-agenda-overriding-header "Work (learning tasks)")
            (org-agenda-tag-filter-preset '("+@work" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("o$p" alltodo "Work (project tasks)"
           ((org-agenda-overriding-header "Work (project tasks)")
            (org-agenda-tag-filter-preset '("+@work" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
          ("o$s" alltodo "Work (self tasks)"
           ((org-agenda-overriding-header "Work (self tasks)")
            (org-agenda-tag-filter-preset '("+@work" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

          ;; GOAL
          ("ogg" "All (goals)" todo "GOAL"
           ((org-agenda-overriding-header "All (goals)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#note"))))
          ("ogb" "Backlog (goals)" todo "GOAL"
           ((org-agenda-overriding-header "Backlog (goals)")
            (org-agenda-tag-filter-preset '("+#backlog" "-@mobile" "-#journal" "-#note"))))
          ("ogc" "Current (goals)" todo "GOAL"
           ((org-agenda-overriding-header "Current (goals)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#journal" "-#note"))))
          ("ogo" "Orphan (goals)" todo "GOAL"
           ((org-agenda-overriding-header "Orphan (goals)")
            (org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#note" "-@self" "-@work" "-learning" "-#project"))))
          ("ogl" "Learning (goals)" todo "GOAL"
           ((org-agenda-overriding-header "Learning (goals)")
            (org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#note"))))
          ("ogp" "Project (goals)" todo "GOAL"
           ((org-agenda-overriding-header "Project (goals)")
            (org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#journal" "-#note"))))
          ("ogw" "Work (goals)" todo "GOAL"
           ((org-agenda-overriding-header "Work (goals)")
            (org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#journal" "-#note"))))))
  (setq org-agenda-clockreport-parameter-plist
        '(:compact t :narrow 40! :maxlevel 5 :formula % :link t
                   :hidefiles t :fileskip0 t
                   :properties ["Effort"] :inherit-props t
                   :scope agenda))
  :bind (:map enomem-mode-map
              ("M-o M-a" . org-agenda))
  :bind (:map org-agenda-mode-map
              ("M-o M-A" . 'org-agenda-bulk-action)
              ("M-o M-R" . 'org-agenda-clockreport-mode)
              ("M-o C-c" . org-agenda-columns)
              ("M-o M-<" . org-agenda-set-restriction-lock-from-agenda)
              ("M-o M->" . org-agenda-remove-restriction-lock)
              ("M-o M-f R" . org-agenda-filter-remove-all)
              ("M-o M-f c" . org-agenda-filter-by-category)
              ("M-o M-f e" . org-agenda-filter-by-effort)
              ("M-o M-f f" . org-agenda-filter)
              ("M-o M-f h" . org-agenda-filter-by-top-headline)
              ("M-o M-f r" . org-agenda-filter-by-regexp)
              ("M-o M-f r" . org-agenda-remove-filter))
  :hook (org-agenda-mode . org-agenda-mode-setup)
  :hook (after-change-major-mode . org-agenda-dir-locals-setup)
  :preface
  (defun enomem/bulk-yank1 (file)
    (interactive "F")
    (let ((entries (reverse org-agenda-bulk-marked-entries)))
      (with-temp-file file
        (mapcar (lambda (m)
                  (with-current-buffer (marker-buffer m)
                    (goto-char m)
                    (org-element-at-point m)
                    (org-copy-subtree 1 nil nil nil))
                  (end-of-buffer)
                  (org-paste-subtree 0))
                entries))))
  (defun org-agenda-mode-setup ()
    (hl-line-mode 1))
  (defun org-agenda-dir-locals-setup ()
    (when (derived-mode-p 'org-mode 'org-agenda-mode)
      (hack-dir-local-variables-non-file-buffer))))

;;; org-super-agenda
(use-package org-super-agenda
  :after org-agenda
  :init
  (org-super-agenda-mode t)
  :config
  (setq org-super-agenda-groups
        '(;; Each group has an implicit boolean OR operator between its selectors.
          (:name "MOBILE items" :tag "@mobile" :order 9)
          (:name "QUIZ items" :tag "#quiz" :order 9)
          (:todo "NEXT" :order 4)       ; Set order of this section
          (:todo ("WAITING") :order 6 :name "WAITING items")
          (:todo ("FROZEN") :order 7 :name "FROZEN items")
          (:todo ("DEPENDENCY") :order 7 :name "DEPENDENCY items")
          (:todo ("SOMEDAY") :order 8 :name "SOMEDAY items")
          (:name "Today"                 ; Optionally specify section name
                 :time-grid t            ; Items that appear on the time grid
                 :tag "#habit" :order 0) ; Items that have this TODO keyword
          (:name "DEADLINE items" :deadline today :deadline past :deadline future :order 0)
          (:name "SCHEDULE items" :scheduled future :scheduled today :scheduled past :order 0)
          (:name "Priority (High)"
                 :and (:priority>= "B" :not (:tag "NEXT" :tag "FROZEN" :tag "SOMEDAY" :tag "WAITING"))
                 ;; Show this section after "Today" and "Important", because
                 ;; their order is unspecified, defaulting to 0. Sections
                 ;; are displayed lowest-number-first.
                 :order 0)
          (:name "Priority (Low)"
                 :and (:priority<= "C" :not (:tag "DEPENDENCY" :tag "FROZEN" :tag "SOMEDAY" :tag "WAITING"))
                 ;; Show this section after "Today" and "Important", because
                 ;; their order is unspecified, defaulting to 0. Sections
                 ;; are displayed lowest-number-first.
                 :order 0)
          (:name "ACTIVE items" :tag "ACTIVE" :order 3)
          ;; Set order of multiple groups at once
          (:name "WORK context"
                 :tag "@work" :order 5)
          (:name "PROJECT context"
                 :tag "#project" :order 5)
          (:name "LEARNING context"
                 :tag "learning" :order 5)
          (:name "PERSONAL context"
                 :habit t
                 :tag ("@self" "@community" "@socium") :order 3)
          (:order-multi (6 (:name "SHOPPING activity" :tag ("shopping"))
                           (:name "READING activity"  :tag ("reading"))
                           (:name "WATCHING activity" :tag ("watching"))))
          (:name "Activities" :tag "activity" :order 5)
          ;; After the last group, the agenda will display items that didn't
          ;; match any of these groups, with the default order position of 99
          (:name "Other" :order 8 :anything t))))

;;; org-ql
(use-package org-ql
  :config
  (setq org-agenda-custom-commands
        (delete-dups
         (append org-agenda-custom-commands
                 '(;; ACTIVE (in work)
                   ("Aa" "Active (tasks)"
                    ((org-ql-block '(and (todo)
                                         (category)
                                         (tags "ACTIVE")
                                         (not (tags "@mobile" "#backlog" "#journal" "#list" "#habit" "#stuck" "#note")))
                                   ((org-ql-block-header "Active (tasks)")))))
                   ("Ao" "Active (orphan tasks)"
                    ((org-ql-block '(and (todo)
                                         (category)
                                         (tags "ACTIVE")
                                         (not (tags "@mobile" "#backlog" "#journal" "#list" "#habit" "#stuck" "#note")
                                              (tags "@mobile" "#backlog" "#journal" "#list" "#habit" "#stuck" "#note" "@self" "@work" "learning" "#project")))
                                   ((org-ql-block-header "Active (orphan tasks)")))))

                   ("Al" alltodo "Active (learning tasks)"
                    ((org-agenda-overriding-header "Active (learning tasks)")
                     (org-agenda-tag-filter-preset '("+ACTIVE" "+learning" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
                   ("Ap" alltodo "Active (project tasks)"
                    ((org-agenda-overriding-header "Active (project tasks)")
                     (org-agenda-tag-filter-preset '("+ACTIVE" "+#project" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
                   ("As" alltodo "Active (self tasks)"
                    ((org-agenda-overriding-header "Active (self tasks)")
                     (org-agenda-tag-filter-preset '("+ACTIVE" "+@self" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
                   ("Aw" alltodo "Active (work tasks)"
                    ((org-agenda-overriding-header "Active (work tasks)")
                     (org-agenda-tag-filter-preset '("+ACTIVE" "+@work" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
                   ("Ab" alltodo "Active (backlog tasks)"
                    ((org-agenda-overriding-header "Active (backlog tasks)")
                     (org-agenda-tag-filter-preset '("+ACTIVE" "+#backlog" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
                   ("A-" alltodo "Active (not scheduled tasks)"
                    ((org-agenda-overriding-header "Active (not scheduled tasks)")
                     (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadlined))))
                   ("A+" alltodo "Active (scheduled tasks)"
                    ((org-agenda-overriding-header "Active (scheduled tasks)")
                     (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))))
                   ("A=" alltodo "Active (deadlined tasks)"
                    ((org-agenda-overriding-header "Active (deadlined tasks)")
                     (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
                     (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))))
                   ("A*" alltodo "Active (all tasks)"
                    ((org-agenda-overriding-header "Active (all tasks)")
                     (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

                   ))))
  (setq org-ql-views
        (list (cons "Project: Nice tools"
                    (list :buffers-files nil
                          :query '(tags "#nicetool")
                          :sort nil
                          :super-groups '((:auto-parent t))
                          :title "Project: Nice tools"))))


  ;;         ;; Current
  ;;         ("cc" "Current (todo)" todo "TODO|NEXT|STARTED|PROGRESS"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Current (tasks)")))
  ;;         ("co" "Current (orphan todo)" todo "TODO|NEXT|STARTED|PROGRESS"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-learning" "-#project"))
  ;;           (org-agenda-overriding-header "Current (orphan tasks)")))
  ;;         ("cl" "Current (learning todo)" todo "TODO|NEXT|STARTED|PROGRESS"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "+learning" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Current (learning tasks)")))
  ;;         ("cp" "Current (project todo)" todo "TODO|NEXT|STARTED|PROGRESS"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "+#project" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Current (projects tasks)")))
  ;;         ("cs" "Current (self todo)" todo "TODO|NEXT|STARTED|PROGRESS"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "+@self" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Current (self tasks)")))
  ;;         ("cw" "Current (work todo)" todo "TODO|NEXT|STARTED|PROGRESS"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "+@work" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Current (work tasks)")))
  ;;         ("c-" "Current (not scheduled todo)" todo "TODO|NEXT|STARTED|PROGRESS"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadlined))
  ;;           (org-agenda-overriding-header "Current (not scheduled tasks)")))
  ;;         ("c+" "Current (scheduled todo)" todo "TODO|NEXT|STARTED|PROGRESS"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))
  ;;           (org-agenda-overriding-header "Current (scheduled tasks)")))
  ;;         ("c=" "Current (deadlined todo)" todo "TODO|NEXT|STARTED|PROGRESS"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
  ;;           (org-agenda-overriding-header "Current (deadlined tasks)")))
  ;;         ("c*" "Current (all todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Current (all tasks)")))

  ;;         ;; NEXT (todo)
  ;;         ("nn" "Next (todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
  ;;           (org-agenda-overriding-header "Next (todo)")))
  ;;         ("no" "Next (orphan todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal" "-@self" "-@work" "-learning" "-#project"))
  ;;           (org-agenda-overriding-header "Next (orphan todo)")))
  ;;         ("nl" "Next (learning todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Next (learning todo)")))
  ;;         ("np" "Next (projects todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Next (projects todo)")))
  ;;         ("ns" "Next (self todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("+@self" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Next (self todo)")))
  ;;         ("nw" "Next (work todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Next (work todo)")))
  ;;         ("nb" "Next (backlog todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("+#backlog" "-@mobile" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
  ;;           (org-agenda-overriding-header "Next (backlog todo)")))
  ;;         ("n-" "Next (not scheduled todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
  ;;           (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadlined))
  ;;           (org-agenda-overriding-header "Next (not scheduled todo)")))
  ;;         ("n+" "Next (scheduled todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
  ;;           (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))
  ;;           (org-agenda-overriding-header "Next (scheduled todo)")))
  ;;         ("n=" "Next (deadlined todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
  ;;           (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
  ;;           (org-agenda-overriding-header "Next (deadlined todo)")))
  ;;         ("n*" "Next (all todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
  ;;           (org-agenda-overriding-header "Next (all todo)")))

  ;;         ;; Backlog
  ;;         ("bb" alltodo "Backlog (tasks)"
  ;;          ((org-agenda-tag-filter-preset  '("+#backlog" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Backlog (tasks)")))
  ;;         ("bo" alltodo "Backlog (orphan tasks)"
  ;;          ((org-agenda-tag-filter-preset  '("+#backlog" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-learning" "-#project"))
  ;;           (org-agenda-overriding-header "Backlog (orphan tasks)")))
  ;;         ("bl" alltodo "Backlog (learning tasks)"
  ;;          ((org-agenda-tag-filter-preset  '("+#backlog" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Backlog (learning tasks)")))
  ;;         ("bp" alltodo "Backlog (project tasks)"
  ;;          ((org-agenda-tag-filter-preset  '("+#backlog" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Backlog (project tasks)")))
  ;;         ("bs" alltodo "Backlog (self tasks)"
  ;;          ((org-agenda-tag-filter-preset  '("+#backlog" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Backlog (self tasks)")))
  ;;         ("bw" alltodo "Backlog (work tasks)"
  ;;          ((org-agenda-tag-filter-preset  '("+#backlog" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Backlog (work tasks)")))

  ;;         ;; Stuck
  ;;         (",," alltodo "Stuck (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+#stuck" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))
  ;;           (org-agenda-overriding-header "Stuck (tasks)")))
  ;;         (",o" alltodo "Stuck (orphan tasks)"
  ;;          ((org-agenda-overriding-header "Stuck (orphan tasks)")
  ;;           (org-agenda-tag-filter-preset '("+#stuck" "-@mobile" "-#journal" "-#list" "-#habit" "-#note" "-@work" "-learning" "-#project"))))
  ;;         (",l" alltodo "Stuck (learning tasks)"
  ;;          ((org-agenda-overriding-header "Stuck (learning tasks)")
  ;;           (org-agenda-tag-filter-preset '("+#stuck" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
  ;;         (",p" alltodo "Stuck (project tasks)"
  ;;          ((org-agenda-overriding-header "Stuck (project tasks)")
  ;;           (org-agenda-tag-filter-preset '("+#stuck" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
  ;;         (",." alltodo "Stuck (self tasks)"
  ;;          ((org-agenda-overriding-header "Stuck (self tasks)")
  ;;           (org-agenda-tag-filter-preset '("+#stuck" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))
  ;;         (",w" alltodo "Stuck (work tasks)"
  ;;          ((org-agenda-overriding-header "Stuck (work tasks)")
  ;;           (org-agenda-tag-filter-preset '("+#stuck" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))))

  ;;         ;; Self
  ;;         (".." alltodo "Self (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Self (tasks)")))
  ;;         (".o" alltodo "Self (orphan tasks)"
  ;;          ((org-agenda-overriding-header "Self (orphan tasks)")
  ;;           (org-agenda-tag-filter-preset '("+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@work" "-learning" "-#project"))))
  ;;         (".l" alltodo "Self (learning tasks)"
  ;;          ((org-agenda-overriding-header "Self (learning tasks)")
  ;;           (org-agenda-tag-filter-preset '("+@self" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
  ;;         (".p" alltodo "Self (project tasks)"
  ;;          ((org-agenda-overriding-header "Self (project tasks)")
  ;;           (org-agenda-tag-filter-preset '("+@self" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
  ;;         (".w" alltodo "Self (work tasks)"
  ;;          ((org-agenda-overriding-header "Self (work tasks)")
  ;;           (org-agenda-tag-filter-preset '("+@self" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

  ;;         ;; Learning
  ;;         ("Ll" alltodo "Learning (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Learning (tasks)")))
  ;;         ("Lo" alltodo "Learning (orphan tasks)"
  ;;          ((org-agenda-overriding-header "Learning (orphan tasks)")
  ;;           (org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-#project"))))
  ;;         ("Lp" alltodo "Learning (project tasks)"
  ;;          ((org-agenda-overriding-header "Learning (project tasks)")
  ;;           (org-agenda-tag-filter-preset '("+learning" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
  ;;         ("Ls" alltodo "Learning (self tasks)"
  ;;          ((org-agenda-overriding-header "Learning (self tasks)")
  ;;           (org-agenda-tag-filter-preset '("+learning" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
  ;;         ("Lw" alltodo "Learning (work tasks)"
  ;;          ((org-agenda-overriding-header "Learning (work tasks)")
  ;;           (org-agenda-tag-filter-preset '("+ACTIVE" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

  ;;         ;; Project
  ;;         ("Pp" alltodo "Project (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Project (tasks)")))
  ;;         ("Po" alltodo "Project (orphan tasks)"
  ;;          ((org-agenda-overriding-header "Project (orphan tasks)")
  ;;           (org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-learning"))))
  ;;         ("Pl" alltodo "Project (learning tasks)"
  ;;          ((org-agenda-overriding-header "Project (learning tasks)")
  ;;           (org-agenda-tag-filter-preset '("+#project" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
  ;;         ("Ps" alltodo "Project (self tasks)"
  ;;          ((org-agenda-overriding-header "Project (self tasks)")
  ;;           (org-agenda-tag-filter-preset '("+#project" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
  ;;         ("Pw" alltodo "Project (work tasks)"
  ;;          ((org-agenda-overriding-header "Project (work tasks)")
  ;;           (org-agenda-tag-filter-preset '("+#project" "+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

  ;;         ;; Work
  ;;         ("$w" alltodo "Work (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Work (tasks)")))
  ;;         ("$o" alltodo "Work (orphan tasks)"
  ;;          ((org-agenda-overriding-header "Work (orphan tasks)")
  ;;           (org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-learning" "-#project"))))
  ;;         ("$l" alltodo "Work (learning tasks)"
  ;;          ((org-agenda-overriding-header "Work (learning tasks)")
  ;;           (org-agenda-tag-filter-preset '("+@work" "+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
  ;;         ("$p" alltodo "Work (project tasks)"
  ;;          ((org-agenda-overriding-header "Work (project tasks)")
  ;;           (org-agenda-tag-filter-preset '("+@work" "+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
  ;;         ("$s" alltodo "Work (self tasks)"
  ;;          ((org-agenda-overriding-header "Work (self tasks)")
  ;;           (org-agenda-tag-filter-preset '("+@work" "+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))

  ;;         ;; GOAL
  ;;         ("gg" "All (goals)" todo "GOAL"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#note"))
  ;;           (org-agenda-overriding-header "All (goals)")))
  ;;         ("gb" "Backlog (goals)" todo "GOAL"
  ;;          ((org-agenda-tag-filter-preset '("+#backlog" "-@mobile" "-#journal" "-#note"))
  ;;           (org-agenda-overriding-header "Backlog (goals)")))
  ;;         ("gc" "Current (goals)" todo "GOAL"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#journal" "-#note"))
  ;;           (org-agenda-overriding-header "Current (goals)")))
  ;;         ("go" "Orphan (goals)" todo "GOAL"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#note" "-@self" "-@work" "-learning" "-#project"))
  ;;           (org-agenda-overriding-header "Orphan (goals)")))
  ;;         ("gl" "Learning (goals)" todo "GOAL"
  ;;          ((org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#note"))
  ;;           (org-agenda-overriding-header "Learning (goals)")))
  ;;         ("gp" "Project (goals)" todo "GOAL"
  ;;          ((org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#journal" "-#note"))
  ;;           (org-agenda-overriding-header "Project (goals)")))
  ;;         ("gw" "Work (goals)" todo "GOAL"
  ;;          ((org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#journal" "-#note"))
  ;;           (org-agenda-overriding-header "Work (goals)")))

  ;;         ;; TODO
  ;;         ("tt" "All (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN|GOAL"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#note"))
  ;;           (org-agenda-overriding-header "All (tasks)")))
  ;;         ("td" "TODO (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#note"))
  ;;           (org-agenda-overriding-header "TODO (tasks)")))
  ;;         ("tm" alltodo "Mobile (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+@mobile" "-#journal" "-#list" "-#habit" "-#note"))
  ;;           (org-agenda-overriding-header "Mobile (tasks)")))
  ;;         ("ta" alltodo "Activity (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Activity (tasks)")))
  ;;         ("th" alltodo "Habit (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+#habit" "-@mobile" "-#backlog" "-#note" "-#list" "-#stuck" "-#journal"))
  ;;           (org-agenda-overriding-header "Habit (tasks)")))
  ;;         ("tA" alltodo "Active (tasks)"
  ;;          ((org-agenda-overriding-header "Active (tasks)")
  ;;           (org-agenda-tag-filter-preset '("+ACTIVE" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))))
  ;;         ("tc" alltodo "Current (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+#task" "-@mobile" "-#backlog" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Current (tasks)")))
  ;;         ("tn" "Next (todo)" todo "NEXT"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#backlog" "-#note" "-#list" "-#habit" "-#stuck" "-#journal"))
  ;;           (org-agenda-overriding-header "Next (todo)")))
  ;;         ("tb" alltodo "Backlog (tasks)"
  ;;          ((org-agenda-tag-filter-preset  '("+#backlog" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Backlog (tasks)")))
  ;;         ("t," alltodo "Stuck (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+#stuck" "-@mobile" "-#journal" "-#list" "-#habit" "-#note"))
  ;;           (org-agenda-overriding-header "Stuck (tasks)")))
  ;;         ("to" alltodo "Orphan (tasks)"
  ;;          ((org-agenda-overriding-header "Orphan (tasks)")
  ;;           (org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz" "-@self" "-@work" "-learning" "-#project"))))
  ;;         ("t." alltodo "Self (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+@self" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Self (tasks)")))
  ;;         ("tl" alltodo "Learning (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Learning (tasks)")))
  ;;         ("tp" alltodo "Project (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+#project" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Project (tasks)")))
  ;;         ("tw" alltodo "Work (tasks)"
  ;;          ((org-agenda-tag-filter-preset '("+@work" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Work (tasks)")))
  ;;         ("t-" "Not scheduled (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#note"))
  ;;           (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadlined))
  ;;           (org-agenda-overriding-header "Not scheduled (tasks)")))
  ;;         ("t+" "Scheduled (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#note"))
  ;;           (org-agenda-skip-function '(org-agenda-skip-entry-if 'notscheduled))
  ;;           (org-agenda-overriding-header "Scheduled (tasks)")))
  ;;         ("t=" "Deadlined (todo)" todo "TODO|NEXT|STARTED|PROGRESS|WAITING|DEPENDENCY|SOMEDAY|FROZEN"
  ;;          ((org-agenda-tag-filter-preset '("-@mobile" "-#journal" "-#list" "-#habit" "-#note"))
  ;;           (org-agenda-skip-function '(org-agenda-skip-entry-if 'notdeadline))
  ;;           (org-agenda-overriding-header "Deadlined (tasks)")))
  ;;         ("t*" alltodo "All (tasks)"
  ;;          ((org-agenda-overriding-header "All (tasks)")))

  ;;         ;; Entries
  ;;         ("ee" tags "LEVEL>=1")

  ;;         ;; Activity
  ;;         ("va" alltodo "Activity"
  ;;          ((org-agenda-tag-filter-preset '("+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Activity")))
  ;;         ("vba" alltodo "Browsing (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+browsing" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Browsing (activities)")))
  ;;         ("vbv" alltodo "Browsing (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+browsing" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Browsing (activities)")))
  ;;         ("vca" alltodo "Chatting (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+chatting" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Chatting (activities)")))
  ;;         ("vcv" alltodo "Chatting (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+chatting" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Chatting (activities)")))
  ;;         ("vda" alltodo "Chilling (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+chilling" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Chilling (activities)")))
  ;;         ("vdv" alltodo "Chilling (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+chilling" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Chilling (activities)")))
  ;;         ("vea" alltodo "Coding (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+coding" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Coding (activities)")))
  ;;         ("vev" alltodo "Coding (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+coding" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Coding (activities)")))
  ;;         ("vfa" alltodo "Composing (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+composing" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Composing (activities)")))
  ;;         ("vfv" alltodo "Composing (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+composing" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Composing (activities)")))
  ;;         ("vga" alltodo "Cooking (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+cooking" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Cooking (activities)")))
  ;;         ("vgv" alltodo "Cooking (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+cooking" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Cooking (activities)")))
  ;;         ("vha" alltodo "Learning (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+learning" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Learning (activities)")))
  ;;         ("vhv" alltodo "Learning (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+learning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Learning (activities)")))
  ;;         ("via" alltodo "Listening (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+listening" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Listening (activities)")))
  ;;         ("viv" alltodo "Listening (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+listening" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Listening (activities)")))
  ;;         ("vja" alltodo "Meeting (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+meeting" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Meeting (activities)")))
  ;;         ("vjv" alltodo "Meeting (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+meeting" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Meeting (activities)")))
  ;;         ("vka" alltodo "Painting (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+painting" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Painting (activities)")))
  ;;         ("vkv" alltodo "Painting (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+painting" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Painting (activities)")))
  ;;         ("vla" alltodo "Planning (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+planning" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Planning (activities)")))
  ;;         ("vlv" alltodo "Planning (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+planning" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Planning (activities)")))
  ;;         ("vma" alltodo "Reading (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+reading" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Reading (activities)")))
  ;;         ("vmv" alltodo "Reading (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+reading" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Reading (activities)")))
  ;;         ("vna" alltodo "Shopping (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+shopping" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Shopping (activities)")))
  ;;         ("vnv" alltodo "Shopping (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+shopping" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Shopping (activities)")))
  ;;         ("voa" alltodo "Sleeping (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+sleeping" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Sleeping (activities)")))
  ;;         ("vov" alltodo "Sleeping (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+sleeping" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Sleeping (activities)")))
  ;;         ("vpa" alltodo "Talking (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+talking" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Talking (activities)")))
  ;;         ("vpv" alltodo "Talking (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+talking" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Talking (activities)")))
  ;;         ("vqa" alltodo "Training (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+training" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Training (activities)")))
  ;;         ("vqv" alltodo "Training (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+training" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Training (activities)")))
  ;;         ("vra" alltodo "Traveling (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+traveling" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Traveling (activities)")))
  ;;         ("vrv" alltodo "Traveling (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+traveling" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Traveling (activities)")))
  ;;         ("vsa" alltodo "Walking (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+walking" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Walking (activities)")))
  ;;         ("vsv" alltodo "Walking (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+walking" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Walking (activities)")))
  ;;         ("vta" alltodo "Watching (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+watching" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Watching (activities)")))
  ;;         ("vtv" alltodo "Watching (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+watching" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Watching (activities)")))
  ;;         ("vua" alltodo "Writing (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+writing" "+activity" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Writing (activities)")))
  ;;         ("vuv" alltodo "Writing (activities)"
  ;;          ((org-agenda-tag-filter-preset '("+writing" "-@mobile" "-#journal" "-#list" "-#habit" "-#stuck" "-#note" "-#quiz"))
  ;;           (org-agenda-overriding-header "Writing (activities)")))))
  ;; (setq org-ql-views
  ;;       (list (cons "Overview: Agenda-like"
  ;;                   (list :buffers-files #'org-agenda-files
  ;;                         :query '(and (not (done))
  ;;                                      (or (habit)
  ;;                                          (deadline auto)
  ;;                                          (scheduled :to today)
  ;;                                          (ts-active :on today)))
  ;;                         :sort '(todo priority date)
  ;;                         :super-groups 'org-super-agenda-groups
  ;;                         :title "Agenda-like"))
  ;;             (cons "Overview: NEXT tasks"
  ;;                   (list :buffers-files #'org-agenda-files
  ;;                         :query '(todo "NEXT")
  ;;                         :sort '(date priority)
  ;;                         :super-groups 'org-super-agenda-groups
  ;;                         :title "Overview: NEXT tasks"))
  ;;             (cons "Calendar: Today"
  ;;                   (list :buffers-files #'org-agenda-files
  ;;                         :query '(ts-active :on today)
  ;;                         :title "Today"
  ;;                         :super-groups 'org-super-agenda-groups
  ;;                         :sort '(priority)))
  ;;             (cons "Calendar: This week"
  ;;                   (lambda ()
  ;;                     "Show items with an active timestamp during this calendar week."
  ;;                     (interactive)
  ;;                     (let* ((ts (ts-now))
  ;;                            (beg-of-week (->> ts
  ;;                                              (ts-adjust 'day (- (ts-dow (ts-now))))
  ;;                                              (ts-apply :hour 0 :minute 0 :second 0)))
  ;;                            (end-of-week (->> ts
  ;;                                              (ts-adjust 'day (- 6 (ts-dow (ts-now))))
  ;;                                              (ts-apply :hour 23 :minute 59 :second 59))))
  ;;                       (org-ql-search (org-agenda-files)
  ;;                         `(ts-active :from ,beg-of-week
  ;;                                     :to ,end-of-week)
  ;;                         :title "This week"
  ;;                         :super-groups 'org-super-agenda-groups
  ;;                         :sort '(priority)))))
  ;;             (cons "Calendar: Next week"
  ;;                   (lambda ()
  ;;                     "Show items with an active timestamp during the next calendar week."
  ;;                     (interactive)
  ;;                     (let* ((ts (ts-adjust 'day 7 (ts-now)))
  ;;                            (beg-of-week (->> ts
  ;;                                              (ts-adjust 'day (- (ts-dow (ts-now))))
  ;;                                              (ts-apply :hour 0 :minute 0 :second 0)))
  ;;                            (end-of-week (->> ts
  ;;                                              (ts-adjust 'day (- 6 (ts-dow (ts-now))))
  ;;                                              (ts-apply :hour 23 :minute 59 :second 59))))
  ;;                       (org-ql-search (org-agenda-files)
  ;;                         `(ts-active :from ,beg-of-week
  ;;                                     :to ,end-of-week)
  ;;                         :title "Next week"
  ;;                         :super-groups 'org-super-agenda-groups
  ;;                         :sort '(priority)))))
  ;;             (cons "Review: Recently timestamped" #'org-ql-view-recent-items)
  ;;             (cons (propertize "Review: Dangling tasks"
  ;;                               'help-echo "Tasks whose ancestor is done")
  ;;                   (list :buffers-files #'org-agenda-files
  ;;                         :query '(and (todo)
  ;;                                      (ancestors (done)))
  ;;                         :title (propertize "Review: Dangling tasks"
  ;;                                            'help-echo "Tasks whose ancestor is done")
  ;;                         :sort '(todo priority date)
  ;;                         :super-groups '((:auto-parent t))))
  ;;             (cons (propertize "Review: Stale tasks"
  ;;                               'help-echo "Tasks without a timestamp in the past 2 weeks")
  ;;                   (list :buffers-files #'org-agenda-files
  ;;                         :query '(and (todo)
  ;;                                      (not (ts :from -14)))
  ;;                         :title (propertize "Review: Stale tasks"
  ;;                                            'help-echo "Tasks without a timestamp in the past 2 weeks")
  ;;                         :sort '(todo priority date)
  ;;                         :super-groups '((:auto-parent t))))
  ;;             (cons (propertize "Review: Stuck projects"
  ;;                               'help-echo "Tasks with sub-tasks but no NEXT sub-tasks")
  ;;                   (list :buffers-files #'org-agenda-files
  ;;                         :query '(and (todo)
  ;;                                      (descendants (todo))
  ;;                                      (not (descendants (todo "NEXT"))))
  ;;                         :title (propertize "Review: Stuck projects"
  ;;                                            'help-echo "Tasks with sub-tasks but no NEXT sub-tasks")
  ;;                         :sort '(date priority)
  ;;                         :super-groups 'org-super-agenda-groups)))
  ;;       "Alist of `org-ql-view' commands."
  ;;       :type
  ;;       '(alist
  ;;         :key-type (string :tag "Name")
  ;;         :value-type
  ;;         (choice (function :tag "Function which calls `org-ql-search'")
  ;;                 (plist :tag "Org QL Search"
  ;;                        :options (((const :tag "Buffers/files" :buffers-files)
  ;;                                   (choice (function-item :tag "Org Agenda Files" org-agenda-files)
  ;;                                           (repeat :tag "Buffer or file names" string)
  ;;                                           (function :tag "Function which returns a list of buffers and/or files" list)))
  ;;                                  ((const :tag "Query" :query) (sexp :tag "org-ql query sexp"))
  ;;                                  ((const :tag "Search title" :title) string)
  ;;                                  ((const :tag "Sort-by" :sort) (repeat
  ;;                                                                 (choice (const date)
  ;;                                                                         (const deadline)
  ;;                                                                         (const scheduled)
  ;;                                                                         (const todo)
  ;;                                                                         (const priority)
  ;;                                                                         (const random)
  ;;                                                                         (const reverse)
  ;;                                                                         (function :tag "Custom comparator"))))
  ;;                                  ((const :tag "Group-by" :super-groups)
  ;;                                   (choice (variable-item :tag "Default org-super-agenda groups" org-super-agenda-groups)
  ;;                                           (sexp :tag "org-super-agenda grouping expression")
  ;;                                           (variable :tag "Variable holding org-super-agenda  grouping expression"))))))))
  :bind (:map enomem-mode-map
              ("M-o M-q d" . 'org-ql-view-dispatch)
              ("M-o M-q v" . 'org-ql-view-sidebar)
              ("M-o M-q s" . 'org-ql-search))
  :bind (:map org-agenda-mode-map
              ("M-o M-q S" . 'org-ql-view-save)
              ("M-o M-q R" . 'org-ql-view-refresh)
              ("M-o M-q W" . 'org-ql-view-switch)))

;;; org-sidebar
(use-package org-sidebar)

;;; org-clock
(use-package org-clock
  :config
  (setq org-clock-clocktable-default-properties
        '(:compact t :narrow 40! :maxlevel 5 :formula % :link t
                   :hidefiles t :fileskip0 t :step day :stepskip0 t
                   :tstart "<today>" :tend "<now>"
                   :properties ["Effort"]
                   :scope agenda))
  (setq org-clock-report-include-clocking-task t)
  (setq org-clock-out-remove-zero-time-clocks t)
  (setq org-clock-sound "~/.local/share/sounds/freedesktop/stereo/complete.wav")
  (setq org-clock-persist t)
  :bind (:map global-map
              ("M-o c r" . org-clock-report)
              ("M-o c d" . org-clock-display)
              ("M-o c g" . org-clock-goto)
              ("M-o c i" . org-clock-in)
              ("M-o c o" . org-clock-out)
              ("M-o c q" . org-clock-cancel)
              ("M-o c z" . org-resolve-clocks)))

;;; org-timer
(use-package org-timer
  :config
  (setq org-timer-done-hook 'org-timer-done-hook-setup)
  :bind (:map global-map
              ("M-o M-t M-," . org-timer-start)
              ("M-o M-t M-." . org-timer-pause-or-continue)
              ("M-o M-t M-/" . org-timer-stop)
              ("M-o M-t M-;" . org-timer-set-timer)
              ("M-o M-t M-t" . org-timer))
  :preface
  (defun org-timer-done-hook-setup ()
    (async-shell-command "notify-send -i /usr/share/notify-osd/icons/hicolor/scalable/status/notification-message-email.svg \"Timer end\"; echo Timer end")))

;;; org-protocol
(use-package org-protocol)

;;; org-collector
(use-package org-collector)

;;; org-src
(use-package org-src)

;;; ob
(use-package ob
  :config
  (setq org-babel-languages
        '((C . t)
          (R . t)
          (asymptote . t)
          (awk . t)
          (coq . t)
          (ditaa . t)
          (dot . t)
          (emacs-lisp . t)
          (eshell . t)
          (gnuplot . t)
          (haskell . t)
          (java . t)
          (jupyter . t)
          (js . t)
          (latex . t)
          (ledger . t)
          (lisp . t)
          (makefile . t)
          (maxima . t)
          (octave . t)
          (org . t)
          (perl . t)
          (plantuml . t)
          (prolog . t)
          (python . t)
          (restclient . t)
          (ruby . t)
          (scheme . t)
          (sclang . t)
          (sed . t)
          (shell . t)
          (sql . t)
          (tcl . t)
          (tmux . t)))
  (setq org-confirm-babel-evaluate nil)
  (setq org-ditaa-jar-path "/usr/share/ditaa/ditaa.jar")
  (setq org-latex-packages-alist
        '(("T1" "fontenc")
          ("" "babel")
          ("" "enumitem")
          ("margin=1cm" "geometry")
          ("" "listings")
          ("" "minted")))
  (setq org-latex-src-block-backend 'verbatim)
  (setq org-plantuml-jar-path "/usr/share/plantuml/lib/plantuml.jar")
  (setq org-plantuml-jar-path "/usr/share/plantuml/plantuml.jar")
  (setq org-plantuml-jar-path "/home/enomem/.local/share/plantuml/lib/plantuml.jar")
  (setq org-babel-python-command "ipython --simple-prompt -i")
  (org-babel-do-load-languages 'org-babel-load-languages org-babel-languages)
  :bind (:map global-map
              ("M-o M-s d" . org-babel-detangle)
              ("M-o M-s j" . org-babel-tangle-jump-to-org)))

;;; ob-async
(use-package ob-async :disabled
  :after ob)

;;; ob-jupyter
(use-package ob-jupyter
  :config
  (add-to-list 'org-babel-languages '(jupyter . t)))

;;; ob-perl
(use-package ob-perl)

;;; ob-prolog
(use-package ob-prolog)

;;; ob-python
(use-package ob-python
  :config
  (setq py-default-interpreter
        (expand-file-name (concat (getenv "VIRTUAL_ENV") "/bin/ipython"))))

;;; ob-restclient
(use-package ob-restclient)

;;; ob-tcl
(use-package ob-tcl)

;;; ob-tmux
(use-package ob-tmux
  :after ob
  :config
  (setq org-babel-tmux-session-prefix "")
  (setq org-babel-tmux-terminal "xterm")
  (setq org-babel-tmux-terminal-opts '("-T" "ob-tmux" "-e")))

;;; oc
(use-package oc
  :config
  (setq org-cite-global-bibliography '("~/.org/bibliography/biblio-all.bib"
                                       "~/.org/bibliography/man/man.bib"
                                       "~/.org/bibliography/new/new.bib"
                                       "~/.org/bibliography/literature/literature.bib"
                                       "~/.org/bibliography/kolhoz/kolhoz.bib"
                                       "~/.org/bibliography/web/web.bib"))
  :bind (:map org-mode-map
              ("M-o M-C i" . 'org-cite-insert)))

;;; ol
(use-package ol
  :bind (:map enomem-mode-map
              ("M-o M-l l" . org-store-link)))

;;; ox
(use-package ox
  :config
  (add-to-list 'org-export-backends 'md)
  (add-to-list 'org-export-backends 'org)
  (setq org-html-mathjax-options
        '((path "file:///usr/share/mathjax/MathJax.js")
          (scale "100")
          (align "center")
          (indent "2em")
          (mathml nil)))
  (setq org-html-inline-images t)
  (setq org-html-head-include-default-style nil)
  (setq org-html-validation-link nil)
  (setq org-export-htmlize-output-type 'css)
  (setq org-export-headline-levels 10)
  (setq org-latex-listings t))

;;; ox-extra
(use-package ox-extra
  :config
  (ox-extras-activate '(ignore-headlines)))

;;; ox-hugo
(use-package ox-hugo)

;;; ox-jira
(use-package ox-jira)

;;; ox-rst
(use-package ox-rst)

;;; citar
(use-package citar
  :init
  (setq citar-notes-paths '("~/.org/bibliography/_notes"))
  (setq citar-bibliography '("~/.org/bibliography/biblio-all.bib"
                             "~/.org/bibliography/man/man.bib"
                             "~/.org/bibliography/new/new.bib"
                             "~/.org/bibliography/literature/literature.bib"
                             "~/.org/bibliography/kolhoz/kolhoz.bib"
                             "~/.org/bibliography/web/web.bib"))
  :bind (:map bibtex-mode-map
              ("M-o M-r M-b" . 'citar-insert-bibtex))
  :bind (:map org-mode-map
              ("M-o M-r M-b" . 'citar-insert-bibtex)
              ("M-o M-r M-l" . 'citar-insert-citation)
              ("M-o M-r M-o" . 'citar-open-entry)
              ("M-o M-r M-r" . 'citar-org-roam-ref-add)
              ("M-o M-r M-i" . 'citar-insert-reference)))

;;; org-ref
(use-package org-ref
  :config
  (setq org-ref-bibliography-notes "~/.org/bibliography/_notes/")
  (setq org-ref-default-bibliography
        '("~/.org/bibliography/biblio.bib"
          "~/.org/bibliography/literature/literature.bib"
          "~/.org/bibliography/man/man.bib"
          "~/.org/bibliography/web/web.bib"))
  (setq org-ref-pdf-directory "~/.org/bibliography/_pdf")
  :bind (:map bibtex-mode-map
              ("M-o r a" . 'org-ref-insert-label-link)
              ("M-o r b" . 'org-ref-bibtex-file/body)
              ("M-o r c" . 'org-ref-citation-hydra/body)
              ("M-o r f" . 'org-ref-list-of-figures)
              ("M-o r i" . 'org-ref-insert-link-hydra/body)
              ("M-o r l" . 'org-ref-insert-link)
              ("M-o r n" . 'org-ref-bibtex-new-entry/body)
              ("M-o r r" . 'org-ref-insert-ref-link)
              ("M-o r t" . 'org-ref-list-of-tables)
              ("M-o r v" . 'org-ref-bibtex-file/bibtex-validate-and-exit))
  :bind (:map org-mode-map
              ("M-o r a" . 'org-ref-insert-label-link)
              ("M-o r b" . 'org-ref-bibtex-file/body)
              ("M-o r c" . 'org-ref-citation-hydra/body)
              ("M-o r f" . 'org-ref-list-of-figures)
              ("M-o r i" . 'org-ref-insert-link-hydra/body)
              ("M-o r l" . 'org-ref-insert-link)
              ("M-o r n" . 'org-ref-bibtex-new-entry/body)
              ("M-o r r" . 'org-ref-insert-ref-link)
              ("M-o r t" . 'org-ref-list-of-tables)))

;;; org-ref-prettify
(use-package org-ref-prettify :disabled)

;;; org-roam
(use-package org-roam
  :config
  (setq org-roam-directory "~/.org/roam")
  (setq org-roam-dailies-directory "~/.org/roam/diary")
  (cl-defmethod org-roam-node-type ((node org-roam-node))
    "Return the TYPE of NODE."
    (condition-case nil
        (file-name-nondirectory
         (directory-file-name
          (file-name-directory
           (file-relative-name (org-roam-node-file node) org-roam-directory))))
      (error "")))
  (setq org-roam-node-display-template
        (concat "${type:15} ${title:*} " (propertize "${tags:10}" 'face 'org-tag)))
  (setq org-roam-completion-everywhere t)
  (setq org-roam-capture-templates
        '(;; notes
          ("n" "note")
          ("nn" "note (roam)" plain "%?"
           :if-new
           (file+head "note/%<%Y%m%d%H%M%S>-${slug}.org"
                      "#+title: ${title}\n#+category: NONE\n#+filetags: :draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* ${title}\n")
           :unnarrowed t :immediate-finish t :jump-to-captured t)
          ;; references
          ("r" "reference")
          ("rr" "reference (roam)" plain "%?"
           :if-new
           (file+head "reference/${slug}.org"
                      "#+title: ${title}\n#+category: NONE\n#+filetags: :reference:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* ${title}\n")
           :unnarrowed t :immediate-finish t :jump-to-captured t)
          ("ra" "reference/article (roam)" plain "%?"
           :if-new
           (file+head "reference/book/${slug}.org"
                      "#+title: ${title}\n#+category: NONE\n#+filetags: :reference:book:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* [[cite:&${citekey}][${title}]]\n")
           :unnarrowed t :immediate-finish t :jump-to-captured t)
          ("rb" "reference/book (roam)" plain "%?"
           :if-new
           (file+head "reference/book/${slug}.org"
                      "#+title: ${author} (${year}) ${title}, ${publisher}\n#+category: NONE\n#+filetags: :reference:book:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* [[cite:&${citekey}][${author} (${year}) ${title}, ${publisher}]]\n")
           :unnarrowed t :immediate-finish t :jump-to-captured t)
          ("rm" "reference/manual (roam)" plain "%?"
           :if-new
           (file+head "reference/man/${slug}.org"
                      "#+title: ${title} (${year})\n#+category: NONE\n#+filetags: :reference:manual:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* [[cite:&${citekey}][${title} (${year})]]\n")
           :unnarrowed t :immediate-finish t :jump-to-captured t)
          ("rs" "reference/standard (roam)" plain "%?"
           :if-new
           (file+head "reference/standard/${slug}.org"
                      "#+title: ${title} (${year})\n#+category: NONE\n#+filetags: :reference:standard:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* [[cite:&${citekey}][${title} (${year})]]\n")
           :unnarrowed t :immediate-finish t :jump-to-captured t)
          ("rw" "reference/web (roam)" plain "%?"
           :if-new
           (file+head "reference/web/${slug}.org"
                      "#+title: ${title}\n#+category: NONE\n#+filetags: :reference:web:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* [[cite:&${citekey}][${title}]]\n")
           :unnarrowed t :immediate-finish t :jump-to-captured t)
          ("l" "language")
          ("le" "english language")
          ("lem" "en-ru dictionary note" plain ""
           :if-new
           (file+head "note/language/english/en-mueller-${slug}.org"
                      "#+title: English: en-ru: ${title}\n#+category: ENGLISH\n#+filetags: :#en_ru:#word:#mueller:#dictionary:#english:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* English: en-ru: ${title}\n\n:backtags: roam:english.dictionary.mueller\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("lek" "ru-en dictionary note" plain ""
           :if-new
           (file+head "note/language/english/en-korolev-${slug}.org"
                      "#+title: English: ru-en: ${title}\n#+category: ENGLISH\n#+filetags: :#ru_en:#word:#korolev:#dictionary:#english:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* English: ru-en: ${title}\n\n:backtags: roam:english.dictionary.korolev\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("leE" "en-ru dictionary note" plain ""
           :if-new
           (file+head "note/language/english/en-engrus-${slug}.org"
                      "#+title: English: en-ru: ${title}\n#+category: ENGLISH\n#+filetags: :#en_ru:#word:#engrus:#dictionary:#english:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* English: en-ru: ${title}\n\n:backtags: roam:english.dictionary.engrus\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("leR" "ru-en dictionary note" plain ""
           :if-new
           (file+head "note/language/english/en-ruseng-${slug}.org"
                      "#+title: English: ru-en: ${title}\n#+category: ENGLISH\n#+filetags: :#ru_en:#word:#ruseng:#dictionary:#english:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* English: ru-en: ${title}\n\n:backtags: roam:english.dictionary.ruseng\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("lew" "english WordNet dictionary note" plain ""
           :if-new
           (file+head "note/language/english/en-wordnet-${slug}.org"
                      "#+title: English: wordnet: ${title}\n#+category: ENGLISH\n#+filetags: :#en:#word:#wordnet:#dictionary:#english:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* English: wordnet: ${title}\n\n:backtags: roam:english.dictionary.wordnet\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("les" "english synonyms dictionary note" plain ""
           :if-new
           (file+head "note/language/english/en-synonyms-${slug}.org"
                      "#+title: English: synonyms: ${title}\n#+category: ENGLISH\n#+filetags: :#en:#word:#synonym:#dictionary:#english:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* English: synonyms: ${title}\n\n:backtags: roam:english.dictionary.synonyms\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("lec" "english context dictionary note" plain ""
           :if-new
           (file+head "note/language/english/en-context-${slug}.org"
                      "#+title: English: context: ${title}\n#+category: ENGLISH\n#+filetags: :#en:#word:#context:#dictionary:#english:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* English: context: ${title}\n\n:backtags: roam:english.dictionary.reverso\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("lep" "english patterns dictionary note" plain ""
           :if-new
           (file+head "note/language/english/en-pattern-${slug}.org"
                      "#+title: English: patterns: ${title}\n#+category: ENGLISH\n#+filetags: :#en:#word:#pattern:#dictionary:#english:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* English: patterns: ${title}\n\n:backtags: roam:english.dictionary.patterns\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("lr" "russian language")
          ("lro" "russian ozhegov dictionary note" plain ""
           :if-new
           (file+head "note/language/russian/ru-ozhegov-${slug}.org"
                      "#+title: Russian: ozhegov: ${title}\n#+category: RUSSIAN\n#+filetags: :#ru:#word:#ozhegov:#dictionary:#russian:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* Russian: ozhegov: ${title}\n\n:backtags: roam:russian.dictionary.ozhegov\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("lrb" "russian beslov dictionary note" plain ""
           :if-new
           (file+head "note/language/russian/ru-beslov-${slug}.org"
                      "#+title: Russian: beslov: ${title}\n#+category: RUSSIAN\n#+filetags: :#ru:#word:#beslov:#dictionary:#russian:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* Russian: beslov: ${title}\n\n:backtags: roam:russian.dictionary.beslov\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("lrd" "russian dalf dictionary note" plain ""
           :if-new
           (file+head "note/language/russian/ru-dalf-${slug}.org"
                      "#+title: Russian: dal: ${title}\n#+category: RUSSIAN\n#+filetags: :#ru:#word:#dalf:#dictionary:#russian:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* Russian: dalf: ${title}\n\n:backtags: roam:russian.dictionary.dalf\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("lru" "russian ushakov dictionary note" plain ""
           :if-new
           (file+head "note/language/russian/ru-ushakov-${slug}.org"
                      "#+title: Russian: ushakov: ${title}\n#+category: RUSSIAN\n#+filetags: :#ru:#word:#ushakov:#dictionary:#russian:#language:learning:draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* Russian: ushakov: ${title}\n\n:backtags: roam:russian.dictionary.ushakov\n\n%i")
           :immediate-finish t :jump-to-captured t :empty-lines 1)
          ("nn" "note (roam)" plain ""
           :if-new
           (file+head "note/%<%Y%m%d%H%M%S>-${slug}.org"
                      "#+title: ${title}\n#+category: NONE\n#+filetags: :draft:#note:\n#+columns: %8TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* ${title}\n")
           :unnarrowed t :immediate-finish t :jump-to-captured t :empty-lines 1)))
  (setq org-roam-dailies-capture-templates
        '(("d" "DAILY ENTRY" entry "%i"
           :if-new
           (file+head+olp "%<%Y-%m-%d>.org"
                          "#+title: %<%Y-%m-%d>\n#+category: DIARY\n#+filetags: :#diary:#note:\n#+columns: %5TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* %<%Y>\n** %<%Y-%m %B>\n*** %<%Y-%m-%d %A>" ("%<%Y>" "%<%Y-%m %B>" "%<%Y-%m-%d %A>" "%^{Entry}\n%U\n\n%?\n%i\n"))
           :unnarrowed t :jump-to-captured t :empty-lines 1)
          ("j" "DAILY ENTRY" plain "%i"
           :if-new
           (file+head+olp "%<%Y-%m-%d>.org"
                          "#+title: %<%Y-%m-%d>\n#+category: DIARY\n#+filetags: :#diary:#note:\n#+columns: %5TODO %40ITEM %1PRIORITY %5Effort %5Effort(Effort Children){:} %10CLOCKSUM\n#+options: ^:nil\n\n* %<%Y>\n** %<%Y-%m %B>\n*** %<%Y-%m-%d %A>" ("%<%Y>" "%<%Y-%m %B>" "%<%Y-%m-%d %A>" "%^{Entry}\n%U\n\n%?\n%i"))
           :unnarrowed t :jump-to-captured t :empty-lines 1)))
  (org-roam-db-autosync-enable)
  (setq org-agenda-custom-commands
        (delete-dups
         (append org-agenda-custom-commands
                 `(("or1" tags "LEVEL=1"
                    ((org-agenda-files (directory-files-recursively "/home/enomem/.org/roam" "\\.org$"))
                     (org-agenda-tag-filter-preset '())))
                   ("or2" tags "LEVEL<=2"
                    ((org-agenda-files (directory-files-recursively "/home/enomem/.org/roam" "\\.org$"))
                     (org-agenda-tag-filter-preset '())))
                   ("ora" tags "LEVEL>=1"
                    ((org-agenda-files (directory-files-recursively "/home/enomem/.org/roam" "\\.org$"))
                     (org-agenda-tag-filter-preset '()))))
                 org-agenda-custom-commands)))
  :bind (:map enomem-mode-map
              ("M-o M-r" . nil)
              ("M-o M-r R" . 'org-roam-refile)
              ("M-o M-r c" . 'org-roam-capture)
              ("M-o M-r B" . 'org-roam-buffer-refresh)
              ("M-o M-r b" . 'org-roam-buffer-toggle)
              ("M-o M-r D" . 'org-roam-buffer-display-dedicated)
              ("M-o M-r d d" . 'org-roam-dailies-goto-date)
              ("M-o M-r d t" . 'org-roam-dailies-goto-today)
              ("M-o M-r n" . 'org-roam-node-find)
              ("M-o M-r g" . 'org-roam-graph)
              ("M-o M-r i" . 'org-roam-node-insert)
              ("M-o M-r a" . 'org-roam-alias-add)
              ("M-o M-r r" . 'org-roam-ref-add)
              ("M-o M-r f" . 'org-roam-ref-find)
              ("M-o M-r t" . 'org-roam-tag-add)))

;;; org-roam-ql
(use-package org-roam-ql
  :config
  (setq org-roam-directory "~/.org/roam")
  :bind (:map enomem-mode-map
              ("M-o M-r q" . 'org-roam-ql-search)))

;;; citar-org-roam
(use-package citar-org-roam
  :config
  (setq citar-org-roam-subdir "reference")
  (citar-org-roam-mode)
  (setq citar-org-roam-note-title-template "${author} - ${title}\n#+filetags: :${tags}:"))

;;; org-roam-bibtex
(use-package org-roam-bibtex
  :after (org-roam org-ref)
  :config
  (setq orb-preformat-keywords '("author" "author-abbrev" "citekey" "date" "publisher" "year"))
  (setq orb-templates
        '(("r" "reference")))
  :bind (:map org-mode-map
              ("M-o M-r A" . 'orb-note-actions)
              ("M-o M-r I" . 'orb-insert-link)))

;;; org-roam-timestamps
(use-package org-roam-timestamps)

;;; org-roam-ui
(use-package org-roam-ui
  :config
  (setq org-roam-ui-port 8080)
  :bind (:map org-mode-map
              ("M-o M-R o" . 'org-roam-ui-open)))

;;; org-drill
(use-package org-drill
  :config
  (setq org-drill-learn-fraction 0.45)
  (setq org-drill-spaced-repetition-algorithm 'sm5)
  (setq org-drill-leech-method 'skip)
  :bind (:map org-mode-map
              ("M-o M-d T" . 'org-drill-tree)
              ("M-o M-d a" . 'org-drill-again)
              ("M-o M-d c" . 'org-drill-cram)
              ("M-o M-d d" . 'org-drill)
              ("M-o M-d l" . 'org-drill-relearn-item)
              ("M-o M-d r" . 'org-drill-resume)
              ("M-o M-d D" . 'org-drill-directory)
              ("M-o M-d s" . 'org-drill-strip-all-data)
              ("M-o M-d t" . 'org-drill-test-display)))

;;; org-mobile
(use-package org-mobile
  :config
  (setq org-mobile-directory "~/.org/mobile/")
  (setq org-mobile-files '("~/.org/mobile/mobile.org" "~/.org/mobile/mobile-activity.org" "~/.org/mobile/mobile-shopping.org"))
  (setq org-mobile-inbox-for-pull "~/.org/mobile/from-mobile.org")
  (setq org-mobile-agendas 'list)
  (setq org-mobile-force-id-on-agenda-items nil)
  :bind (:map org-mode-map
              ("M-o M-m o" . org-mobile-webdav-push)
              ("M-o M-m i" . org-mobile-webdav-pull))
  :preface
  (defun org-mobile-webdav-push ()
    (interactive)
    (org-mobile-push)
    (async-shell-command "cadaver-push"))
  (defun org-mobile-webdav-pull ()
    (interactive)
    (shell-command "cadaver-pull")
    (org-mobile-pull)))

;;; org-web-tools
(use-package org-web-tools
  :bind (:map org-mode-map
              ("M-o M-o p c" . org-cleanup-pandoc-output))
  :preface
  (defun org-cleanup-pandoc-output ()
    (interactive)
    (org-web-tools--clean-pandoc-output)))

;;; enomem/en-pandoc
(use-package enomem/en-docs :load-path "site-lisp"
  :hook (org-mode . pandoc-mode))

;;; enomem/en-company
(use-package enomem/en-company :load-path "site-lisp"
  :after company
  :hook (org-mode . company-mode))

;;; enomem/en-lsp-org
(use-package enomem/en-lsp-org :load-path "site-lisp")

;;; enomem/en-yas
(use-package enomem/en-yas :load-path "site-lisp"
  :hook (org-mode . yas-minor-mode))

;;; enomem/en-edit
(use-package enomem/en-edit :load-path "site-lisp"
  :hook (org-mode . org-mode-edit-setup)
  :preface
  (defun org-mode-edit-setup ()
    (setq fill-column nil)
    (setq whitespace-line-column nil)
    (setq whitespace-style relaxed-space-whitespace-style)
    (whitespace-mode -1)
    (whitespace-mode t)))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after window-purpose
  :config
  (add-to-list 'purpose-user-mode-purposes '(org-mode . org))
  (add-to-list 'purpose-user-mode-purposes '(org-roam-mode . org-roam))
  (add-to-list 'purpose-user-mode-purposes '(org-agenda-mode . org-agenda))
  (purpose-compile-user-configuration))

(provide 'enomem/en-org)
