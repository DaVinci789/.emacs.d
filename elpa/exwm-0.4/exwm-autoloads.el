;;; exwm-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "exwm" "exwm.el" (22223 8291 745926 793000))
;;; Generated autoloads from exwm.el

(autoload 'exwm-reset "exwm" "\
Reset window to standard state: non-fullscreen, line-mode.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "exwm-floating" "exwm-floating.el" (22223 8291
;;;;;;  745926 793000))
;;; Generated autoloads from exwm-floating.el

(autoload 'exwm-floating-toggle-floating "exwm-floating" "\
Toggle the current window between floating and non-floating states.

\(fn)" t nil)

(autoload 'exwm-floating-hide "exwm-floating" "\
Hide the current floating X window (which would show again when selected).

\(fn)" t nil)

;;;***

;;;### (autoloads nil "exwm-input" "exwm-input.el" (22223 8291 742593
;;;;;;  409000))
;;; Generated autoloads from exwm-input.el

(autoload 'exwm-input-grab-keyboard "exwm-input" "\
Switch to line-mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-release-keyboard "exwm-input" "\
Switch to char-mode.

\(fn &optional ID)" t nil)

(autoload 'exwm-input-send-next-key "exwm-input" "\
Send next key to client window.

\(fn TIMES)" t nil)

(autoload 'exwm-input-send-simulation-key "exwm-input" "\
Fake a key event according to last input key sequence.

\(fn TIMES)" t nil)

;;;***

;;;### (autoloads nil "exwm-layout" "exwm-layout.el" (22223 8291
;;;;;;  749260 178000))
;;; Generated autoloads from exwm-layout.el

(autoload 'exwm-layout-set-fullscreen "exwm-layout" "\
Make window ID fullscreen.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-unset-fullscreen "exwm-layout" "\
Restore window from fullscreen state.

\(fn &optional ID)" t nil)

(autoload 'exwm-layout-enlarge-window "exwm-layout" "\
Make the selected window DELTA pixels taller.

If no argument is given, make the selected window one pixel taller.  If the
optional argument HORIZONTAL is non-nil, make selected window DELTA pixels
wider.  If DELTA is negative, shrink selected window by -DELTA pixels.

Normal hints are checked and regarded if the selected window is displaying an
`exwm-mode' buffer.  However, this may violate the normal hints set on other X
windows.

\(fn DELTA &optional HORIZONTAL)" t nil)

(autoload 'exwm-layout-enlarge-window-horizontally "exwm-layout" "\
Make the selected window DELTA pixels wider.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-shrink-window "exwm-layout" "\
Make the selected window DELTA pixels lower.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-shrink-window-horizontally "exwm-layout" "\
Make the selected window DELTA pixels narrower.

See also `exwm-layout-enlarge-window'.

\(fn DELTA)" t nil)

(autoload 'exwm-layout-hide-mode-line "exwm-layout" "\
Hide mode-line.

\(fn)" t nil)

(autoload 'exwm-layout-show-mode-line "exwm-layout" "\
Show mode-line.

\(fn)" t nil)

(autoload 'exwm-layout-toggle-mode-line "exwm-layout" "\
Toggle the display of mode-line.

\(fn)" t nil)

;;;***

;;;### (autoloads nil "exwm-workspace" "exwm-workspace.el" (22223
;;;;;;  8291 745926 793000))
;;; Generated autoloads from exwm-workspace.el

(autoload 'exwm-workspace--current-width "exwm-workspace" "\
Return the width of current workspace.

\(fn)" nil nil)

(autoload 'exwm-workspace--current-height "exwm-workspace" "\
Return the height of current workspace.

\(fn)" nil nil)

(autoload 'exwm-workspace--minibuffer-own-frame-p "exwm-workspace" "\
Reports whether the minibuffer is displayed in its own frame.

\(fn)" nil nil)

(autoload 'exwm-workspace--resize-minibuffer-frame "exwm-workspace" "\
Resize minibuffer (and its container) to fit the size of workspace.

If WIDTH and HEIGHT of the workspace is not specified, they're get from the
workspace frame.

\(fn &optional WIDTH HEIGHT)" nil nil)

(autoload 'exwm-workspace-switch "exwm-workspace" "\
Switch to workspace INDEX. Query for INDEX if it's not specified.

The optional FORCE option is for internal use only.

\(fn INDEX &optional FORCE)" t nil)

(autoload 'exwm-workspace-move-window "exwm-workspace" "\
Move window ID to workspace INDEX.

\(fn INDEX &optional ID)" t nil)

(autoload 'exwm-workspace-switch-to-buffer "exwm-workspace" "\
Make the current Emacs window display another buffer.

\(fn BUFFER-OR-NAME)" t nil)

;;;***

;;;### (autoloads nil nil ("exwm-config.el" "exwm-core.el" "exwm-manage.el"
;;;;;;  "exwm-pkg.el" "exwm-randr.el" "exwm-systemtray.el") (22223
;;;;;;  8291 745926 793000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; exwm-autoloads.el ends here
