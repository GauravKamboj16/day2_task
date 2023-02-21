import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditUserController with ChangeNotifier{








void showSnack(String msg,BuildContext context){
      SnackBar snackdemo = SnackBar(
            content: Text(msg),
            backgroundColor: Colors.green,
            elevation: 10,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(5),
          );
           ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  }

}