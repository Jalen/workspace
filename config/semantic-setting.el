
;;http://emacser.com/cedet.htm/comment-page-2

(setq semantic-load-turn-useful-things-on t)

(load-file "~/cedet-1.0.1/common/cedet.el")

;;(semantic-load-enable-minimum-features)
;;(semantic-load-enable-code-helpers)
;;(semantic-load-enable-guady-code-helpers)
(semantic-load-enable-excessive-code-helpers)
;;(semantic-load-enable-semantic-debugging-helpers)

;; ;; (setq semanticdb-project-roots (list (expand-file-name "/")))
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"
		"../deps/uv/include" "../deps/uv/src"))
(defconst cedet-win32-include-dirs
  (list "C:/MinGW/include"
        "C:/MinGW/include/c++/3.4.5"
        "C:/MinGW/include/c++/3.4.5/mingw32"
        "C:/MinGW/include/c++/3.4.5/backward"
        "C:/MinGW/lib/gcc/mingw32/3.4.5/include"
        "C:/Program Files/Microsoft Visual Studio/VC98/MFC/Include"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
  (when (eq system-type 'windows-nt)
    (setq include-dirs (append include-dirs cedet-win32-include-dirs)))
  (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;;跳转到函数的定义上了。如果跳不过去，那就检查一下前面配置的INCLUDE路径，
;;是不是当前文件include的所有头文件都能在INCLUDE中找到。
(global-set-key [f12] 'semantic-ia-fast-jump)

;;跳转后马上就跳回来
(global-set-key [S-f12]
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

;;在函数和声明和实现间跳转
(define-key c-mode-base-map [M-S-f12] 'semantic-analyze-proto-impl-toggle)

;;代码补全
(define-key c-mode-base-map (kbd "M-n") 'semantic-ia-complete-symbol-menu)

;;(semantic-idle-completions-mode 1)


;;;; 当输入"."或">"时，在另一个窗口中列出结构体或类的成员
(defun my-c-mode-cedet-hook ()
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert))
(add-hook 'c-mode-common-hook 'my-c-mode-cedet-hook) 

;;(global-ede-mode t)

(enable-visual-studio-bookmarks)

(require 'eassist nil 'noerror)

(define-key c-mode-base-map [M-f12] 'eassist-switch-h-cpp)

(setq eassist-header-switches
      '(("h" . ("cpp" "cxx" "c++" "CC" "cc" "C" "c" "mm" "m"))
        ("hh" . ("cc" "CC" "cpp" "cxx" "c++" "C"))
        ("hpp" . ("cpp" "cxx" "c++" "cc" "CC" "C"))
        ("hxx" . ("cxx" "cpp" "c++" "cc" "CC" "C"))
        ("h++" . ("c++" "cpp" "cxx" "cc" "CC" "C"))
        ("H" . ("C" "CC" "cc" "cpp" "cxx" "c++" "mm" "m"))
        ("HH" . ("CC" "cc" "C" "cpp" "cxx" "c++"))
        ("cpp" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("cxx" . ("hxx" "hpp" "h++" "HH" "hh" "H" "h"))
        ("c++" . ("h++" "hpp" "hxx" "HH" "hh" "H" "h"))
        ("CC" . ("HH" "hh" "hpp" "hxx" "h++" "H" "h"))
        ("cc" . ("hh" "HH" "hpp" "hxx" "h++" "H" "h"))
        ("C" . ("hpp" "hxx" "h++" "HH" "hh" "H" "h"))
        ("c" . ("h"))
        ("m" . ("h"))
        ("mm" . ("h"))))

(when (and window-system (require 'semantic-tag-folding nil 'noerror))
  (global-semantic-tag-folding-mode 1)
  (global-set-key (kbd "C-?") 'global-semantic-tag-folding-mode)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , -") 'semantic-tag-folding-fold-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-c , +") 'semantic-tag-folding-show-block)
  (define-key semantic-tag-folding-mode-map (kbd "C-_") 'semantic-tag-folding-fold-all)
  (define-key semantic-tag-folding-mode-map (kbd "C-+") 'semantic-tag-folding-show-all))

(global-semantic-stickyfunc-mode nil)
                                           

(require 'semantic-ia) 

(require 'semantic-gcc)

;; 使函数体能够折叠或展开
;; Enable source code folding
(global-semantic-tag-folding-mode 1)

 
;; Ref http://blog.csdn.net/intrepyd/article/details/4331877
;; ;; Key bindings
;; (defun my-cedet-hook ()
;;   (local-set-key [(control return)] 'semantic-ia-complete-symbol)
;;   (local-set-key "/C-c?" 'semantic-ia-complete-symbol-menu)
;;   (local-set-key "/C-cd" 'semantic-ia-fast-jump)
;;   (local-set-key "/C-cr" 'semantic-symref-symbol)
;;   (local-set-key "/C-cR" 'semantic-symref))
;; (add-hook 'c-mode-common-hook 'my-cedet-hook)

;; (autoload 'senator-try-expand-semantic "senator")
;; (setq hippie-expand-try-functions-list
;;           '(
;;               senator-try-expand-semantic
;;                    try-expand-dabbrev
;;                    try-expand-dabbrev-visible
;;                    try-expand-dabbrev-all-buffers
;;                    try-expand-dabbrev-from-kill
;;                    try-expand-list
;;                    try-expand-list-all-buffers
;;                    try-expand-line
;;         try-expand-line-all-buffers
;;         try-complete-file-name-partially
;;         try-complete-file-name
;;         try-expand-whole-kill
;;         )
;; )
