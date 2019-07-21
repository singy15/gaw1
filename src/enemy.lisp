(in-package :gaw1/enemy)

(defclass enemy (actor-ex) ())

(defmethod smi:draw ((this enemy))
  (sik:rect (- (smi:x this) 10.0) (- (smi:y this) 10.0)
            (+ (smi:x this) 10.0) (+ (smi:y this) 10.0)
            :z 1.0
            ))

(defmethod smi:updt ((this enemy))
  (call-next-method))

(in-package :cl-user)

