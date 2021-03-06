(defun require-extensions (action lst)
  ""
  (mapcar (lambda(ext) "" (funcall action ext)) lst))

(require-extensions 'require
 (list 
  'tabbar
  'ibuffer
  'smart-tab
  ;; 'graphviz-dot-mode
  ;; 'switch-window
  ;; 'thing-edit
  ;; 'second-sel
  ;; 'browse-kill-ring+
  ;; 'bbdb
  ;; 'gnuplot
  ;; 'muse-mode
  ;; 'ibuffer
  ;; 'w3m-load
  ;; 'rect-mark
  ;; 'ido
  ;; 'multi-term
  ;; 'lusty-explorer
  ;; 'oddmuse
  ;; 'emaci
  ;; 'move-text
  ;; 'uniquify
  ;; 'hide-region
))

(tabbar-mode 1)

(global-smart-tab-mode 1)
		  
(load "desktop")
(desktop-save-mode 1)


; Add htmlize
(require 'htmlize)

;;(require 'graphviz-dot-mode)
(load-file "~/workspace/config/lisps/graphviz-dot-mode.el")

(autoload 'graphviz-dot-mode "dot" "Edit Dot scripts." t)
(add-to-list 'auto-mode-alist '("\\.dot$" . graphviz-dot-mode))


;;(add-to-list 'load-path "~/workspace/config/lisps/git-emacs")
;;(require 'git-emacs)

;;http://www.emacswiki.org/cgi-bin/wiki/InteractivelyDoThings
(require 'ido)
(ido-mode t)

(autoload 'dos-mode "dos" "Edit Dos scripts." t)
(add-to-list 'auto-mode-alist '("\\.bat$" . dos-mode))

;;run this command 
;; emacs --batch --eval '(byte-compile-file "js2-20080616a.el")'
;;to byte-compile
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(autoload #'espresso-mode "espresso" "Start espresso-mode" t)
;(add-to-list 'auto-mode-alist '("\\.js$" . espresso-mode))
(add-to-list 'auto-mode-alist '("\\.json$" . espresso-mode))


;; -----------------------------------------------------------------------------
;; Git support 
;; -----------------------------------------------------------------------------
; http://parijatmishra.wordpress.com/2008/09/06/up-and-running-with-emacs-and-git/
;;(load "/usr/share/doc/git-core/contrib/emacs/git.el")
;;(load "/usr/share/doc/git-core/contrib/emacs/git-blame.el")
;;(add-to-list 'vc-handled-backends 'GIT)

(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.text" . markdown-mode) auto-mode-alist))

; http://www.cnblogs.com/csophys/archive/2012/11/16/2773812.html
; 首先下载了插件以后（下载链接） ，安装好,填写博客地址，账号密码信息。
; 然后打开一个需要发文的org文件，打开cnblogs插件的minor模式(M-x cnblogs-minor-mode)。
; 然后使用快捷键C-c c p 就发送成功了，相当的方便。删除，更新博文也是同样类似的操作。
(require 'cnblogs)

(when (equal system-type 'gnu/linux)
  (require 'android-mode)
)