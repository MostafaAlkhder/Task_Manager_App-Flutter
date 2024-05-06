import 'package:flutter/material.dart';
import 'package:task_manager_app/common/end_points.dart';
import 'package:task_manager_app/common/models/loginModel.dart';
import 'package:task_manager_app/shared/network/local/remote/request_helper.dart';
import 'package:task_manager_app/shared/network/local/sharedPref.dart';

class AuthProvider with ChangeNotifier {
  SharedPrefService sharedPrefService = SharedPrefService();

  // int currentIndex = 0;

  // ~ request models
  RequestUserModel requestUser = RequestUserModel.init();

  // ~ response models
  UserModel responseUser = UserModel();

  // ~ loaders
  bool isLoginLoading = false;

  // ~ methods
  void setUserName(String userName) => requestUser.userName = userName;
  void setPassword(String password) => requestUser.password = password;

  Future<void> userLogin() async {
    isLoginLoading = true;
    notifyListeners();
    Request request = Request(
      EndPoints.login,
      RequestType.POST,
      headers: {'Content-Type': 'application/json'},
      body: requestUser.toJson(),
    );

    final response = await request.sendRequest();
    responseUser = UserModel.fromJson(response);
    isLoginLoading = false;
    notifyListeners();
    sharedPrefService.writeCache(key: "email", value: requestUser.userName);
    sharedPrefService.readCache(key: "email");
  }
}
