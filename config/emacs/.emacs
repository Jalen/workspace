; How to use:
;  Run "ln -s .emacs ~/.emacs" under the location of this file

;; Windows related settings
(when (equal system-type 'windows-nt)
  (progn
	(setq DB (getenv "DROPBOX"))

	(put 'upcase-region 'disabled nil)
	(custom-set-variables
	 ;; custom-set-variables was added by Custom.
	 ;; If you edit it by hand, you could mess it up, so be careful.
	 ;; Your init file should contain only one such instance.
	 ;; If there is more than one, they won't work right.
	 '(case-fold-search t)
	 '(column-number-mode t)
	 '(current-language-environment "Chinese-GB")
	 '(default-input-method "chinese-py-punct")
	 '(display-battery-mode t)
	 '(flyspell-abbrev-p "nil")
	 '(flyspell-default-delayed-commands "nil")
	 '(flyspell-default-deplacement-commands "nil")
	 '(flyspell-default-dictionary "nil")
	 '(flyspell-deplacement-commands "nil")
	 '(flyspell-dictionaries-that-consider-dash-as-word-delimiter "nil")
	 '(flyspell-duplicate-distance "nil")
	 '(flyspell-incorrect-hook "nil")
	 '(flyspell-large-region "nil")
	 '(flyspell-sort-corrections "nil")
	 '(flyspell-tex-command-regexp "nil")
	 '(flyspell-use-global-abbrev-table-p "nil")
	 '(font-lock-maximum-decoration 1)
	 '(git-baseline-alist (quote (("c:/WorkSpace/2-11-2011/" . "master"))) t)
	 '(global-font-lock-mode t nil (font-lock))
	 '(inhibit-startup-screen t)
	 '(normal-erase-is-backspace t)
	 '(org-agenda-custom-commands 
	   (quote (
			   ("d" todo #("DELEGATED" 0 9 (face org-warning)) nil) 
			   ("c" todo #("DONE|DEFERRED|CANCELLED" 0 23 (face org-warning)) nil) 
			   ("w" todo #("WAITING" 0 7 (face org-warning)) nil) 
			   ("W" agenda "" ((org-agenda-ndays 21))) 
			   ("A" agenda "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote notregexp) "\\=.*\\[#A\\]"))) (org-agenda-ndays 1) (org-agenda-overriding-header "Today's Priority #A tasks: "))) 
			   ("u" alltodo "" ((org-agenda-skip-function (lambda nil (org-agenda-skip-entry-if (quote scheduled) (quote deadline) (quote regexp) "<[^>
]+>"))) (org-agenda-overriding-header "Unscheduled TODO entries: "))))))
	 '(org-agenda-files (quote (concat DB "\\documents\\GTD\\todo.org")))
	 '(org-agenda-ndays 7)
	 '(org-agenda-show-all-dates t)
	 '(org-agenda-skip-deadline-if-done t)
	 '(org-agenda-skip-scheduled-if-done t)
	 '(org-agenda-start-on-weekday nil)
	 '(org-deadline-warning-days 14)
	 '(org-default-notes-file (concat DB "\\documents\\GTD\\notes.org"))
	 '(org-fast-tag-selection-single-key (quote expert))
	 '(org-log-done (quote (done clock-out)))
	 '(org-refile-targets (quote (("todo.org" :maxlevel . 1) ("someday.org" :level . 2))))
	 '(org-remember-store-without-prompt t)
	 '(org-reverse-note-order t)
	 '(remember-annotation-functions (quote (org-remember-annotation)))
	 '(remember-handler-functions (quote (org-remember-handler)))
	 '(safe-local-variable-values (quote ((todo-categories "Work") (todo-categories "Work" "Todo" "Todo" "Todo"))))
	 '(show-paren-mode t nil (paren))
	 '(show-paren-style (quote parenthesis))
	 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
	 '(visible-bell t))

	(custom-set-faces
	 ;; custom-set-faces was added by Custom.
	 ;; If you edit it by hand, you could mess it up, so be careful.
	 ;; Your init file should contain only one such instance.
	 ;; If there is more than one, they won't work right.
	 '(default ((t (:stipple nil :background "#102e4e" :foreground "#eeeeee" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "outline" :family "Courier New")))))

	;; See http://www.gnu.org/software/emacs/manual/html_node/elisp/Backquote.html#Backquote
	(setq org-remember-templates 
		  `(
				  (116 "* TODO %^{Brief Description} %^g\n%?\nAdded: %U" ,(concat DB "\\documents\\GTD\\todo.org") "Tasks") 
				  (110 "* %? %T" ,(concat DB "\\documents\\GTD\\notes.org") "Notes") 
				  (108 "* %? %T" ,(concat DB "\\documents\\GTD\\learning.org") "Notes") 
				  (101 "* %? %T" ,(concat DB "\\documents\\GTD\\english.org"), "Notes")))
	)
)

(add-to-list 'load-path "~/workspace/config/emacs")
(add-to-list 'load-path "~/workspace/config/lisps")

(mapc 'load (directory-files "~/workspace/config/emacs" t "^[a-zA-Z0-9].*.el$"))

(add-to-list 'load-path "~/workspace/config/lisps/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

(require 'sams-lib)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(js2-basic-offset 2)
 '(menu-bar-mode t)
 '(show-paren-mode t)
 '(ispell-dictionary "english")
 '(ispell-program-name "d:\\aspell\\bin\\aspell.exe")
)
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
