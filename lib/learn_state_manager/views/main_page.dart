import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'reactive_state_page.dart';
import 'simple_state_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

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
            const Text('2 State Manager in GetX'),
            TextButton(
              onPressed: () {
                Get.to(() => ReactiveStatePage());
              },
              child: const Text(
                'Reactive State',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => SimpleStatePage());
              },
              child: const Text(
                'Simple State',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
