import 'package:flutter/material.dart';
//时间戳转日期格式
timer_date(time){
  var _time = DateTime.fromMillisecondsSinceEpoch(time*1000);
  return '${_time.year.toString()}-${_time.month>9?_time.month.toString():'0'+_time.month.toString()}-${_time.day>9?_time.day.toString():'0'+_time.day.toString()}';
}
timer_second(time){

}