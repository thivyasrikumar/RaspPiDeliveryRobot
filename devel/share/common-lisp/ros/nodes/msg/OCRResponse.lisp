; Auto-generated. Do not edit!


(cl:in-package nodes-msg)


;//! \htmlinclude OCRResponse.msg.html

(cl:defclass <OCRResponse> (roslisp-msg-protocol:ros-message)
  ((is_ready
    :reader is_ready
    :initarg :is_ready
    :type cl:boolean
    :initform cl:nil)
   (detected_text
    :reader detected_text
    :initarg :detected_text
    :type cl:string
    :initform ""))
)

(cl:defclass OCRResponse (<OCRResponse>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <OCRResponse>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'OCRResponse)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name nodes-msg:<OCRResponse> is deprecated: use nodes-msg:OCRResponse instead.")))

(cl:ensure-generic-function 'is_ready-val :lambda-list '(m))
(cl:defmethod is_ready-val ((m <OCRResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nodes-msg:is_ready-val is deprecated.  Use nodes-msg:is_ready instead.")
  (is_ready m))

(cl:ensure-generic-function 'detected_text-val :lambda-list '(m))
(cl:defmethod detected_text-val ((m <OCRResponse>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader nodes-msg:detected_text-val is deprecated.  Use nodes-msg:detected_text instead.")
  (detected_text m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <OCRResponse>) ostream)
  "Serializes a message object of type '<OCRResponse>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'is_ready) 1 0)) ostream)
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'detected_text))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'detected_text))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <OCRResponse>) istream)
  "Deserializes a message object of type '<OCRResponse>"
    (cl:setf (cl:slot-value msg 'is_ready) (cl:not (cl:zerop (cl:read-byte istream))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'detected_text) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'detected_text) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<OCRResponse>)))
  "Returns string type for a message object of type '<OCRResponse>"
  "nodes/OCRResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'OCRResponse)))
  "Returns string type for a message object of type 'OCRResponse"
  "nodes/OCRResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<OCRResponse>)))
  "Returns md5sum for a message object of type '<OCRResponse>"
  "dd3bb149a49a428a8a8333b15a2fa378")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'OCRResponse)))
  "Returns md5sum for a message object of type 'OCRResponse"
  "dd3bb149a49a428a8a8333b15a2fa378")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<OCRResponse>)))
  "Returns full string definition for message of type '<OCRResponse>"
  (cl:format cl:nil "bool is_ready~%string detected_text~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'OCRResponse)))
  "Returns full string definition for message of type 'OCRResponse"
  (cl:format cl:nil "bool is_ready~%string detected_text~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <OCRResponse>))
  (cl:+ 0
     1
     4 (cl:length (cl:slot-value msg 'detected_text))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <OCRResponse>))
  "Converts a ROS message object to a list"
  (cl:list 'OCRResponse
    (cl:cons ':is_ready (is_ready msg))
    (cl:cons ':detected_text (detected_text msg))
))
