import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    print("HEllo");
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;

    print(data);
    String bgImage = data['daytime'] ? 'day.png' : 'night.png';
    Color SafeAreaColor = data['daytime'] ? Colors.blue : Colors.indigo;
    return Scaffold(
        backgroundColor: SafeAreaColor,
        body: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/$bgImage'), fit: BoxFit.cover),
                ),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 80, 0, 0),
                  child: Column(
                    children: [
                      TextButton.icon(
                          onPressed: () async {
                            dynamic result =
                                await Navigator.pushNamed(context, '/location');
                            setState(() {
                              data = result;
                            });
                          },
                          icon: const Icon(
                            Icons.edit_location,
                            color: Colors.white,
                          ),
                          label: const Text("Edit Location",
                              style: TextStyle(color: Colors.white))),
                      const SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data['location'],
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            data['time'],
                            style: const TextStyle(
                                fontSize: 68, color: Colors.white),
                          )
                        ],
                      )
                    ],
                  ),
                ))));
  }
}
