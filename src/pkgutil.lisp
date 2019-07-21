(in-package :pkgutil)

; (defmacro shadowing-import-from (syms pkg)
;   `(eval-when (:compile-toplevel)
;     (do-external-symbols (s ,pkg)
;       (dolist (w ,syms)
;         (when (not (eql w s)) 
;           (import s))))))
(defmacro shadowing-import-from (syms pkg)
  `(do-external-symbols (s ,pkg)
     (dolist (w ,syms)
       (when (not (eql w s)) 
         (import s)))))

(in-package :cl-user)

