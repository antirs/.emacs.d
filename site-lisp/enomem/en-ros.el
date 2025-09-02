;;; rosemacs-config
(use-package rosemacs-config
  :commands invoke-rosemacs)

;;; rosemacs
(use-package rosemacs
  :config
  (global-set-key "\C-c\C-r" ros-keymap)
  :bind (:map enomem-mode-map
              ;; ros prefixes
              ("M-t r d" . nil)         ; display
              ("M-t r f" . nil)         ; find
              ("M-t r h" . nil)         ; hz
              ("M-t r k" . nil)         ; kill
              ("M-t r l" . nil)         ; launch
              ("M-t r n" . nil)         ; node
              ("M-t r p" . nil)         ; package
              ("M-t r t" . nil)         ; topic
              ("M-t r v" . nil)         ; view
              ;; ros keys
              ("M-t r c" . ros-core)
              ("M-t r d e" . rosemacs/display-event-buffer)
              ("M-t r d n" . rosemacs/display-nodes)
              ("M-t r d t" . display-ros-topic-info)
              ("M-t r f a" . 'find-ros-action)
              ("M-t r f f" . 'find-ros-file)
              ("M-t r f g" . 'ros-rgrep-package)
              ("M-t r f m" . 'find-ros-message)
              ("M-t r f s" . 'find-ros-service)
              ("M-t r h a" . add-hz-update)
              ("M-t r h r" . remove-hz-update)
              ("M-t r i" . invoke-rosemacs)
              ("M-t r k p" . 'rosemacs/kill-process-buffer)
              ("M-t r k r" . 'rosemacs/kill-and-relaunch)
              ("M-t r l c" . ros-launch-current)
              ("M-t r l l" . 'ros-launch)
              ("M-t r l o" . 'rosemacs/open-launch-file)
              ("M-t r m" . ros-make)
              ("M-t r n t" . 'rosemacs/track-nodes)
              ("M-t r p l" . ros-load-package-locations)
              ("M-t r r" . ros-run)
              ("M-t r t e" . echo-ros-topic)
              ("M-t r t i" . ros-topic-info)
              ("M-t r t t" . 'rosemacs/track-topics)
              ("M-t r v a" . 'view-ros-action)
              ("M-t r v f" . 'view-ros-file)
              ("M-t r v m" . 'view-ros-message)
              ("M-t r v s" . 'view-ros-service)))

(provide 'enomem/en-ros)
