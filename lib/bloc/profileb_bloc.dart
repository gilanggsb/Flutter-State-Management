import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:freezelogin/model/user_model.dart';
import 'package:freezelogin/services/profile_service.dart';

part 'profileb_event.dart';
part 'profileb_state.dart';
part 'profileb_bloc.freezed.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(const _Initial()) {
    on<_getAllUser>((event, emit) async {
      //cek event pada bloc dengan event.map
      //ada 2 properti pada event yaitu started dan getAllUser
      //masing - masing properti mereturn function

      try {
        //emit Loading state
        emit(const ProfileState.isLoading());

        //get data from API
        List<UserModel> _user =
            await ProfileService().getAllUser(page: event.page);
        //emit Success state
        emit(ProfileState.isSuccess(_user));
      } catch (e) {
        //emit Error state
        emit(ProfileState.isError(e.toString()));
      }
    });
  }
}
