(in-package :gaw1/game)

(eval-when (:compile-toplevel)
  (use-package :gaw1/weapon))

(defclass game () ())

(defmethod initialize-instance :around ((this game) &key)
  (make-instance 'weapon))

(in-package :cl-user)

