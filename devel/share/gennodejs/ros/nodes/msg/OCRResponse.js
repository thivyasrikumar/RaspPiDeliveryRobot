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

class OCRResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.is_ready = null;
      this.detected_text = null;
    }
    else {
      if (initObj.hasOwnProperty('is_ready')) {
        this.is_ready = initObj.is_ready
      }
      else {
        this.is_ready = false;
      }
      if (initObj.hasOwnProperty('detected_text')) {
        this.detected_text = initObj.detected_text
      }
      else {
        this.detected_text = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type OCRResponse
    // Serialize message field [is_ready]
    bufferOffset = _serializer.bool(obj.is_ready, buffer, bufferOffset);
    // Serialize message field [detected_text]
    bufferOffset = _serializer.string(obj.detected_text, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type OCRResponse
    let len;
    let data = new OCRResponse(null);
    // Deserialize message field [is_ready]
    data.is_ready = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [detected_text]
    data.detected_text = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.detected_text.length;
    return length + 5;
  }

  static datatype() {
    // Returns string type for a message object
    return 'nodes/OCRResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'dd3bb149a49a428a8a8333b15a2fa378';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool is_ready
    string detected_text
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new OCRResponse(null);
    if (msg.is_ready !== undefined) {
      resolved.is_ready = msg.is_ready;
    }
    else {
      resolved.is_ready = false
    }

    if (msg.detected_text !== undefined) {
      resolved.detected_text = msg.detected_text;
    }
    else {
      resolved.detected_text = ''
    }

    return resolved;
    }
};

module.exports = OCRResponse;
