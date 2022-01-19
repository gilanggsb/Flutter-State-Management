import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../services/local_storage_service.dart';
import '../model/user_model.dart';
import '../services/auth_service.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signInUser(String email, String password) async {
    try {
      emit(AuthLoading());
      UserModel _user =
          await AuthService().signIn(email: email, password: password);
      await LocalStorage().saveUser(_user);
      emit(AuthLoginSuccess(_user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void getUserFromLocal()  {
    try {
      emit(AuthLoading());
      UserModel _user =  LocalStorage().getUser();
      emit(AuthLoginSuccess(_user));
    } catch (e) {
      print('ini e $e');
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() {
    try {
      emit(AuthLoading());
      LocalStorage().deleteUser();
      emit(AuthLogoutSuccess());
    } catch (e) {
      print('ini e $e');
      emit(AuthFailed(e.toString()));
    }
  }
}
