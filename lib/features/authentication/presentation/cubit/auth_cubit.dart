import '/features/authentication/domain/usecases/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final UserLogin _userLogin;
  AuthCubit({required UserLogin userLogin})
      : _userLogin = userLogin,
        super(AuthInitial());

  void showPassword() {
    emit(AuthShowPassword());
  }

  void hidePassword() {
    emit(AuthHidePassword());
  }

  void login({required String mobile, required String password}) async {
    emit(AuthLoading());
    final res = await _userLogin(
      UserLoginParams(
        password: password,
        mobile: mobile,
      ),
    );
    res.fold(
      (l) => emit(AuthFailed(message: l.message)),
      (r) => emit(AuthSuccess()),
    );
  }
}
