import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fastmongo/models/user.dart';
import 'package:flutter_fastmongo/pages/home_page.dart';

import 'package:flutter_fastmongo/utils/dialogs.dart';

const baseUrl = 'https://app-mongobd.herokuapp.com/';

class MyAPI {
  MyAPI._internal();
  static final MyAPI _instance = MyAPI._internal();
  static MyAPI get instance => _instance;
  String tk = "";

  final Dio _dio = Dio(
    BaseOptions(baseUrl: baseUrl),
  );

  Future<void> register(
    BuildContext context, {
    required String username,
    required String password,
  }) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final Response response = await _dio.post(
        'sing_up',
        options: Options(headers: {
          "accept": "application/json",
          "Content-Type": "application/json"
        }),
        data: {
          "username": username,
          "password": password,
        },
      );
      progressDialog.dismiss();

      Navigator.pushNamedAndRemoveUntil(
        context,
        HomePage.routeName,
        (_) => false,
      );
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response!.statusCode);
        print(e.response!.data);
        Dialogs.info(
          context,
          title: "ERROR",
          content: e.response!.statusCode == 409
              ? 'Duplicated email or username'
              : e.message,
        );
      } else {
        print(e);
      }
    }
  }

  Future<void> login(
    BuildContext context, {
    required String username,
    required String password,
  }) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      progressDialog.show();
      final Response response = await _dio.post(
        '/token',
        options: Options(headers: {
          "accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        }),
        data: {
          "username": username,
          "password": password,
        },
      );

      tk = response.data['access_token'];
      //Auth.instance.setSession(response.data);
      progressDialog.dismiss();

      Navigator.pushNamedAndRemoveUntil(
        context,
        HomePage.routeName,
        (_) => false,
      );
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response?.statusCode);
        print(e.response?.data);
        String message = e.message;
        if (e.response?.statusCode == 422) {
          message = "User not foundor Invalid password";
        }

        Dialogs.info(
          context,
          title: "ERROR",
          content: message,
        );
      } else {
        print(e);
      }
    }
  }

  Future<List<User>> getUsersAll(
    BuildContext context, {
    required String token,
  }) async {
    try {
      //final String token = await Auth.instance.accessToken;
      token = tk;
      final Response response = await _dio.get(
        '/find_all_persons',
        options: Options(headers: {
          'Authorization': 'Bearer ' + token,
        }),
      );

      List<User> users = [];
      for (var u in response.data) {
        users.add(User.fromJson(u));
      }
      return users;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<User?> getUserOne(
    BuildContext context, {
    required String id,
    required String token,
  }) async {
    try {
      //final String token = await Auth.instance.accessToken;
      token = tk;
      final Response response = await _dio.get(
        '/find_one_person/' + id,
        options: Options(headers: {
          'Authorization': 'Bearer ' + token,
        }),
      );

      print(response.data);
      return User.fromJson(response.data);
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<void> createUser(
    BuildContext context, {
    required String empid,
    required String name,
    required String age,
    required String teams,
    required String token,
  }) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      token = tk;
      List<String> result = teams.split(',');
      progressDialog.show();
      final Response response = await _dio.post(
        '/create_person',
        options: Options(headers: {
          "accept": "application/json",
          "Authorization": "Bearer " + token,
        }),
        data: {"emp_id": empid, "name": name, "age": age, "teams": result},
      );

      //Auth.instance.setSession(response.data);
      progressDialog.dismiss();

      Navigator.pushNamedAndRemoveUntil(
        context,
        HomePage.routeName,
        (_) => false,
      );
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response?.statusCode);
        print(e.response?.data);
        String message = e.message;
        if (e.response?.statusCode == 422) {
          message = "User not foundor Invalid password";
        }

        Dialogs.info(
          context,
          title: "ERROR",
          content: message,
        );
      } else {
        print(e);
      }
    }
  }

  Future<void> updateUser(
    BuildContext context, {
    required String id,
    required String empid,
    required String name,
    required String age,
    required String teams,
    required String token,
  }) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      token = tk;
      List<String> result = teams.split(',');
      progressDialog.show();
      final Response response = await _dio.put(
        '/update_person/'+id,
        options: Options(headers: {
          "accept": "application/json",
          "Authorization": "Bearer " + token,
        }),
        data: {"emp_id": empid, "name": name, "age": age, "teams": result},
      );

      //Auth.instance.setSession(response.data);
      progressDialog.dismiss();

      Navigator.pushNamedAndRemoveUntil(
        context,
        HomePage.routeName,
        (_) => false,
      );
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response?.statusCode);
        print(e.response?.data);
        String message = e.message;
        if (e.response?.statusCode == 422) {
          message = "User not foundor Invalid password";
        }

        Dialogs.info(
          context,
          title: "ERROR",
          content: message,
        );
      } else {
        print(e);
      }
    }
  }

  Future<void> deleteUser(
    BuildContext context, {
    required String id,
    required String token,
  }) async {
    final ProgressDialog progressDialog = ProgressDialog(context);
    try {
      token = tk;
      print(id);
      progressDialog.show();
      final Response response = await _dio.delete(
        '/delete_person/' + id,
        options: Options(headers: {
          "accept": "application/json",
          "Authorization": "Bearer " + token,
        }),
      );

      print(response.data);
      progressDialog.dismiss();

      Navigator.pushNamedAndRemoveUntil(
        context,
        HomePage.routeName,
        (_) => false,
      );
    } catch (e) {
      progressDialog.dismiss();
      if (e is DioError) {
        print(e.response?.statusCode);
        print(e.response?.data);
        String message = e.message;
        if (e.response?.statusCode == 422) {
          message = "User not foundor Invalid password";
        }

        Dialogs.info(
          context,
          title: "ERROR",
          content: message,
        );
      } else {
        print(e);
      }
    }
  }
}
