(in-package :gaw1/weapon)

(eval-when (:compile-toplevel)
  (pkgutil:shadowing-import-from (list 'gaw1/game:foo) :gaw1/game))

(defclass weapon () 
  ((parent
     :accessor parent)
   (recharge
     :accessor recharge)
   (recharge-max
     :accessor recharge-max)))

(defmethod initialize-instance :around ((this weapon) &key)
  (call-next-method)
  (setf (recharge-max this) 10)
  (setf (recharge this) (recharge-max this)))

(defmethod updt ((this weapon))
  (incf (recharge this))
  (when (> (recharge this) (recharge-max this))
    (setf (recharge this) (recharge-max this))))

(defmethod draw ((this weapon)))

(defmethod trigger ((this weapon))
  (when (equal (recharge-max this) (recharge this))
    (firing this)))

(defmethod firing ((this weapon))
  ; (let ((b nil))
  ;   (setf b (make-instance 'gaw1/bullet:bullet))
  ;   (setf (smi:x b) (smi:x *mychar*))
  ;   (setf (smi:y b) (smi:y *mychar*))
  ;   (setf (smi:dx b) 10.0)
  ;   (smi:register *actor-mng* b))
  
  (make-instance 'game)
  
  ; (smi:parent (make-instance 'actor-ex))
  ; (parent (make-instance 'weapon))
  
  )

(in-package :cl-user)

