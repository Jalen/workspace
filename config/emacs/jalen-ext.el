

(defun my-todo()
  "Open todo.org"
  (interactive)
  ( find-file "p:\\Home\\GTD\\todo.org"))

(defun my-emacs()
  "Open emacs.el"
  (interactive)
  ( find-file "p:\\Home\\emacs.el"))

(defun my-org-export()
  "Export the active org as html"
  (interactive)
  (org-export-as-html-and-open 1))

(defun my-dropbox()
  "dired dropbox folder"
  (interactive)
  (dired (getenv "dropbox")))


(defun my-ahk()
  "Open ahk.org"
  (interactive)
  ( find-file "p:\\AppData\\ToolsMenu\\AHK.ahk"))




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


(defun my-swith-to-scratch()
  "Deletes the current frame. If this is the last frame, quit Emacs."
  (interactive)
  (switch-to-buffer "scratch"))
