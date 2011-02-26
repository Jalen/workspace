;;http://www.emacswiki.org/emacs/KeyboardMacros

(defun toggle-kbd-macro-recording-on ()
  "One-key keyboard macros: turn recording on."
  (interactive)
  (define-key
	global-map
	(this-command-keys);;'[(shift f1)]
	'toggle-kbd-macro-recording-off)
  (start-kbd-macro nil))

(defun toggle-kbd-macro-recording-off ()
  "One-key keyboard macros: turn recording off."
  (interactive)
  (define-key
	global-map
	(this-command-keys) ;;'[(shift f1)]
	'toggle-kbd-macro-recording-on)
  (end-kbd-macro))

(global-set-key '[(f1)]          'call-last-kbd-macro)
(global-set-key '[(shift f1)]    'toggle-kbd-macro-recording-on)