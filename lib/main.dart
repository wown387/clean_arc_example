// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'features/user/presentation/bloc/user_bloc.dart';
import 'features/user/presentation/screens/user_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 의존성 주입 초기화
  di.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // UserBloc 주입
        BlocProvider(
          create: (_) => di.sl<UserBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Clean Architecture Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: UserScreen(), // 기본 화면으로 UserScreen을 설정
      ),
    );
  }
}
