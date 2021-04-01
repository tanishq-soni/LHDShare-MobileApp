import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class Worldtime {
  String location;
  String time;
  String flag;
  String url;

  bool isDaytime;

  Worldtime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response;
      response = await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(datetime);
      //print(offset);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime = now.hour > 6 && now.hour < 19 ? true : false;

      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught an error! $e');
      time = 'error!';
    }
  }
}
