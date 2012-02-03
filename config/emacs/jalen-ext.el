

(defun my-todo()
  "Open todo.org"
  (interactive)
  ( find-file (concat DB "\\Home\\GTD\\todo.org")))

(defun my-emacs()
  "Open emacs.el"
  (interactive)
  ( find-file (concat DB  "\\Home\\emacs.el")))

(defun my-apps()
  "dired apps folder"
  (interactive)
  (dired (getenv "APPS")))


(defun my-dropbox()
  "dired dropbox folder"
  (interactive)
  (dired (getenv "dropbox")))


(defun my-ahk()
  "Open ahk.org"
  (interactive)
  ( find-file (concat DB "\\AppData\\ToolsMenu\\AHK.ahk")))

(defun go-home()
  "dired the home folder"
  (interactive)
  (dired (concat (getenv "dropbox") "\\home")))

(defun insert-date ()
  "Insert current date yyyy-mm-dd."
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) )
    )
  (insert (format-time-string "%Y-%m-%d"))
  )

(defun new-notes(extersion)
  (find-file (concat (getenv "dropbox") "\\home\\notes\\blog\\" (format-time-string "%Y-%m-%d") extersion))
  )

(defun take-html-notes()
	 "Take a html notes"
	 (interactive)
	 (new-notes ".html")
	 )

(defun take-org-notes()
  "Take an org note"
  (interactive)
  (new-notes ".org")
  )

(defun my-delete-frame ()
	 "Deletes the current frame. If this is the last frame, quit Emacs."
  (interactive)
	(if (cdr (frame-list))
   (delete-frame)
	 (save-buffers-kill-emacs)))
	
(defun move-line (&optional n)
  "Move current line N (1) lines up/down leaving point in place."
  (interactive "p")
	(when (null n)
   (setq n 1))
	 (let ((col (current-column)))
	(beginning-of-line)
   (next-line 1)
	 (transpose-lines n)
	(previous-line 1)
   (forward-char col)))
	 
(defun move-line-up (n)
  "Moves current line N (1) lines up leaving point in place."
  (interactive "p")
	(move-line (if (null n) -1 (- n))))
   
   (defun move-line-down (n)
	 "Moves current line N (1) lines down leaving point in place."
  (interactive "p")
	(move-line (if (null n) 1 n)))
   
   (defadvice kill-ring-save (before slickcopy activate compile)
	 "When called interactively with no active region, copy
  a single line instead."
  (interactive
	(if mark-active (list (region-beginning) (region-end))
   (list (line-beginning-position)
	 (line-beginning-position 2)))))
	
(defadvice kill-region (before slickcut activate compile)
  "When called interactively with no active region, kill
  a single line instead."
  (interactive
	(if mark-active (list (region-beginning) (region-end))
   (list (line-beginning-position)
	 (line-beginning-position 2)))))
	
(defun my-indent-or-complete ()
  "?????,??hippie-expand,???indent"
  (interactive)
	(if (looking-at "\\>")
   (hippie-expand nil)
	 (indent-for-tab-command)
  ))
  
  
  (defun tabbar-buffer-ignore-groups (buffer)
	"Return the list of group names BUFFER belongs to.
 Return only one group for each buffer."
 (with-current-buffer (get-buffer buffer)
   (cond
	 ((or (get-buffer-process (current-buffer))
	(memq major-mode
   '(comint-mode compilation-mode)))
   '("Process")
 )
 ((member (buffer-name)
   '("*scratch*" "*Messages*"))
   '("Common")
 )
 ((eq major-mode 'dired-mode)
   '("Dired")
 )
 ((memq major-mode
   '(help-mode apropos-mode Info-mode Man-mode))
   '("Help")
 )
 ((memq major-mode
   '(rmail-mode
   rmail-edit-mode vm-summary-mode vm-mode mail-mode
   mh-letter-mode mh-show-mode mh-folder-mode
   gnus-summary-mode message-mode gnus-group-mode
   gnus-article-mode score-mode gnus-browse-killed-mode))
   '("Mail")
 )
 (t
   (list
	 "default"  ;; no-grouping
  (if (and (stringp mode-name) (string-match "[^ ]" mode-name))
	mode-name
 (symbol-name major-mode)))
 )
  
)))


(defun my-org-export(arg)
  (interactive "p")
  (org-export-as-html arg 'hidden nil "c:\\temp.html")
)
