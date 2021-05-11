// Generated by gencpp from file nodes/motor_cmd.msg
// DO NOT EDIT!


#ifndef NODES_MESSAGE_MOTOR_CMD_H
#define NODES_MESSAGE_MOTOR_CMD_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace nodes
{
template <class ContainerAllocator>
struct motor_cmd_
{
  typedef motor_cmd_<ContainerAllocator> Type;

  motor_cmd_()
    : speed(0)
    , veer(0)  {
    }
  motor_cmd_(const ContainerAllocator& _alloc)
    : speed(0)
    , veer(0)  {
  (void)_alloc;
    }



   typedef int64_t _speed_type;
  _speed_type speed;

   typedef int64_t _veer_type;
  _veer_type veer;





  typedef boost::shared_ptr< ::nodes::motor_cmd_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::nodes::motor_cmd_<ContainerAllocator> const> ConstPtr;

}; // struct motor_cmd_

typedef ::nodes::motor_cmd_<std::allocator<void> > motor_cmd;

typedef boost::shared_ptr< ::nodes::motor_cmd > motor_cmdPtr;
typedef boost::shared_ptr< ::nodes::motor_cmd const> motor_cmdConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::nodes::motor_cmd_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::nodes::motor_cmd_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::nodes::motor_cmd_<ContainerAllocator1> & lhs, const ::nodes::motor_cmd_<ContainerAllocator2> & rhs)
{
  return lhs.speed == rhs.speed &&
    lhs.veer == rhs.veer;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::nodes::motor_cmd_<ContainerAllocator1> & lhs, const ::nodes::motor_cmd_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace nodes

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsFixedSize< ::nodes::motor_cmd_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::nodes::motor_cmd_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nodes::motor_cmd_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::nodes::motor_cmd_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nodes::motor_cmd_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::nodes::motor_cmd_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::nodes::motor_cmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "e331e937d522aefe0840576d89ae8c40";
  }

  static const char* value(const ::nodes::motor_cmd_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0xe331e937d522aefeULL;
  static const uint64_t static_value2 = 0x0840576d89ae8c40ULL;
};

template<class ContainerAllocator>
struct DataType< ::nodes::motor_cmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "nodes/motor_cmd";
  }

  static const char* value(const ::nodes::motor_cmd_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::nodes::motor_cmd_<ContainerAllocator> >
{
  static const char* value()
  {
    return "int64 speed\n"
"int64 veer\n"
;
  }

  static const char* value(const ::nodes::motor_cmd_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::nodes::motor_cmd_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.speed);
      stream.next(m.veer);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct motor_cmd_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::nodes::motor_cmd_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::nodes::motor_cmd_<ContainerAllocator>& v)
  {
    s << indent << "speed: ";
    Printer<int64_t>::stream(s, indent + "  ", v.speed);
    s << indent << "veer: ";
    Printer<int64_t>::stream(s, indent + "  ", v.veer);
  }
};

} // namespace message_operations
} // namespace ros

#endif // NODES_MESSAGE_MOTOR_CMD_H