// lib/features/user/presentation/bloc/user_state.dart
import '../../domain/entities/user.dart';

/// UserState는 UserBloc의 상태를 나타냅니다.
abstract class UserState {}

/// 초기 상태. Bloc이 초기화될 때 기본 상태로 설정됩니다.
class UserInitial extends UserState {}

/// 사용자 데이터를 불러오는 중일 때의 상태입니다.
class UserLoading extends UserState {}

/// 사용자 데이터를 성공적으로 불러왔을 때의 상태입니다.
class UserLoaded extends UserState {
  final User user;

  UserLoaded(this.user);
}

/// 사용자 데이터를 불러오는 중 에러가 발생했을 때의 상태입니다.
class UserError extends UserState {
  final String message;

  UserError(this.message);
}
