import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:http/http.dart';

class WorldTime {
  String? url;
  String? time = "";
  String? location;
  bool? daytime;
  String? flag;

  WorldTime({this.url, this.location, this.flag, this.time, this.daytime});

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("https://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      daytime = now.hour > 6 && now.hour < 20 ? true : false;

      time = DateFormat.jm().format(now);
      print(time);
    } catch (error) {
      print("Error fetching data: $error");
      time = "Error getting time";
    }
  }
}
