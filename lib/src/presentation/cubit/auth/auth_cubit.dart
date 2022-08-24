import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ta_bsi/src/data/dataSources/remote/auth_user_service.dart';
import 'package:ta_bsi/src/data/dataSources/remote/user_service.dart';
import 'package:ta_bsi/src/data/models/user_model.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void signIn({required String email, required String password}) async {
    try {
      emit(AuthLoading());
      UserModel user = await AuthUserService().signIn(
        email: email,
        password: password,
      );
      emit(AuthSuccess(user));
    } catch (e) {
      print('error di authCubit $e');

      emit(AuthFailed(e.toString()));
    }
  }

  void signUp({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      emit(AuthLoading());

      UserModel user = await AuthUserService().signUp(
        email: email,
        password: password,
        name: name,
      );

      emit(AuthSuccess(user));
    } catch (e) {
      emit(AuthFailed(e.toString()));
    }
  }

  void signOut() async {
    try {
      emit(AuthLoading());
      await AuthUserService().signOut();

      emit(AuthInitial());
      print('berhasil keluar');
    } catch (e) {
      print(e);
      emit(AuthFailed(e.toString()));
    }
  }

  // void getCurrentUser(String id) async {
  //   try {
  //     UserModel user = await UserService().getUserById(id);
  //     emit(AuthSuccess(user));
  //   } catch (e) {
  //     emit(AuthFailed(e.toString()));
  //   }
  // }
}
