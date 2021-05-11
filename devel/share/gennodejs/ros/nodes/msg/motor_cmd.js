// Auto-generated. Do not edit!

// (in-package nodes.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class motor_cmd {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.speed = null;
      this.veer = null;
    }
    else {
      if (initObj.hasOwnProperty('speed')) {
        this.speed = initObj.speed
      }
      else {
        this.speed = 0;
      }
      if (initObj.hasOwnProperty('veer')) {
        this.veer = initObj.veer
      }
      else {
        this.veer = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type motor_cmd
    // Serialize message field [speed]
    bufferOffset = _serializer.int64(obj.speed, buffer, bufferOffset);
    // Serialize message field [veer]
    bufferOffset = _serializer.int64(obj.veer, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type motor_cmd
    let len;
    let data = new motor_cmd(null);
    // Deserialize message field [speed]
    data.speed = _deserializer.int64(buffer, bufferOffset);
    // Deserialize message field [veer]
    data.veer = _deserializer.int64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nodes/motor_cmd';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e331e937d522aefe0840576d89ae8c40';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int64 speed
    int64 veer
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new motor_cmd(null);
    if (msg.speed !== undefined) {
      resolved.speed = msg.speed;
    }
    else {
      resolved.speed = 0
    }

    if (msg.veer !== undefined) {
      resolved.veer = msg.veer;
    }
    else {
      resolved.veer = 0
    }

    return resolved;
    }
};

module.exports = motor_cmd;
