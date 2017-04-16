(defun cmaher/workman ()
  "Configure evil mode for workman layout"

  ;; Remap movement keys
  (define-key evil-motion-state-map "n" 'evil-backward-char)
  (define-key evil-motion-state-map "N" 'evil-window-top) (spacemacs/set-leader-keys
    "wh" nil
    "wH" nil
    "wn" 'evil-window-left
    "wN" 'evil-window-move-far-left)

  (define-key evil-motion-state-map "e" 'evil-next-line)
  (define-key evil-motion-state-map "E" 'evil-join)
  (spacemacs/set-leader-keys
    "wj" nil
    "wJ" nil
    "we" 'evil-window-down
    "wE" 'evil-window-move-very-bottom)

  (define-key evil-normal-state-map "o" nil)
  (define-key evil-normal-state-map "O" nil)
  (define-key evil-visual-state-map "o" nil)
  (define-key evil-visual-state-map "O" nil)
  (define-key evil-motion-state-map "o" 'evil-previous-line)
  (define-key evil-motion-state-map "O" 'evil-lookup)
  (spacemacs/set-leader-keys
    "wk" nil
    "wK" nil
    "wo" 'evil-window-up
    "wO" 'evil-window-move-very-top)

  (define-key evil-normal-state-map "i" nil)
  (define-key evil-normal-state-map "I" nil)
  (define-key evil-visual-state-map "i" nil)
  (define-key evil-visual-state-map "I" nil)
  (define-key evil-motion-state-map "i" 'evil-forward-char)
  (define-key evil-motion-state-map "I" 'evil-window-bottom)
  (spacemacs/set-leader-keys
    "wl" nil
    "wL" nil
    "wi" 'evil-window-right
    "wI" 'evil-window-move-far-right)

  ;; h -> (h)ack [insert]
  (define-key evil-normal-state-map "h" 'evil-insert)
  (define-key evil-normal-state-map "H" 'evil-insert-line)
  (define-key evil-operator-state-map "h" evil-inner-text-objects-map)
  (define-key evil-visual-state-map "h" evil-inner-text-objects-map)

  ;; j -> (j)ump [next]
  (define-key evil-normal-state-map "j" nil)
  (define-key evil-normal-state-map "J" nil)
  (define-key evil-visual-state-map "j" nil)
  (define-key evil-visual-state-map "J" nil)
  (define-key evil-motion-state-map "j" 'evil-search-next)
  (define-key evil-motion-state-map "J" 'evil-search-previous)

  ;; k -> brea(k) [end]
  (define-key evil-motion-state-map "k" 'evil-forward-word-end)
  (define-key evil-motion-state-map "K" 'evil-forward-WORD-end)

  ;; l -> (l)ine [open line]
  (define-key evil-normal-state-map "l" 'evil-open-below)
  (define-key evil-normal-state-map "L" 'evil-open-above)

  (setq neo-theme 'arrow)
  (with-eval-after-load 'neotree
    (evil-define-key 'evilified neotree-mode-map "h" nil)
    (evil-define-key 'evilified neotree-mode-map "j" nil)
    (evil-define-key 'evilified neotree-mode-map "k" nil)
    (evil-define-key 'evilified neotree-mode-map "l" nil)
    (evil-define-key 'evilified neotree-mode-map "n" 'spacemacs/neotree-collapse-or-up)
    (evil-define-key 'evilified neotree-mode-map "e" 'neotree-next-line)
    (evil-define-key 'evilified neotree-mode-map "o" 'neotree-previous-line)
    (evil-define-key 'evilified neotree-mode-map "i" 'spacemacs/neotree-expand-or-open)
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
  (define-key evil-lisp-state-map "n" 'sp-backward-symbol)
  (define-key evil-lisp-state-map "N" 'sp-backward-sexp)

  (define-key evil-lisp-state-map "e" 'lisp-state-next-closing-paren)
  (define-key evil-lisp-state-map "E" 'sp-forward-sexp)

  (define-key evil-lisp-state-map "o" 'lisp-state-prev-opening-paren)
  (define-key evil-lisp-state-map "O" 'sp-forward-sexp)

  (define-key evil-lisp-state-map "i" 'lisp-state-forward-symbol)
  (define-key evil-lisp-state-map "I" 'sp-forward-sexp)

  (define-key evil-lisp-state-map "h" 'evil-insert-state)
  (define-key evil-lisp-state-map "H" 'evil-insert-line)

  (define-key evil-lisp-state-map "k" 'sp-splice-sexp-killing-forward)
  (define-key evil-lisp-state-map "K" 'sp-splice-sexp-killing-backward)

  (define-key evil-lisp-state-map "j" nil)
  (define-key evil-lisp-state-map "J" nil)
  (define-key evil-lisp-state-map "l" nil)
  (define-key evil-lisp-state-map "L" nil)


  (spacemacs/set-leader-keys
    "K" 'lisp-state-toggle-lisp-state
    )
  )

(defun cmaher/init-all ()
  (cmaher/workman)
  (cmaher/projectile)
  (cmaher/javascript)
  (cmaher/indent)
  (cmaher/lisp-state)
  )
