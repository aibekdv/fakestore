import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakestore/features/auth/domain/models/user_model.dart';
import 'package:fakestore/features/auth/domain/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository authRepository;
  AuthCubit(this.authRepository) : super(AuthInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      await authRepository.login(email, password);
      emit(LoginSuccess());
    } catch (e) {
      emit(LoginError());
    }
  }

  Future<void> register(UserModel user) async {
    emit(RegisterLoading());
    try {
      await authRepository.register(user);
      emit(RegisterSuccess());
    } catch (e) {
      emit(RegisterError());
    }
  }
}
