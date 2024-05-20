import 'package:fakestore/features/auth/domain/models/user_model.dart';
import 'package:fakestore/features/auth/domain/repositories/auth_repository.dart';

import '../datasources/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepositoryImpl(this.remote);

  @override
  Future<void> login(String email, String password) {
    return remote.login(email, password);
  }

  @override
  Future<void> register(UserModel user) {
    return remote.register(user);
  }
}
