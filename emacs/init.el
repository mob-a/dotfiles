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
(setq require-final-newline t) ; ファイルの最後に改行を入れる
(menu-bar-mode -1) ; メニューバーを消す

(load-theme 'tsdh-dark t) ; theme
(set-face-background 'default "black") ; 背景色は黒

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
;;; python
;; curl https://raw.githubusercontent.com/purcell/flymake-python-pyflakes/master/flymake-python-pyflakes.el > ~/.emacs.d/elisp/flymake-python-pyflakes.el
;; curl https://raw.githubusercontent.com/purcell/flymake-easy/master/flymake-easy.el > ~/.emacs.d/elisp/flymake-easy.el
;; curl https://raw.githubusercontent.com/fujimisakari/py-autopep8.el/master/py-autopep8.el > ~/.emacs.d/elisp/py-autopep8.el
;; pip3 install --user flake8 autopep8
; (require 'flymake-python-pyflakes)
; (add-hook 'python-mode-hook 'flymake-python-pyflakes-load)
; (setq flymake-python-pyflakes-executable "~/.local/bin/flake8")
; (custom-set-variables '(flymake-python-pyflakes-extra-arguments (quote ("--max-line-length=160" "--ignore=I100,I101,I201,I202"))))
; (require 'py-autopep8)
; (add-hook 'python-mode-hook (lambda () (define-key python-mode-map (kbd "C-c f") 'py-autopep8)))
; (setq py-autopep8-options '("--max-line-length=160"))

;;; c
;; indent
;(setq-default indent-tabs-mode nil)
;; flymake
;(defun flymake-cc-init ()
;  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
;                       'flymake-create-temp-inplace))
;         (local-file  (file-relative-name
;                       temp-file
;                       (file-name-directory buffer-file-name))))
;    (list "g++" (list "-std=c11" "-Wall" "-Wextra" "-fsyntax-only" local-file))))
;(push '("\\.c$" flymake-cc-init) flymake-allowed-file-name-masks)
;(add-hook 'c-mode-hook
;          '(lambda ()
;             (flymake-mode t)))

;;; yaml 
;; curl https://raw.githubusercontent.com/yoshiki/yaml-mode/v0.0.13/yaml-mode.el > ~/.emacs.d/elisp/yaml-mode.el
;(require 'yaml-mode)
;(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
;(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;;; typescript
;; curl https://raw.githubusercontent.com/emacs-typescript/typescript.el/master/typescript-mode.el > ~/.emacs.d/elisp/typescript-mode.el
;(require 'typescript-mode)
;(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))
