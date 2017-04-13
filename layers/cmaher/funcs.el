(defun cmaher/workman ()
  "Configure evil mode for workman layout"

  ;; Remap movement keys
  (define-key evil-motion-state-map (kbd "n") 'evil-backward-char)
  (define-key evil-motion-state-map (kbd "N") 'evil-window-top) (spacemacs/set-leader-keys
    "wh" nil
    "wH" nil
    "wn" 'evil-window-left
    "wN" 'evil-window-move-far-left)

  (define-key evil-motion-state-map (kbd "e") 'evil-next-line)
  (define-key evil-motion-state-map (kbd "E") 'evil-join)
  (spacemacs/set-leader-keys
    "wj" nil
    "wJ" nil
    "we" 'evil-window-down
    "wE" 'evil-window-move-very-bottom)

  (define-key evil-normal-state-map (kbd "o") nil)
  (define-key evil-normal-state-map (kbd "O") nil)
  (define-key evil-visual-state-map (kbd "o") nil)
  (define-key evil-visual-state-map (kbd "O") nil)
  (define-key evil-motion-state-map (kbd "o") 'evil-previous-line)
  (define-key evil-motion-state-map (kbd "O") 'evil-lookup)
  (spacemacs/set-leader-keys
    "wk" nil
    "wK" nil
    "wo" 'evil-window-up
    "wO" 'evil-window-move-very-top)

  (define-key evil-normal-state-map (kbd "i") nil)
  (define-key evil-normal-state-map (kbd "I") nil)
  (define-key evil-visual-state-map (kbd "i") nil)
  (define-key evil-visual-state-map (kbd "I") nil)
  (define-key evil-motion-state-map (kbd "i") 'evil-forward-char)
  (define-key evil-motion-state-map (kbd "I") 'evil-window-bottom)
  (spacemacs/set-leader-keys
    "wl" nil
    "wL" nil
    "wi" 'evil-window-right
    "wI" 'evil-window-move-far-right)

  ;; h -> (h)ack [insert]
  (define-key evil-normal-state-map (kbd "h") 'evil-insert)
  (define-key evil-normal-state-map (kbd "H") 'evil-insert-line)
  (define-key evil-operator-state-map (kbd "h") evil-inner-text-objects-map)
  (define-key evil-visual-state-map (kbd "h") evil-inner-text-objects-map)

  ;; j -> (j)ump [next]
  (define-key evil-normal-state-map (kbd "j") nil)
  (define-key evil-normal-state-map (kbd "J") nil)
  (define-key evil-visual-state-map (kbd "j") nil)
  (define-key evil-visual-state-map (kbd "J") nil)
  (define-key evil-motion-state-map (kbd "j") 'evil-search-next)
  (define-key evil-motion-state-map (kbd "J") 'evil-search-previous)

  ;; k -> brea(k) [end]
  (define-key evil-motion-state-map (kbd "k") 'evil-forward-word-end)
  (define-key evil-motion-state-map (kbd "K") 'evil-forward-WORD-end)

  ;; l -> (l)ine [open line]
  (define-key evil-normal-state-map (kbd "l") 'evil-open-below)
  (define-key evil-normal-state-map (kbd "L") 'evil-open-above)

  (setq neo-theme 'arrow)
  (with-eval-after-load 'neotree
    (evil-define-key 'evilified neotree-mode-map (kbd "h") nil)
    (evil-define-key 'evilified neotree-mode-map (kbd "j") nil)
    (evil-define-key 'evilified neotree-mode-map (kbd "k") nil)
    (evil-define-key 'evilified neotree-mode-map (kbd "l") nil)
    (evil-define-key 'evilified neotree-mode-map (kbd "n") 'spacemacs/neotree-collapse-or-up)
    (evil-define-key 'evilified neotree-mode-map (kbd "e") 'neotree-next-line)
    (evil-define-key 'evilified neotree-mode-map (kbd "o") 'neotree-previous-line)
    (evil-define-key 'evilified neotree-mode-map (kbd "i") 'spacemacs/neotree-expand-or-open)
    )
  )

(defun cmaher/projectile ()
  (setq
   projectile-indexing-method 'alien
   projectile-enable-caching t)
  )

(defun cmaher/javascript ()
  (with-eval-after-load 'js2-mode
    (setq-default
     js2-basic-offset 2
     js2-indent-level 2
     css-indent-offset 2
     web-mode-markup-indent-offset 2
     web-mode-css-indent-offset 2
     web-mode-code-indent-offset 2
     web-mode-attr-indent-offset 4
     )
    )
  )

(defun cmaher/indent ()
  (setq
   standard-indent 2
   tab-width 2
   indent-tabs-mode nil
   tab-stop-list (number-sequence 4 200 4)
   )
  )

(defun cmaher/tab-expand (abbrev)
  (interactive "P")
  (if (thing-at-point 'word)
      (hippie-expand abbrev)
      (insert (kbd "TAB")))
  )

(defun cmaher/auto-complete ()
  (global-set-key (kbd "TAB") 'cmaher/tab-expand)

  (with-eval-after-load 'auto-complete
    (setq-default
     tab-always-indent t
     )
    (setq-default
     dotspacemacs-configuration-layers
     '(auto-completion :variables
                       auto-completion-tab-key-behavior nil))
    )
  )

(defun cmaher/lisp-state ()
  (spacemacs/set-leader-keys
    "K" 'lisp-state-toggle-lisp-state)
  ;; (spacemacs/set-leader-keys-for-major-mode 'evil-lisp-state
  ;;   ""
  ;;   )
  )

(defun cmaher/init-all ()
  (cmaher/workman)
  (cmaher/projectile)
  (cmaher/javascript)
  (cmaher/indent)
  (cmaher/auto-complete)
  (cmaher/lisp)
  )
