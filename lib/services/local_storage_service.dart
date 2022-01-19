import 'package:get_storage/get_storage.dart';
import '../model/user_model.dart';
import '../utils/constants_utils.dart';

class LocalStorage {
  //create singleton
  LocalStorage._privateConstructor();
  static final LocalStorage _instance = LocalStorage._privateConstructor();
  factory LocalStorage() => _instance;

  // instance storage
  final GetStorage _storage = GetStorage();

  Future<void> saveUser(UserModel user) {
    try {
      // print(user.toJson());
      return _storage.write(localUser, user.toJson());
    } catch (e) {
      throw Exception(e);
    }
  }

  UserModel getUser() {
    try {
      final Map<String, dynamic> _readStorage = _storage.read(localUser);
      // print('ini readStorage ${_readStorage}');
      UserModel _result = UserModel.fromJson(_readStorage);
      return _result;
    } catch (e) {
      throw Exception('Tidak Ada User');
    }
  }

  void deleteUser() {
    try {
      _storage.remove(localUser);
    } catch (e) {
      throw Exception(e);
    }
  }
}
