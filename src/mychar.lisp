(in-package :gaw1/mychar)

(defconstant +spd+ 1.5)

(defclass mychar (actor-ex) 
  ((weap
     :accessor weap)))

(defmethod initialize-instance :around ((this mychar) &key)
  (call-next-method)
  (setf (weap this) (make-instance 'weapon)))

(defmethod smi:draw ((this mychar))
  (sik:line (round (smi:x this)) 
            (round (smi:y this))
            (round (- (smi:x this) 15.0))
            (round (+ (smi:y this) 10.0))
            :w 4.0 :a 0.7 :z 0.9)
  (sik:line (round (+ (smi:x this) 12.0)) 
            (round (- (smi:y this) 2.0))
            (round (- (smi:x this) 25.0))
            (round (- (smi:y this) 6.0))
            :w 5.0 :a 0.7 :z 1.0)
  (sik:line (round (+ (smi:x this) 10.0)) 
            (round (smi:y this))
            (round (- (smi:x this) 15.0))
            (round (smi:y this))
            :w 4.0 :a 1.0 :z 1.0))

(defmethod smi:updt ((this mychar))
  (setf (smi:d-dump this) 0.8)
  
  (when (sik:get-key-down #\w)
    (decf (smi:dy this) +spd+))
  (when (sik:get-key-down #\s)
    (incf (smi:dy this) +spd+))
  (when (sik:get-key-down #\a)
    (decf (smi:dx this) +spd+))
  (when (sik:get-key-down #\d)
    (incf (smi:dx this) +spd+))
  
  (gaw1/weapon:updt (weap this))
  
  (when (sik:get-key-push #\j)
    (sik:line 200 200 300 300)
    (trigger (weap this)))
  
  (call-next-method))

(in-package :cl-user)

