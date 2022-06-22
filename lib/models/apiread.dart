import 'package:flutter/cupertino.dart';

class Apiread {
  final double? tem;
  final double? hum;
  final int? ox;
  final int? co;
  final int? hb;
  Apiread(
      {@required this.tem,
      @required this.hum,
      @required this.ox,
      @required this.co,
      @required this.hb});
  factory Apiread.fromjson(Map<String, dynamic> n) {
    return Apiread(
        tem: n["temperature_reading"],
        hum: n["humidity_reading"],
        ox: n["oxygen_reading"],
        co: n["co2_reading"],
        hb: n["heartbeat_reading"]);
  }
}
