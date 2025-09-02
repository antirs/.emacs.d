;;; dependencies
(use-package hydra)

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
