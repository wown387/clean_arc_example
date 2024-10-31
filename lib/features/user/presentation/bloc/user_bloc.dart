// lib/features/user/presentation/bloc/user_bloc.dart
import 'package:clean_arc_example/features/user/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_user.dart';

class UserBloc extends Cubit<UserState> {
  final GetUser getUser;

  UserBloc(this.getUser) : super(UserInitial());

  Future<void> fetchUser(String id) async {
    try {
      emit(UserLoading());
      final user = await getUser(id);
      emit(UserLoaded(user));
    } catch (e) {
      emit(UserError('Failed to fetch user'));
    }
  }
}
