part of 'profileb_bloc.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.isLoading() = _isLoading;
  const factory ProfileState.isError(String errorMessage) = _isError;
  const factory ProfileState.isSuccess(List<UserModel> user) = _isSucces;
}
