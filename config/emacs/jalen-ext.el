

(defun my-todo()
  "Open todo.org"
  (interactive)
  ( find-file (concat (getenv "dropbox") "\\documents\\GTD\\todo.org")))

(defun my-emacs()
  "Open emacs.el"
  (interactive)
  ( find-file (concat (getenv "dropbox")  "\\documents\\emacs.el")))

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
  ( find-file (concat (getenv "dropbox") "\\AppData\\ToolsMenu\\AHK.ahk")))

(defun insert-date ()
  "Insert current date yyyy-mm-dd."
  (interactive)
  (when (region-active-p)
    (delete-region (region-beginning) (region-end) )
    )
  (insert (format-time-string "%Y-%m-%d"))
  )

(defun new-notes(extersion)
  (if (equal system-type 'gnu/linux) 
	  (find-file (concat "~/Dropbox/doc/notes/blog/" (format-time-string "%Y-%m-%d") extersion))
	(find-file (concat (getenv "dropbox") "\\documents\\notes\\blog\\" (format-time-string "%Y-%m-%d") extersion))
   )
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
  (insert "#+TITLE: ReadingNotes@02-12-2013
#+CATEGORIES: ReadingNotes
")
  )

(defun my-delete-frame ()
	 "Deletes the current frame. If this is the last frame, quit Emacs."
  (interactive)
	(if (cdr (frame-list))
   (delete-frame)
	 (save-buffers-kill-emacs)))
	   
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


(defun bf-pretty-print-xml-region (begin end)
  "Pretty format XML markup in region. You need to have nxml-mode
http://www.emacswiki.org/cgi-bin/wiki/NxmlMode installed to do
this.  The function inserts linebreaks to separate tags that have
nothing but whitespace between them.  It then indents the markup
by using nxml's indentation rules."
  (interactive "r")
  (save-excursion
      (nxml-mode)
      (goto-char begin)
      (while (search-forward-regexp "\>[ \\t]*\<" nil t) 
        (backward-char) (insert "\n"))
      (indent-region begin end))
    (message "Ah, much better!"))