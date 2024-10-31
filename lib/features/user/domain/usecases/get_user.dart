// lib/features/user/domain/usecases/get_user.dart
import 'package:clean_arc_example/features/user/domain/entities/user.dart';

import '../repositories/user_repository.dart';

class GetUser {
  final UserRepository repository;

  GetUser(this.repository);
  // 엔티티 참조
  Future<User> call(String id) async {
    return await repository.getUser(id);
  }
}
