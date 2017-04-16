;;; arcadia.el --- Clojure + Unity + Emacs!

(defcustom unity-repl-command "ruby repl-client.rb"
  "Command to use for arcadia-repl.")

(defcustom unity-repl-command-path "Assets/Arcadia/Editor"
  "Launch the REPL command in this relative path.")

(defun unity-root-p (dir)
  "Is this DIR the root of a Unity project?"
  (-any? (lambda (f)
           ;; TODO: Maybe this could be better?
           (string-equal f "ProjectSettings"))
         (directory-files dir)))

(defun unity-find-root (start levels)
  "Look upwards from the START directory to find the Unity root directory
and return its full path. Search for the number of LEVELS specified."
  (cond ((= levels 0) nil)
        ((unity-root-p start) start)
        (t (unity-find-root
            (expand-file-name ".." start) (- levels 1)))))

(defun unity-jack-in ()
  "Start the Arcadia REPL"
  (interactive)
  (let ((default-directory
          (concat (unity-find-root default-directory 10) "/"
                  unity-repl-command-path "/")))
    (run-lisp unity-repl-command)))

(defun unity-eval (start end)
  (append-to-buffer (get-buffer "*inferior-lisp*") start end)
  (let ((codebuf (current-buffer)))
    (switch-to-buffer-other-window "*inferior-lisp*")
    (execute-kbd-macro "\C-m")
    (switch-to-buffer-other-window codebuf)))

(defun unity-eval-line ()
  (interactive)
  (unity-eval (line-beginning-position) (line-end-position)))

(defun unity-eval-buffer ()
  (interactive)
  (unity-eval (point-min) (point-max)))

(defun unity-eval-region (start end)
  (interactive "r")
  (unity-eval start end))
