;; Auto-generated. Do not edit!


(when (boundp 'nodes::MotorCmd)
  (if (not (find-package "NODES"))
    (make-package "NODES"))
  (shadow 'MotorCmd (find-package "NODES")))
(unless (find-package "NODES::MOTORCMD")
  (make-package "NODES::MOTORCMD"))

(in-package "ROS")
;;//! \htmlinclude MotorCmd.msg.html


(defclass nodes::MotorCmd
  :super ros::object
  :slots (_speed _error ))

(defmethod nodes::MotorCmd
  (:init
   (&key
    ((:speed __speed) 0.0)
    ((:error __error) 0.0)
    )
   (send-super :init)
   (setq _speed (float __speed))
   (setq _error (float __error))
   self)
  (:speed
   (&optional __speed)
   (if __speed (setq _speed __speed)) _speed)
  (:error
   (&optional __error)
   (if __error (setq _error __error)) _error)
  (:serialization-length
   ()
   (+
    ;; float64 _speed
    8
    ;; float64 _error
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _speed
       (sys::poke _speed (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _error
       (sys::poke _error (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _speed
     (setq _speed (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _error
     (setq _error (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get nodes::MotorCmd :md5sum-) "88fdcae5d42ee49eb3449637009b77d4")
(setf (get nodes::MotorCmd :datatype-) "nodes/MotorCmd")
(setf (get nodes::MotorCmd :definition-)
      "float64 speed
float64 error

")



(provide :nodes/MotorCmd "88fdcae5d42ee49eb3449637009b77d4")


