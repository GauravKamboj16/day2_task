import 'dart:convert';
import 'package:day2_task/Model/DataModel.dart';
import 'package:day2_task/Model/User.dart';
import 'package:day2_task/modeules/view/EditUser.dart';
import 'package:day2_task/services/Network.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListingController with ChangeNotifier {

  List<User> userList = [];

  bool isLIst = true;
  bool isLoading = true;
  
  ListingController() {
    getUserList();
  }


  Future<void> changeLayout() async {
    if (isLIst == true) {
      isLIst = false;
      notifyListeners();
    } else {
      isLIst = true;
      notifyListeners();
    }
  }

  Future<dynamic> getUserList() async {
    NetworkUtil networkUtil = NetworkUtil();
    var response = await networkUtil.getData();

    if (response != null) {
      var data = jsonDecode(response.body);
      print(data[0]["name"]);

      for (var item in data) {
        User product = User(
          name: item["name"],
          city: item["city"],
        );
        userList.add(product);
        print(item["name"]);
      }

      isLoading = false;

      notifyListeners();
    } else {
      isLoading = false;
      notifyListeners();
    }
  }

  void editUser(int index,BuildContext context){
    Navigator.push((context), MaterialPageRoute(builder: (context){
      return EditUser(user: userList.elementAt(index),);

    }));
    
  }

}
