(in-package :gaw1/bullet)

(defclass bullet (actor-ex) ())

(defmethod initialize-instance :around ((this bullet) &key)
  (call-next-method)
  (setf (smi:duration this) 1000))

(defmethod smi:draw ((this bullet))
  (sik:point (smi:x this) (smi:y this) :s 3.0 :a 1.0))

(defmethod smi:updt ((this bullet))
  (call-next-method))

(in-package :cl-user)

