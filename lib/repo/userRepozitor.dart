import 'package:dio/dio.dart';
import 'package:task_manager/bloc/regis_bloc.dart';

class UserRepo {
  final Dio dio;

  UserRepo({required this.dio});
  bool regis = true;

  Future getproducts() async {}
}
