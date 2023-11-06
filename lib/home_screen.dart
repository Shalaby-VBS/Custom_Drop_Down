import 'package:flutter/material.dart';

import 'custom_drop_down.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> list = [
    "Value 1",
    "Value 2",
    "Value 3",
    "Value 4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff03001e),
              Color(0xff7303c0),
              Color(0xffec38bc),
              Color(0xfffdeff9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 100),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomDropDown(
                list: list,
                selectedValue: (value) => debugPrint("Selected Value = $value"),
                backgroundColor: Colors.amberAccent,
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
