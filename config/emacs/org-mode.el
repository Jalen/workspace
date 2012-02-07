

;; org mode
; The following lines are always needed.  Choose your own keys.
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)

(define-key mode-specific-map [ a] 'org-agenda)

(require 'remember)

(add-hook 'remember-mode-hook 'org-remember-apply-template)

(eval-after-load "org"
  '(progn
     (define-prefix-command 'org-todo-state-map)

     (define-key org-mode-map "\C-cx" 'org-todo-state-map)

     (define-key org-todo-state-map "x"
       #'(lambda nil (interactive) (org-todo "CANCELLED")))
     (define-key org-todo-state-map "d"
       #'(lambda nil (interactive) (org-todo "DONE")))
     (define-key org-todo-state-map "f"
       #'(lambda nil (interactive) (org-todo "DEFERRED")))
     (define-key org-todo-state-map "l"
       #'(lambda nil (interactive) (org-todo "DELEGATED")))
     (define-key org-todo-state-map "s"
       #'(lambda nil (interactive) (org-todo "STARTED")))
     (define-key org-todo-state-map "w"
       #'(lambda nil (interactive) (org-todo "WAITING")))
     ))

(eval-after-load "org-agenda"
  '(progn
	 (define-key org-agenda-mode-map "\C-n" 'next-line)
     (define-key org-agenda-keymap "\C-n" 'next-line)
     (define-key org-agenda-mode-map "\C-p" 'previous-line)
     (define-key org-agenda-keymap "\C-p" 'previous-line)))

;;Below setting are only vaid in the windows systerm
(when (equal system-type 'windows-nt)
  (
   (setq org-agenda-files (list (concat DB "\\Home\\GTD\\todo.org")))

   ;;http://www.gnu.org/software/emacs/manual/html_node/emacs/Writing-Calendar-Files.html
   (setq cal-html-directory (concat DB "\\Home\\public_html"))

   (setq diary-file (concat DB  "\\Home\\diary"))

   ;;http://members.optusnet.com.au/~charles57/GTD/mydotemacs.txt
   (define-key global-map [f8] 'remember)
   (define-key global-map [f9] 'remember-region)


   (setq org-agenda-custom-commands
		 '(
		   ("P" "Projects"   
			((tags "PROJECT")))

		   ("H" "Office and Home Lists"
			((agenda)
			 (tags-todo "OFFICE")
			 (tags-todo "HOME")
			 (tags-todo "COMPUTER")
			 (tags-todo "READING")
			 (tags-todo "BLOG")
			 (tags-todo "PROJECT")
			 (tags-todo "FINANCIAL")))

		   ("F" "Office Lists"
			((agenda)
			 (tags-todo "OFFICE")
			 (tags-todo "COMPUTER")
			 (tags-todo "READING")))


		   ("M" "Home Lists"
			((agenda)
			 (tags-todo "HOME")
			 (tags-todo "COMPUTER")
			 (tags-todo "READING")))

		   ("D" "Daily Action List"
			(
			 (agenda "" ((org-agenda-ndays 1)
						 (org-agenda-sorting-strategy
						  (quote ((agenda time-up priority-down tag-up) )))
						 (org-deadline-warning-days 0)
						 ))))
		   )
		 )




   ;;(diary)


   (add-hook 'org-agenda-mode-hook 'hl-line-mode)

   (setq remember-annotation-functions '(org-remember-annotation)
		 remember-handler-functions '(org-remember-handler)
		 org-fast-tag-selection-single-key 'expert
		 org-export-html-coding-system 'utf-8
		 org-publish-use-timestamps-flag nil
		 org-todo-keyword-faces
		 '(("DONE" . (:foreground "green" :weight))
		   ("DEFERRED" . (:foreground "orange" :weight bold))
		   ("CANCELLED" . (:foreground "red" :weight bold))))



   ;;http://blog.csdn.net/meteor1113/archive/2009/07/30/4395673.aspx
   ;;http://emacser.com/org-mode.htm
   (require 'org-publish)

   ;; (setq note-root-dir (concat (getenv "dropbox") "\\home\\notes"))

   ;; (setq note-publish-dir (concat (getenv "dropbox") "\\home\\publish"))

   ;; (setq org-publish-project-alist
   ;;       `(("note-org"
   ;;          :base-directory ,note-root-dir
   ;;          :publishing-directory ,note-publish-dir
   ;;          :base-extension "org"
   ;;          :recursive t
   ;;          :publishing-function org-publish-org-to-html
   ;;          :auto-index t
   ;;          :index-filename "index.org"
   ;;          :index-title "index"
   ;;          :link-home "index.html")
   ;;         ("note-static"
   ;;          :base-directory ,note-root-dir
   ;;          :publishing-directory ,note-publish-dir
   ;;          :recursive t
   ;;          :base-extension "css//|js//|png//|jpg//|gif//|pdf//|mp3//|swf//|zip//|gz//|txt//|el"
   ;;          :publishing-function org-publish-attachment)
   ;;         ("note" :components ("note-org" "note-static")
   ;; 		 )))

   (setq org-publish-project-alist
		 '(("note-org"
			:base-directory "c:/Users/wangjiay/Documents/My DBank/home/notes"
			:publishing-directory "c:/Users/wangjiay/Documents/My DBank/home/publish"
			:base-extension "org"
			:recursive t
			:publishing-function org-publish-org-to-html
			:auto-index nil
			:index-filename "index.org"
			:index-title "index"
			:link-home "index.html"
			:section-numbers nil
			:style "<link rel=\"stylesheet\"
                 href=\".static/emacs.css\"
                 type=\"text/css\"/>")
		   ("note-static"
			:base-directory "c:/Users/wangjiay/Documents/My DBank/home/notes"
			:publishing-directory "c:/Users/wangjiay/Documents/My DBank/home/publish"
			:recursive t
			:base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|swf\\|zip\\|gz\\|txt\\|el"
			:publishing-function org-publish-attachment)
		   ("note"		 :components ("note-org" "note-static")
			:author "jiayuewang228@gmail.com"
			)))

   ;;global-set-key (kbd "<f8> p") 'org-publish)
   )
  ) ;; end of windows-nt 


(setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)
	   ))

(setq org-export-html-auto-postamble nil)
(setq org-export-html-postamble "<hr /> <p>Post by: <a href=\"http://www.cnblogs.com/jalenwang/\"><strong>Jalen Wang</strong></a> (<strong>转载请注明出处</strong>)</p>")

(setq org-agenda-include-diary nil)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)
(setq org-export-with-toc nil)


;;http://www.cnblogs.com/doveyoung/archive/2011/01/12/Emacs-17.html
;; skeleton
(define-skeleton 1exp 
  "Input #+BEGIN_EXAMPLE #+END_EXAMPLE in org-mode"
""
"#+BEGIN_EXAMPLE\n"
 _ "\n" 
"#+END_EXAMPLE"
)
 
(define-abbrev org-mode-abbrev-table "iexp" "" '1exp)

(define-skeleton 1src
  "Input #+begin_src #+end_src in org-mode"
""
"#+begin_src c++ \n"
 _ "\n"
"#+end_src"
)
 
(define-abbrev org-mode-abbrev-table "isrc" "" '1src)

;; eLisp
(defun i-babel-quote (beg end str1 str2)
  (goto-char end)
  (forward-line 1)
  (insert str2)
  (newline)
  (goto-char beg)
  (forward-line -1)
  (newline)
  (insert str1)
)

(defun iexp (St Ed)
  "Enclose example for org-mode"
  (interactive "r")
  (let ((beg St) (end Ed))
    (message "%s %s" beg end)
    (i-babel-quote beg end "#+BEGIN_EXAMPLE" "#+END_EXAMPLE")))

(defun isrc (St Ed)
  "Enclose code for org-mode"
  (interactive "r")
  (let ((beg St) (end Ed))
    (message "%s %s" beg end)
    (i-babel-quote beg end "#+begin_src " "#+end_src")))

(add-hook 'org-mode-hook 'turn-on-font-lock)
(add-hook 'org-mode-hook 
		  (lambda () (setq truncate-lines nil)))

(global-set-key "\C-cb" 'org-iswitchb)
