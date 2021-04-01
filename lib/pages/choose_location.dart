import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class Chooselocation extends StatefulWidget {
  @override
  _ChooselocationState createState() => _ChooselocationState();
}

class _ChooselocationState extends State<Chooselocation> {
  List<Worldtime> locations = [
    Worldtime(location: 'NewYork', flag: 'usa.jpg', url: 'America/New_York'),
    Worldtime(location: 'Paris', flag: 'paris.png', url: 'Europe/Paris'),
    Worldtime(location: 'Singapore', flag: 'sing.png', url: 'Asia/Singapore'),
    Worldtime(location: 'Dubai', flag: 'dxb.png', url: 'Asia/Dubai'),
    Worldtime(location: 'London', flag: 'lnd.jpg', url: 'Europe/London'),
    Worldtime(location: 'Chicago', flag: 'usa.jpg', url: 'America/Chicago'),
  ];

  void updateTime(index) async {
    Worldtime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 0),
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage:
                        AssetImage('assets/${locations[index].flag}'),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
