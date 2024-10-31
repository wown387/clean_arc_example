// lib/features/user/data/datasources/user_remote_data_source.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/user_model.dart';

abstract class UserRemoteDataSource {
  /// 사용자 정보를 원격 서버에서 가져옵니다.
  /// [id]는 사용자의 고유 ID입니다.
  /// 에러 발생 시 Exception을 던집니다.
  Future<UserModel> getUser(String id);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client client;

  UserRemoteDataSourceImpl({required this.client});

  @override
  Future<UserModel> getUser(String id) async {
    final response =
        await client.get(Uri.parse('https://api.example.com/users/$id'));

    if (response.statusCode == 200) {
      return UserModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user data');
    }
  }
}
