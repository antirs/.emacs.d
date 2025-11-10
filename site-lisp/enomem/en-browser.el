;;; dependencies
(use-package hydra)

;;; url-vars
(use-package url-vars
  :config
  (setq url-mime-encoding-string "gzip")
  (setq url-mime-charset-string "utf-8;q=1, gb2312;q=0.5, iso-8859-1;q=0.5, big5;q=0.5, iso-2022-jp;q=0.5, shift_jis;q=0.5, euc-tw;q=0.5, euc-jp;q=0.5, euc-jis-2004;q=0.5, euc-kr;q=0.5, us-ascii;q=0.5, utf-7;q=0.5, hz-gb-2312;q=0.5, big5-hkscs;q=0.5, gbk;q=0.5, gb18030;q=0.5, iso-8859-5;q=0.5, koi8-r;q=0.5, koi8-u;q=0.5, cp866;q=0.5, koi8-t;q=0.5, windows-1251;q=0.5, cp855;q=0.5, iso-8859-2;q=0.5, iso-8859-3;q=0.5, iso-8859-4;q=0.5, iso-8859-9;q=0.5, iso-8859-10;q=0.5, iso-8859-13;q=0.5, iso-8859-14;q=0.5, iso-8859-15;q=0.5, windows-1250;q=0.5, windows-1252;q=0.5, windows-1254;q=0.5, windows-1257;q=0.5, cp775;q=0.5, cp850;q=0.5, cp852;q=0.5, cp857;q=0.5, cp858;q=0.5, cp860;q=0.5, cp861;q=0.5, cp863;q=0.5, cp865;q=0.5, cp437;q=0.5, macintosh;q=0.5, next;q=0.5, hp-roman8;q=0.5, adobe-standard-encoding;q=0.5, iso-8859-16;q=0.5, iso-8859-7;q=0.5, windows-1253;q=0.5, cp737;q=0.5, cp851;q=0.5, cp869;q=0.5, iso-8859-8;q=0.5, windows-1255;q=0.5, cp862;q=0.5, iso-2022-jp-2004;q=0.5, cp874;q=0.5, iso-8859-11;q=0.5, viscii;q=0.5, windows-1258;q=0.5, iso-8859-6;q=0.5, windows-1256;q=0.5, iso-2022-cn;q=0.5, iso-2022-cn-ext;q=0.5, iso-2022-jp-2;q=0.5, iso-2022-kr;q=0.5, utf-16le;q=0.5, utf-16be;q=0.5, utf-16;q=0.5, x-ctext;q=0.5"))

;;; browse-url
(use-package browse-url
  :init
  (setq browse-url-browser-function 'w3m-goto-url-new-session)
  (make-variable-buffer-local 'browse-url-browser-function)
  :config
  (setq browse-url-chromium-arguments
        '("--disable-webgl"
          "--disk-cache-dir=/tmp"
          "--disk-cache-size=1"
          "--js-flags='--jitless'"
          "--no-sandbox"
          "--proxy-server='socks://127.0.0.1:9050'"))
  (setq browse-url-firefox-program "/home/enomem/.local/bin/tor-firefox")
  (setq browse-url-firefox-new-window-is-tab t)
  :bind (:map enomem-mode-map
              ("M-u M-u c" . browse-url-chromium)
              ("M-u M-u f" . browse-url-firefox)))

;;; eww
(use-package eww
  :config
  (setq eww-search-prefix
        "file:///home/enomem/docs/hyperspec-docs/HyperSpec/Front/Help.htm#")
  :bind (:map enomem-mode-map
              ("M-u c e o" . 'eww-open-file)))

;;; w3m
(use-package w3m
  :config
  (setq w3m-command "torify-w3m")
  (setq w3m-confirm-leaving-secure-page nil)
  (setq w3m-profile-directory "~/.emacs.d/.w3m")
  :hook (w3m-mode . en-browser/w3m-mode-setup)
  :bind (:map enomem-mode-map
              ("M-u c w o" . 'w3m-find-file))
  :preface
  (defun en-browser/w3m-mode-setup ()
    (setq browse-url-browser-function 'browse-url-chromium)))

;;; engine-mode
(use-package engine-mode
  :config
  (engine-mode t)
  (setq engine/browser-function 'w3m-browse-url)
  (defengine duckduckgo
    "https://duckduckgo.com/html?q=%s"
    :keybinding "d")
  (defengine flibusta
    "http://flibustahezeous3.onion/booksearchask=%s"
    :keybinding "f")
  (defengine gentoo
    (concat "https://bugs.gentoo.org/buglist.cgi?bug_status=UNCONFIRMED&"
            "bug_status=CONFIRMED&bug_status=IN_PROGRESS&bug_status=RESOLVED&"
            "bug_status=VERIFIED&f0=OP&f1=OP&f2=alias&f3=short_desc&f4=CP&"
            "f5=CP&j1=OR&list_id=4009822&o2=substring&o3=substring&"
            "order=bug_id DESC&query_format=advanced&v2=%s&v3=%s")
    :keybinding "g")
  (defengine google
    "https://google.com/search?q=%s"
    :keybinding "s")
  (defengine librusec
    "https://gen.lib.rus.ec/search.php?req=%s"
    :keybinding "l")
  (defengine multitran-en2ru
    "https://www.multitran.com/m.exe?s=%s&l1=1&l2=2"
    :keybinding "e")
  (defengine multitran-ru2en
    "https://www.multitran.com/m.exe?s=%s&l2=1&l1=2"
    :keybinding "r"))

;;; enomem/en-emacs
(use-package enomem/en-emacs :load-path "site-lisp"
  :after hydra
  :config
  (defhydra engine-mode-hydra ()
    "Engine mode"
    ("du" engine/search-duckduckgo "duckduckgo")
    ("fl" engine/search-flibusta "flibusta")
    ("ge" engine/search-gentoo "gentoo")
    ("go" engine/search-google "google")
    ("li" engine/search-librusec "librusec")
    ("me" engine/search-multitran-en2ru "multitran-en2ru")
    ("mr" engine/search-multitran-ru2en "multitran-ru2en")))

(provide 'enomem/en-browser)
