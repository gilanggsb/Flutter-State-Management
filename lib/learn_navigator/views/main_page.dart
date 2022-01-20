import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn GetX State Management'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('First Page'),
            TextButton(
              onPressed: () {
                //navigator.pushName
                Get.toNamed('/second');
              },
              child: const Text('Second Page'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey[50],
              ),
            )
          ],
        ),
      ),
    );
  }
}
