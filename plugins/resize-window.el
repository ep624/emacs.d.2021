;;; resize-window.el --- Interactively resize windows -*- lexical-binding: t; -*-
;;; Commentary:
;; Hirose Yuuji and Bob Wiener, modified by Jasonm23.
;;; Code:

(defun resize-window (&optional arg)
  "Resize window interactively.
Use h/s to heighten/shorten, w/n to widen/narrow by ARG units.
Use 1-9 to set the unit, q to quit."
  (interactive "p")
  (if (one-window-p) (error "Cannot resize sole window"))
  (or arg (setq arg 1))
  (let (c)
    (catch 'done
      (while t
        (message
         "h=heighten, s=shorten, w=widen, n=narrow (by %d);  1-9=unit, q=quit"
         arg)
        (setq c (read-char))
        (condition-case ()
            (cond
             ((= c ?h) (enlarge-window arg))
             ((= c ?s) (shrink-window arg))
             ((= c ?w) (enlarge-window-horizontally arg))
             ((= c ?n) (shrink-window-horizontally arg))
             ((= c ?\^G) (keyboard-quit))
             ((= c ?q) (throw 'done t))
             ((and (> c ?0) (<= c ?9)) (setq arg (- c ?0)))
             (t (beep)))
          (error (beep)))))
    (message "Done.")))

(provide 'resize-window)
;;; resize-window.el ends here
