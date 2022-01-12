import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:logincubitwithdio/model/user_model.dart';
import 'package:logincubitwithdio/services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signInUser(String email, String password) async {
    try {
      emit(AuthLoading());
      UserModel _data =
          await AuthService().signIn(email: email, password: password);
      emit(AuthSuccess(_data));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }
}
