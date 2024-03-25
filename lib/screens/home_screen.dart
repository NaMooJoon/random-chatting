import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late SharedPreferences prefs;

  String accessToken = "";

  @override
  void initState() {
    super.initState();
    initPrefs();
  }

  Future initPrefs() async {
    prefs = await SharedPreferences.getInstance();
    final localData = prefs.getString('accessToken');
    if (localData != null) {
      setState(() {
        accessToken = localData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.username}'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('Welcome ${widget.username}'),
            Text('Token: $accessToken'),
          ],
        ),
      ),
    );
  }
}
