import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

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
            const Text('Second'),
            TextButton(
              onPressed: () {
                //navigator.pop
                Get.back();
              },
              child: const Text('First Page'),
              style: TextButton.styleFrom(
                backgroundColor: Colors.blueGrey[50],
              ),
            ),
            TextButton(
              onPressed: () {
                //navigator.pushnamed
                Get.offNamed('/third');
              },
              child: const Text('third Page'),
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
