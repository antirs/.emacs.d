;;; enomem/en-keys
(use-package enomem/en-keys :load-path "site-lisp" :defer t
  :bind (:map enomem-mode-map
              ;; prefixes ;;
              ;; completion
              ;; ("C-M-i" . nil)          ; completion prefix
              ;; ("C-M-_" . nil)          ; completion prefix
              ;; package/tool prefixes
              ("M-o" . nil)            ; org prefix
              ("M-t" . nil)            ; tool prefix
              ("M-u" . nil)            ; universal prefix
              ;; user prefixes
              ("M-g" . nil)            ; user prefix
              ;; prog prefixes
              ("M-c" . nil)            ; compile prefix
              ("M-i" . nil)            ; interactive/shell/environment prefix
              ("M-r" . nil)            ; run/debug prefix
              ("M-s" . nil)            ; source/code prefix
              ;; org prefixes
              ("M-o C-c" . nil)        ; org column prefix
              ("M-o M-a" . nil)        ; org agenda prefix
              ("M-o M-b" . nil)        ; org babel prefix
              ("M-o M-c" . nil)        ; org capture prefix
              ("M-o M-d" . nil)        ; org drill prefix
              ("M-o M-l" . nil)        ; org link prefix
              ("M-o M-m" . nil)        ; org mobile prefix
              ("M-o M-p" . nil)        ; org pandoc prefix
              ("M-o M-t" . nil)        ; org time prefix
              ("M-o c" . nil)          ; org clock prefix
              ("M-o t" . nil)          ; org table prefix
              ("M-o M-h" . nil)        ; org highlight
              ;; completion prefixes
              ("M-i M-i" . nil)
              ;; tool prefix
              ("M-t D" . nil)          ; docker prefix
              ("M-t M-t" . nil)        ; treemacs prefix
              ("M-t c" . nil)          ; counsel prefix
              ("M-t d" . nil)          ; dictionary prefix
              ("M-t g" . nil)          ; gnus prefix
              ("M-t h" . nil)          ; hydra prefix
              ("M-t r" . nil)          ; ros prefix
              ("M-t t" . nil)          ; treemacs prefix
              ;; universal prefixes
              ("M-u M-'" . nil)        ; bookmark prefix
              ("M-u M-b" . nil)        ; buffer prefix
              ("M-u M-d" . nil)        ; dired prefix
              ("M-u M-e" . nil)        ; edit prefix
              ("M-u M-f" . nil)        ; file prefix
              ("M-u M-g" . nil)        ; goto prefix
              ("M-u M-h" . nil)        ; emacs help prefix
              ("M-u M-i" . nil)        ; input prefix
              ("M-u M-m" . nil)        ; man prefix
              ("M-u M-p" . nil)        ; purpose prefix
              ("M-u M-s" . nil)        ; swiper prefixes
              ("M-u M-u" . nil)        ; browser prefixes
              ("M-u M-w" . nil)        ; window prefix
              ("M-u M-x" . nil)        ; hex prefixes
              ("M-u M-y" . nil)        ; yas prefixes
              ;; edit prefixes
              ("M-u M-e M-e" . nil)    ; expand prefix
              ("M-u M-e m" . nil)      ; multiline prefix
              ("M-u M-e w" . nil)      ; whitespace prefix
              ;; user prefixes
              ("M-g M-d" . nil)        ; docs prefix
              ("M-g M-h" . nil)        ; hs prefix
              ("M-g M-i" . nil)        ; info prefix
              ;; compile/run prefix
              ("M-c C" . nil)          ; cmake-ide prefix
              ("M-c c" . nil)          ; cmake prefix
              ("M-c m" . nil)          ; meson prefix
              ("M-c p" . nil)          ; preview prefix
              ("M-c t" . nil)          ; tex prefix
              ;; interactive/shell/environment prefixes
              ("M-i M-e" . nil)         ; elisp ielm prefix
              ("M-i M-i" . nil)         ; emamux prefix
              ("M-i M-l" . nil)         ; lisp prefix
              ("M-i M-p" . nil)         ; python prefix
              ("M-i M-s" . nil)         ; shell prefix
              ("M-i e" . nil)           ; eval prefix
              ("M-i s" . nil)           ; send prefix
              ;; run/debug prefixes
              ("M-r M-d" . nil)         ; debug prefix
              ("M-r M-n" . nil)         ; next prefix
              ("M-r M-p" . nil)         ; previous prefix
              ("M-r M-r" . nil)         ; realgud prefix
              ;; dap prefixes
              ("M-r d" . nil)           ; dap prefix
              ;; source/code prefixes
              ("M-s ," . nil)           ; semantic prefix
              ("M-s c" . nil)           ; cscope prefix
              ("M-s e" . nil)           ; expand prefix
              ("M-s f" . nil)           ; format prefix
              ("M-s g" . nil)           ; ggtags prefix
              ("M-s h" . nil)           ; help prefix
              ("M-s M-F" . nil)         ; flymake prefix
              ("M-s M-a" . nil)         ; anaconda prefix
              ("M-s M-c" . nil)         ; ccls prefix
              ("M-s M-e" . nil)         ; eglot prefix
              ("M-s M-f" . nil)         ; flycheck prefix
              ("M-s M-g" . nil)         ; magit prefix
              ("M-s M-h" . nil)         ; help prefix
              ("M-s M-i" . nil)         ; irony prefix
              ("M-s M-l" . nil)         ; lsp prefix
              ("M-s M-n" . nil)         ; next prefix
              ("M-s M-p" . nil)         ; previous prefix
              ("M-s M-r" . nil)         ; rtags prefix
              ("M-s M-s" . nil)         ; search prefix
              ("M-s M-x" . nil)         ; xref prefix
              ("M-s M-y" . nil)         ; yas prefix
))

(provide 'enomem/en-keys)
