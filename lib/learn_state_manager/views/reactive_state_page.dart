import '../widgets/custom_input_dialog.dart';
import '../controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReactiveStatePage extends StatelessWidget {
  ReactiveStatePage({Key? key}) : super(key: key);

  final TextEditingController _inputNamaController =
      TextEditingController(text: '');
  final TextEditingController _inputUmurController =
      TextEditingController(text: '');
  @override
  Widget build(BuildContext context) {
    print('build');

    //Reactive State Manager
    //1. GetX -> must use init controller (init:Controller())
    //2. Obx -> must use controller (Get.put(Controller()))
    final UserController _userController = Get.put(UserController()); //Obx
    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Reactive State Manager'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //example obx counter
            Obx(
              () => Text(
                'Angka ${_userController.count}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.find<UserController>().increment();
              },
              child: const Text(
                'Increment (Obx)',
                style: TextStyle(color: Colors.white),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            //example getX UserModel
            GetX(
              init: UserController(),
              builder: (UserController controller) => Text(
                'Nama : ${controller.user.value.name} \nUmur : ${controller.user.value.umur}',
                style: const TextStyle(fontSize: 50),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.defaultDialog(
                  title: 'Masukan Nama dan Umur',
                  confirm: TextButton(
                    onPressed: () {
                      //update UserModel
                      Get.find<UserController>().changeUser(
                        _inputNamaController.text,
                        int.parse(_inputUmurController.text),
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
                      input1Controller: _inputNamaController,
                      input2Controller: _inputUmurController,
                      textInput1: 'Nama',
                      textInput2: 'Umur',),
                );
              },
              child: const Text(
                'Ganti Nama dan Umur (GetX)',
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
