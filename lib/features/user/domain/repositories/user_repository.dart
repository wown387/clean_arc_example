// lib/features/user/domain/repositories/user_repository.dart
import '../entities/user.dart';

abstract class UserRepository {
  /// 사용자 정보를 가져오는 메서드
  /// [id]는 사용자의 고유 ID입니다.
  /// 에러 발생 시 Exception을 던집니다.
  Future<User> getUser(String id);
}
