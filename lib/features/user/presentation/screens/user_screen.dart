// lib/features/user/presentation/screens/user_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../bloc/user_state.dart';

class UserScreen extends StatelessWidget {
  final String userId = '123'; // 예시로 사용할 사용자 ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('User Profile')),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserInitial) {
            // 초기 화면에서 fetchUser 호출
            context.read<UserBloc>().fetchUser(userId);
            return Center(child: Text('Loading user data...'));
          } else if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return Center(child: Text('User: ${state.user.name}'));
          } else if (state is UserError) {
            return Center(child: Text('Error: ${state.message}'));
          }
          return Container(); // 기본 상태 반환
        },
      ),
    );
  }
}
