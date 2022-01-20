import '../models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  //Reactive State Manager
  //START
  Rx<UserModel> user = UserModel(name: 'Asep', umur: 10).obs;
  RxInt count = 0.obs;
  void changeUser(String nama, int umur) {
    user(
      UserModel(name: nama, umur: umur),
    );
  }

  void increment() {
    count++;
  }
  //END

  //SIMPLE STATE MANAGER
  //START
  int bilangan1 = 0;
  int bilangan2 = 0;
  int hasil = 2;

  void tambah(int bil1, int bil2) {
    hasil = bil1 + bil2;
    //sama seperti notifylistener();
    update();
  }
  //END
}
