(let ((print-escape-newlines t)
      (s (progn (find-file "do-evil.el")
                (read (current-buffer))))
      (template (progn (find-file "mimic-template.el")
                (buffer-string))))
  (with-temp-buffer
    (insert (format template s))
    (write-region (point-min) (point-max) "mimic.el")))
