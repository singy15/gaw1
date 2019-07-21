(defsystem "gaw1"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("sikisai" "senmei" "cl-singleton-mixin")
  :components ((:module "src"
                :components
                ((:file "package")
                 (:file "package-pkgutil")
                 (:file "package-actor-ex")
                 (:file "package-game")
                 (:file "package-weapon")
                 (:file "package-mychar")
                 (:file "package-bullet")
                 (:file "package-building")
                 (:file "package-enemy")
                 (:file "pkgutil")
                 (:file "mychar")
                 (:file "actor-ex")
                 (:file "game")
                 (:file "weapon")
                 (:file "bullet")
                 (:file "building")
                 (:file "enemy")
                 (:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "gaw1/tests"))))

(defsystem "gaw1/tests"
  :author ""
  :license ""
  :depends-on ("gaw1"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for gaw1"
  :perform (test-op (op c) (symbol-call :rove :run c)))
