import 'package:dio/dio.dart';
import 'package:freezelogin/model/user_model.dart';

class ProfileService {
  //convert normal class to a singleton
  //START
  ProfileService._privateConstructor();
  static final ProfileService _instance = ProfileService._privateConstructor();
  factory ProfileService() => _instance;
  //END

  final Dio _dio = Dio();

  //function to get all user
  Future<List<UserModel>> getAllUser({required int page}) async {
    try {
      Map<String, dynamic> _parameter = {'page': page};

      Response _response = await _dio.get(
        'https://reqres.in/api/users?',
        queryParameters: _parameter,
      );

      //create list of user
      List<UserModel> result = [];

      //add user to list
      for (var item in _response.data['data']) {
        result.add(UserModel.fromJson(item));
      }

      return result;
    } on DioError catch (e) {
      switch (e.type) {
        case DioErrorType.connectTimeout:
          // TODO: Handle this case.
          throw Exception('Connection Timeout');

        case DioErrorType.sendTimeout:
          // TODO: Handle this case.
          throw Exception('Connection Send Timeout');

        case DioErrorType.receiveTimeout:
          // TODO: Handle this case.
          throw Exception('Connection Receive Timeout');

        case DioErrorType.response:
          // TODO: Handle this case.
          throw Exception(e.response!.data['error']);

        case DioErrorType.cancel:
          // TODO: Handle this case.
          throw Exception('Cancel');

        case DioErrorType.other:
        // TODO: Handle this case.

      }
      throw Exception(e.response!.data['error']);
    }
  }
}
