import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  @override
  void initState() {
    super.initState();
  }

  List<WorldTime> locations = [
    WorldTime(location: "Egypt", url: "Africa/Cairo", flag: "egypt.png"),
    WorldTime(location: "Germany", url: "Europe/Berlin", flag: "germany.png"),
    WorldTime(location: "Greece", url: "Europe/Athens", flag: "greece.png"),
    WorldTime(
        location: "Indonesia", url: "Asia/Jakarta", flag: "indonesia.png"),
    WorldTime(location: "Kenya", url: "Africa/Nairobi", flag: "kenya.png"),
    WorldTime(
        location: "South Korea", url: "Asia/Seoul", flag: "south_korea.png"),
    WorldTime(location: "United Kingdom", url: "Europe/London", flag: "uk.png"),
    WorldTime(location: "USA", url: "America/New_York", flag: "usa.png"),
  ];

  void updateTime(int index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location': locations[index].location,
      'daytime': locations[index].daytime,
      'time': locations[index].time
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Choose a Location"),
        elevation: 0,
      ),
      backgroundColor: Colors.grey[200],
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
              child: Card(
                  child: ListTile(
                      onTap: () {
                        updateTime(index);
                      },
                      leading: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/${locations[index].flag}')),
                      title: Text(
                          locations[index].location ?? "Unknown Location"))));
        },
      ),
    );
  }
}
