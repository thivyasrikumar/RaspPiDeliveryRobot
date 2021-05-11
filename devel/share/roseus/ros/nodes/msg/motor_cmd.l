;; Auto-generated. Do not edit!


(when (boundp 'nodes::motor_cmd)
  (if (not (find-package "NODES"))
    (make-package "NODES"))
  (shadow 'motor_cmd (find-package "NODES")))
(unless (find-package "NODES::MOTOR_CMD")
  (make-package "NODES::MOTOR_CMD"))

(in-package "ROS")
;;//! \htmlinclude motor_cmd.msg.html


(defclass nodes::motor_cmd
  :super ros::object
  :slots (_speed _veer ))

(defmethod nodes::motor_cmd
  (:init
   (&key
    ((:speed __speed) 0)
    ((:veer __veer) 0)
    )
   (send-super :init)
   (setq _speed (round __speed))
   (setq _veer (round __veer))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:veer
   (&optional __veer)
   (if __veer (setq _veer __veer)) _veer)
  (:serialization-length
   ()
   (+
    ;; int64 _speed
    8
    ;; int64 _veer
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int64 _speed
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _speed (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _speed) (= (length (_speed . bv)) 2)) ;; bignum
              (write-long (ash (elt (_speed . bv) 0) 0) s)
              (write-long (ash (elt (_speed . bv) 1) -1) s))
             ((and (class _speed) (= (length (_speed . bv)) 1)) ;; big1
              (write-long (elt (_speed . bv) 0) s)
              (write-long (if (>= _speed 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _speed s)(write-long (if (>= _speed 0) 0 #xffffffff) s)))
     ;; int64 _veer
#+(or :alpha :irix6 :x86_64)
       (progn (sys::poke _veer (send s :buffer) (send s :count) :long) (incf (stream-count s) 8))
#-(or :alpha :irix6 :x86_64)
       (cond ((and (class _veer) (= (length (_veer . bv)) 2)) ;; bignum
              (write-long (ash (elt (_veer . bv) 0) 0) s)
              (write-long (ash (elt (_veer . bv) 1) -1) s))
             ((and (class _veer) (= (length (_veer . bv)) 1)) ;; big1
              (write-long (elt (_veer . bv) 0) s)
              (write-long (if (>= _veer 0) 0 #xffffffff) s))
             (t                                         ;; integer
              (write-long _veer s)(write-long (if (>= _veer 0) 0 #xffffffff) s)))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int64 _speed
#+(or :alpha :irix6 :x86_64)
      (setf _speed (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _speed (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;; int64 _veer
#+(or :alpha :irix6 :x86_64)
      (setf _veer (prog1 (sys::peek buf ptr- :long) (incf ptr- 8)))
#-(or :alpha :irix6 :x86_64)
      (setf _veer (let ((b0 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4)))
                  (b1 (prog1 (sys::peek buf ptr- :integer) (incf ptr- 4))))
              (cond ((= b1 -1) b0)
                     ((and (= b1  0)
                           (<= lisp::most-negative-fixnum b0 lisp::most-positive-fixnum))
                      b0)
                    ((= b1  0) (make-instance bignum :size 1 :bv (integer-vector b0)))
                    (t (make-instance bignum :size 2 :bv (integer-vector b0 (ash b1 1)))))))
   ;;
   self)
  )

(setf (get nodes::motor_cmd :md5sum-) "e331e937d522aefe0840576d89ae8c40")
(setf (get nodes::motor_cmd :datatype-) "nodes/motor_cmd")
(setf (get nodes::motor_cmd :definition-)
      "int64 speed
int64 veer

")



(provide :nodes/motor_cmd "e331e937d522aefe0840576d89ae8c40")


