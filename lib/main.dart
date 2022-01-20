import '../learn_state_manager/views/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'learn_navigator/views/main_page.dart';
// import 'learn_navigator/views/second_page.dart';
// import 'learn_navigator/views/third_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      // getPages: [
      //   GetPage(
      //     name: '/',
      //     page: () => const MainPage(),
      //   ),
      //   GetPage(
      //     name: '/second',
      //     page: () => const SecondPage(),
      //   ),
      //   GetPage(
      //     name: '/third',
      //     page: () => const ThirdPage(),
      //   ),
      // ],
      home: MainPage(),
      title: 'Learn GetX',
    );
  }
}
