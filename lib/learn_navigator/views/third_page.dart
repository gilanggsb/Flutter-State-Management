import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThirdPage extends StatelessWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn GetX State Management'),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Third'),
            TextButton(
              onPressed: () {
                //navigator.pushnamed
                Get.offNamed('/second');
              },
              child: const Text('Second Page'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey[50],
              ),
            ),
            TextButton(
              onPressed: () {
                Get.offAllNamed('/');
              },
              child: const Text('Home Page'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey[50],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
