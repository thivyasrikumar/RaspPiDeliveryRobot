; Auto-generated. Do not edit!


(cl:in-package nodes-msg)


;//! \htmlinclude MotorCmd.msg.html

(cl:defclass <MotorCmd> (roslisp-msg-protocol:ros-message)
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

(cl:defclass MotorCmd (<MotorCmd>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotorCmd>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotorCmd)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nodes-msg:<MotorCmd> is deprecated: use nodes-msg:MotorCmd instead.")))

(cl:ensure-generic-function 'speed-val :lambda-list '(m))
(cl:defmethod speed-val ((m <MotorCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nodes-msg:speed-val is deprecated.  Use nodes-msg:speed instead.")
  (speed m))

(cl:ensure-generic-function 'veer-val :lambda-list '(m))
(cl:defmethod veer-val ((m <MotorCmd>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nodes-msg:veer-val is deprecated.  Use nodes-msg:veer instead.")
  (veer m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotorCmd>) ostream)
  "Serializes a message object of type '<MotorCmd>"
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
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotorCmd>) istream)
  "Deserializes a message object of type '<MotorCmd>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotorCmd>)))
  "Returns string type for a message object of type '<MotorCmd>"
  "nodes/MotorCmd")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotorCmd)))
  "Returns string type for a message object of type 'MotorCmd"
  "nodes/MotorCmd")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotorCmd>)))
  "Returns md5sum for a message object of type '<MotorCmd>"
  "e331e937d522aefe0840576d89ae8c40")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotorCmd)))
  "Returns md5sum for a message object of type 'MotorCmd"
  "e331e937d522aefe0840576d89ae8c40")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotorCmd>)))
  "Returns full string definition for message of type '<MotorCmd>"
  (cl:format cl:nil "int64 speed~%int64 veer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotorCmd)))
  "Returns full string definition for message of type 'MotorCmd"
  (cl:format cl:nil "int64 speed~%int64 veer~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotorCmd>))
  (cl:+ 0
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotorCmd>))
  "Converts a ROS message object to a list"
  (cl:list 'MotorCmd
    (cl:cons ':speed (speed msg))
    (cl:cons ':veer (veer msg))
))
