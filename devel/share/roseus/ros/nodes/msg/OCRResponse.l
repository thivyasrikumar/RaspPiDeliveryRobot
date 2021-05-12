;; Auto-generated. Do not edit!


(when (boundp 'nodes::OCRResponse)
  (if (not (find-package "NODES"))
    (make-package "NODES"))
  (shadow 'OCRResponse (find-package "NODES")))
(unless (find-package "NODES::OCRRESPONSE")
  (make-package "NODES::OCRRESPONSE"))

(in-package "ROS")
;;//! \htmlinclude OCRResponse.msg.html


(defclass nodes::OCRResponse
  :super ros::object
  :slots (_is_ready _detected_text ))

(defmethod nodes::OCRResponse
  (:init
   (&key
    ((:is_ready __is_ready) nil)
    ((:detected_text __detected_text) "")
    )
   (send-super :init)
   (setq _is_ready __is_ready)
   (setq _detected_text (string __detected_text))
   self)
  (:is_ready
   (&optional __is_ready)
   (if __is_ready (setq _is_ready __is_ready)) _is_ready)
  (:detected_text
   (&optional __detected_text)
   (if __detected_text (setq _detected_text __detected_text)) _detected_text)
  (:serialization-length
   ()
   (+
    ;; bool _is_ready
    1
    ;; string _detected_text
    4 (length _detected_text)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _is_ready
       (if _is_ready (write-byte -1 s) (write-byte 0 s))
     ;; string _detected_text
       (write-long (length _detected_text) s) (princ _detected_text s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _is_ready
     (setq _is_ready (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;; string _detected_text
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _detected_text (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get nodes::OCRResponse :md5sum-) "dd3bb149a49a428a8a8333b15a2fa378")
(setf (get nodes::OCRResponse :datatype-) "nodes/OCRResponse")
(setf (get nodes::OCRResponse :definition-)
      "bool is_ready
string detected_text
")



(provide :nodes/OCRResponse "dd3bb149a49a428a8a8333b15a2fa378")


