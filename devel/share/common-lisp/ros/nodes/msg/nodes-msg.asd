
(cl:in-package :asdf)

(defsystem "nodes-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "MotorCmd" :depends-on ("_package_MotorCmd"))
    (:file "_package_MotorCmd" :depends-on ("_package"))
  ))