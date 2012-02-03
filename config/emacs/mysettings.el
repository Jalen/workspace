;;(menu-bar-mode -1)
(tool-bar-mode -1)
(icomplete-mode 1)


(setq save-abbrevs t
      x-select-enable-clipboard               t
      ispell-dictionary                       "english"
      frame-title-format                      "%b %n %I @emacs@" ;; Don't remove @emacs@ which is used by AHK
      inhibit-startup-message                 t
      column-number-mode                      t
      ido-toggle-regexp                       t
      dim:switch-window-relative              nil
      default-major-mode                      'text-mode
      default-fill-column                     80
      kill-ring-save                          200
      default-tab-width                       4
      user-full-name                          "Jalen Wang"
      user-mail-address                       "jiayuewang228@gmail.com"
      global-font-lock-mode                   t	
)

(put 'dired-find-alternate-file 'disabled nil)

(setq abbrev-file-name (concat DB "\\home\\.abbrev_defs"))

(setq bookmark-file (concat DB "\\home\\.emacs.bmk"))

(setq save-abbrevs t)              ;; save abbrevs when files are saved
;; you will be asked before the abbreviations are saved

(quietly-read-abbrev-file)       ;; reads the abbreviations file on startup

(abbrev-mode 1)

(setq default-abbrev-mode t)

(read-abbrev-file)

(setq skeleton-pair t)
(local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
(local-set-key (kbd "<") 'skeleton-pair-insert-maybe)


(add-hook 'text-mode-hook 'turn-on-auto-fill)

(add-hook 'c-mode-hook
		  '(lambda ()
			 (c-set-style "k&r")))


;;c++ mode custome
(add-hook 'c++-mode-hook
		  '(lambda()
			 (c-set-style "stroustrup") ;; Set c++ style
			 (outline-minor-mode)    ;;outline mode
			 (c-toggle-auto-hungry-state 1)
			 ;;(hide-sublevels 1)
			 ))

(add-hook 'dired-mode-hook
          '(lambda ()
             (define-key dired-mode-map "e" 'wdired-change-to-wdired-mode)
             (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)))



;; Send message to let the maximinus
;;(w32-send-sys-command #xf030)


(setq tabbar-buffer-groups-function 'tabbar-buffer-ignore-groups)

;;From http://www.shellarchive.co.uk/Emacs.html
(setq dired-recursive-deletes 'top)

(setq ibuffer-never-show-predicates
	  (list "\\*Completions\\*"
			"\\*vc\\*"))

(setq undo-outer-limit 24179971)


(cua-mode)


;; Always put this here since the server address maybe have problem on some machine
(require 'server)
(when (and (= emacs-major-version 23)
           (= emacs-minor-version 2)
           (equal window-system 'w32))
  (defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
										; ~/.emacs.d/server is unsafe"
										; on windows.
(server-start)


;http://www.emacswiki.org/cgi-bin/wiki?LineNumbers
(global-linum-mode)

(setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines
          (point-min) (point-max)))))) (concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

 ;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(set-variable 'confirm-kill-emacs 'yes-or-no-p)



;; Highlight text chosen in with Mark region
(transient-mark-mode t)


(setq hippie-expand-try-functions-list
	  '(try-complete-file-name-partially
		try-complete-file-name
		try-expand-all-abbrevs
		try-expand-list
		try-expand-line
		try-expand-dabbrev
		try-expand-dabbrev-all-buffers
		try-expand-dabbrev-from-kill
		try-complete-lisp-symbol-partially
		try-complete-lisp-symbol))


 (setq warning-suppress-types nil) 

;;http://cmdblock.blog.51cto.com/415170/129235
(setq default-frame-alist 
'((height . 30) (width . 90) (menu-bar-lines . 20) (tool-bar-lines . 0)))


;; Backup stuff...
(setq backup-directory-alist `(("." . "~/.saves")))

(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

(setq-default make-backup-file t)
(setq make-backup-file t)