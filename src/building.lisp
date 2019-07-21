(in-package :gaw1/building)

(defclass building (actor-ex) 
  ((height
     :accessor height)
   (width
     :accessor width)
   (distance
     :accessor distance)))

(defmethod smi:draw ((this building))
  (sik:rect 
    (smi:x this) (smi:y this) 
    (+ (width this) (smi:x this)) (- (smi:y this) (height this))
    :r (* 1.3 (distance this))
    :g (* 1.3 (distance this))
    :b (* 1.3 (distance this))
    :z (distance this)))

(defmethod smi:updt ((this building))
  (call-next-method))

(in-package :cl-user)

