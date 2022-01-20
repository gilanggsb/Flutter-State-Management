import 'package:create_user_getx/learn_state_manager/controller/user_controller.dart';
import 'package:create_user_getx/learn_state_manager/widgets/custom_input_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SimpleStatePage extends StatelessWidget {
  SimpleStatePage({Key? key}) : super(key: key);
  final TextEditingController _inputBilangan1Controller =
      TextEditingController(text: '');
  final TextEditingController _inputBilangan2Controller =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Simple State Manager'),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<UserController>(
              init: UserController(),
              builder: (controller) => Text(
                'Hasil : ${controller.hasil}',
                style: const TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
            title: 'Masukan Bilangan 1 dan 2',
            confirm: TextButton(
              onPressed: () {
                //update UserModel
                Get.find<UserController>().tambah(
                  int.parse(_inputBilangan1Controller.text),
                  int.parse(_inputBilangan2Controller.text),
                );
                //close dialog
                Get.back();
              },
              child: const Text(
                'Send',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
            content: CustomInputDialog(
              input1Controller: _inputBilangan1Controller,
              input2Controller: _inputBilangan2Controller,
              textInput1: 'Bilangan 1',
              textInput2: 'Bilangan 2',
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
