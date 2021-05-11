; Auto-generated. Do not edit!


(cl:in-package nodes-msg)


;//! \htmlinclude motor_cmd.msg.html

(cl:defclass <motor_cmd> (roslisp-msg-protocol:ros-message)
  ((speed
    :reader speed
    :initarg :speed
    :type cl:integer
    :initform 0)
   (veer
    :reader veer
    :initarg :veer
    :type cl:integer
    :initform 0))
)

(cl:defclass motor_cmd (<motor_cmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <motor_cmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'motor_cmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nodes-msg:<motor_cmd> is deprecated: use nodes-msg:motor_cmd instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <motor_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nodes-msg:speed-val is deprecated.  Use nodes-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'veer-val :lambda-list '(m))
(cl:defmethod veer-val ((m <motor_cmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nodes-msg:veer-val is deprecated.  Use nodes-msg:veer instead.")
  (veer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <motor_cmd>) ostream)
  "Serializes a message object of type '<motor_cmd>"
  (cl:let* ((signed (cl:slot-value msg 'speed)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'veer)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 18446744073709551616) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <motor_cmd>) istream)
  "Deserializes a message object of type '<motor_cmd>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'veer) (cl:if (cl:< unsigned 9223372036854775808) unsigned (cl:- unsigned 18446744073709551616))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<motor_cmd>)))
  "Returns string type for a message object of type '<motor_cmd>"
  "nodes/motor_cmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'motor_cmd)))
  "Returns string type for a message object of type 'motor_cmd"
  "nodes/motor_cmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<motor_cmd>)))
  "Returns md5sum for a message object of type '<motor_cmd>"
  "e331e937d522aefe0840576d89ae8c40")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'motor_cmd)))
  "Returns md5sum for a message object of type 'motor_cmd"
  "e331e937d522aefe0840576d89ae8c40")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<motor_cmd>)))
  "Returns full string definition for message of type '<motor_cmd>"
  (cl:format cl:nil "int64 speed~%int64 veer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'motor_cmd)))
  "Returns full string definition for message of type 'motor_cmd"
  (cl:format cl:nil "int64 speed~%int64 veer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <motor_cmd>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <motor_cmd>))
  "Converts a ROS message object to a list"
  (cl:list 'motor_cmd
    (cl:cons ':speed (speed msg))
    (cl:cons ':veer (veer msg))
))
