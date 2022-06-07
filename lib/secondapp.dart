import 'package:app_communication/main.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WelcomePage extends StatelessWidget {
  String name, email, phone;
  WelcomePage(
      {Key? key, required this.name, required this.email, required this.phone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: $name'),
            Text('Email: $email'),
            Text('Phone: $phone'),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(
                    MaterialPageRoute(builder: (context) => const MyAppHome()));
              },
              child: const Text('Back to First App'),
            ),
          ],
        ),
      ),
    );
  }
}
