import 'package:fakestore/features/auth/domain/models/user_model.dart';

abstract class AuthRepository {
  Future<void> login(String email, String password);
  Future<void> register(UserModel user);
}
