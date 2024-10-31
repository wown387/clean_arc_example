// lib/features/user/data/repositories/user_repository_impl.dart
import 'package:meta/meta.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/user_repository.dart';
import '../datasources/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<User> getUser(String id) async {
    try {
      final userModel = await remoteDataSource.getUser(id);
      // entity 로 변환?
      return userModel; // 이미 UserModel이 User를 상속하므로 직접 반환 가능
    } catch (error) {
      throw Exception('Error retrieving user data: $error');
    }
  }
}
