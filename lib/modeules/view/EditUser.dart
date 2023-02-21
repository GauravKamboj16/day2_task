import 'package:day2_task/modeules/controller/EditUserController.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Constant/app_colors.dart';
import '../../Model/User.dart';

class EditUser extends StatefulWidget {
  final User user;
  const EditUser({super.key, required this.user});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  Widget build(BuildContext context) {
    final editController = Provider.of<EditUserController>(context);
    TextEditingController nameController =
        TextEditingController(text: this.widget.user.name);
    TextEditingController cityController =
        TextEditingController(text: this.widget.user.city);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.redColor,
        title: Text("Edit User"),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 22,
              ),
              textFiledDesign(this.widget.user.name, true, nameController),
              SizedBox(
                height: 22,
              ),
              textFiledDesign(this.widget.user.city, false, cityController),
              SizedBox(
                height: 28,
              ),
              GestureDetector(
                onTap: () {
                  editController.showSnack(
                      "Updated name is ${nameController.text} and  city is ${cityController.text}",
                      context);
                  Navigator.pop(context);
                },
                child: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: Colors.green,
                        width: 1.5,
                      )),
                  child: Center(
                      child: Text(
                    "Update",
                    style: GoogleFonts.lato(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget textFiledDesign(
      String initialValue, bool autoFocus, TextEditingController mController) {
    return TextField(
      autofocus: autoFocus,
      controller: mController,
      style: GoogleFonts.lato(color: AppColors.whiteColor),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.cardColor,
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.redColor, width: 1.5)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppColors.redColor, width: 1.5)),
      ),
    );
  }
}
