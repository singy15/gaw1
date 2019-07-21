(in-package :gaw1)

(defconstant +win-height+ 400)
(defconstant +win-width+ 600)

(defclass window (sik:window) ())

(defmethod sik:user-initialize ((this window))
  (defparameter *actor-mng* (make-instance 'smi:actor-mng))
  (smi:reset *actor-mng*)
  
  (defparameter *mychar* (make-instance 'gaw1/mychar:mychar))
  (smi:register *actor-mng* *mychar*)
  (setf (smi:x *mychar*) 100.0)
  (setf (smi:y *mychar*) (/ +win-height+ 2)))

; Load resource
(defun load-resource ()
  (setf *tex-container*
        (make-instance 'sik:texture
                       :path "./resource/container.raw"
                       :width 16
                       :height 16))

  (setf *model-transport*
        (sik:load-dxf "./resource/carrier3.dxf")))

; User display
(defmethod sik:user-display ((this window))
	(sik:clear :r 0.1 :g 0.1 :b 0.1)
  
  (smi:draw-all-actors *actor-mng*)
  (smi:updt-all-actors *actor-mng*)
 
  (when (sik:get-key-push #\j)
    (sik:line 0 0 +win-width+ +win-height+)
    (let ((b nil))
      (setf b (make-instance 'gaw1/bullet:bullet))
      (setf (smi:x b) (smi:x *mychar*))
      (setf (smi:y b) (smi:y *mychar*))
      (setf (smi:dx b) 10.0)
      (smi:register *actor-mng* b)))

  (when (and (equal 0 (random 10)))
    (let ((bld (make-instance 'gaw1/building:building)))
      (setf (smi:x bld) (+ +win-width+ 300.0))
      (setf (smi:y bld) +win-height+)
      (setf (smi:dx bld) -10.0)
      (setf (gaw1/building:height bld) (random 500))
      (setf (gaw1/building:width bld) (+ 100 (random 200)))
      (setf (gaw1/building:distance bld) (+ 0.1 (random 0.2)))
      (setf (smi:duration bld) 120)
      (smi:register *actor-mng* bld)))

  (when (and (equal 0 (random 50)))
    (let ((enm (make-instance 'gaw1/enemy:enemy)))
      (setf (smi:x enm) (+ +win-width+ 50.0))
      (setf (smi:y enm) (random +win-height+))
      (setf (smi:dx enm) -2.0)
      (setf (smi:duration enm) (* 60 60))
      (smi:register *actor-mng* enm)))

  (smi:remove-not-alive *actor-mng*)
  
  (when (sik:get-key-down #\e)
    (progn)))

; main function
(defun main ()
  (sik:display-window
		(make-instance 
      'window
       :title "gaw1"
       :width +win-width+
       :height +win-height+
       :keys (list #\w #\s #\a #\d #\c #\j #\k #\l #\h)
       :fps 60)))

(in-package :cl-user)

