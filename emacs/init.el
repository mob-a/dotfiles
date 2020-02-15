;;;;;;;;;;;;;;;;
;; 基本設定
;;;;;;;;;;;;;;;;
(setq load-path (cons "~/.emacs.d/elisp/" load-path))

(global-set-key "\C-x\C-b" 'electric-buffer-list)
(global-set-key "\C-cg" 'goto-line)
(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\C-ci" 'string-rectangle)

(column-number-mode t) ; カーソルの位置が何文字目かを表示する
(line-number-mode t)   ; カーソルの位置が何行目かを表示する
(setq make-backup-files nil) ; バックアップファイルを作らない
(setq auto-save-default nil) ; バックアップファイルを作らない
(add-hook 'before-save-hook 'delete-trailing-whitespace) ; 末尾スペースを削除


;;;;;;;;;;;;;;;;
;; 日本語設定
;;;;;;;;;;;;;;;;
(add-hook 'shell-mode-hook(lambda () (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))) ; shellの文字化けを回避
(set-language-environment "Japanese")
(toggle-enable-multibyte-characters 1)
(set-default-coding-systems 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(prefer-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8)

;;;;;;;;;;;;;;;;
;; コーディング設定
;;;;;;;;;;;;;;;;
;; python
;; flymake
(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "/usr/local/bin/pyflakes"  (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

;; c
;; indent
(setq-default indent-tabs-mode nil)
;; flymake
(defun flymake-cc-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "g++" (list "-std=c11" "-Wall" "-Wextra" "-fsyntax-only" local-file))))

(push '("\\.c$" flymake-cc-init) flymake-allowed-file-name-masks)

(add-hook 'c-mode-hook
          '(lambda ()
             (flymake-mode t)))
