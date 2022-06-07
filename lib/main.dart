// ignore_for_file: avoid_print, non_constant_identifier_names
import 'dart:io'; // to run Dart Vm in Flutter
import 'package:app_communication/secondapp.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

void main() {
  runApp(const MyApp()); // to run the app we created.
}

class MyApp extends StatelessWidget {
  //returning an material app and it says use
  // a widget
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //use my app home for homescreen
    return const MaterialApp(
      home: MyAppHome(), //
    );
  }
}

class MyAppHome extends StatefulWidget {
  const MyAppHome({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _MyAppHomeState();
  }
}

class _MyAppHomeState extends State<MyAppHome> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _phone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('First App'),
        ),
        body: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _name,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter your name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _email,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter your email"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _phone,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Enter your phone"),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => WelcomePage(
                      name: _name.text,
                      email: _email.text,
                      phone: _phone.text)));
            },
            child: const Text('Send Data to Second App'),
          ),
          ElevatedButton.icon(
            onPressed: () {
              openwhatsapp();
              print("you clicked me");
            },
            icon: const Icon(Icons.mail),
            style: ElevatedButton.styleFrom(primary: Colors.green),
            label: const Text('Send Message via Whatsapp'),
          )
        ]));
  }

  openwhatsapp() async {
    var whatsapp = "+4915145716517";
    var whatsappURl_android =
        'whatsapp://send?phone=' + whatsapp + "&text=hello";
    if (Platform.isAndroid) {
      await launchUrlString(whatsappURl_android);
    }
  }
}
