import 'package:dio/dio.dart';
import '../model/user_model.dart';

class AuthService {
  AuthService._privateConstructor();
  static final AuthService _instance = AuthService._privateConstructor();
  factory AuthService() => _instance;

  final Dio _dio = Dio();

  Future<UserModel> signIn({
    required String email,
    required String password,
  }) async {
    try {
      Map<String, dynamic> requestData = {
        'email': email,
        'password': password,
      };

      Response _response =
          await _dio.post('https://reqres.in/api/login', data: requestData);

      UserModel result = UserModel.fromJson(_response.data);
      return result;
    } on DioError catch (e) {
      
      if(e.type == DioErrorType.response){
        throw e.response!.data['error'];
      }
      throw e.response!.data;
      ///Contoh error response pada DIO
      // switch (e.type) {
      //   case DioErrorType.connectTimeout:
      //     // TODO: Handle this case.
      //     break;
      //   case DioErrorType.sendTimeout:
      //     // TODO: Handle this case.
      //     break;
      //   case DioErrorType.receiveTimeout:
      //     // TODO: Handle this case.
      //     break;
      //   case DioErrorType.response:
      //     // TODO: Handle this case.
      //     break;
      //   case DioErrorType.cancel:
      //     // TODO: Handle this case.
      //     break;
      //   case DioErrorType.other:
      //     // TODO: Handle this case.
      //     break;
      // }
    }
  }
}
// eve.holt@reqres.in