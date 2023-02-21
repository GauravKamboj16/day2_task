import 'package:day2_task/Constant/app_colors.dart';
import 'package:day2_task/Model/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../modeules/view/EditUser.dart';

class GridListing extends StatelessWidget {
  final List<User> userList;
  const GridListing({super.key, required this.userList});

   void editUser(int index,BuildContext context){
    Navigator.push((context), MaterialPageRoute(builder: (context){

      return EditUser(user: userList.elementAt(index),);

    }));
    
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: userList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4), 
    itemBuilder: (context,index){
      return Container(
        color: AppColors.cardColor,
        child: Center(
         child: Stack(
           children:[ Center(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: [
                  Text(userList.elementAt(index).name,style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),),
                  Text(userList.elementAt(index).city,style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w600))
                ],),
           ),
              Align(
                alignment: Alignment.topRight,
                child: IconButton(icon: Icon(Icons.edit,size: 15,color: Colors.white,),onPressed: (){
                  editUser(index, context);
                },),
              )
           ]
         ),

        ),

    
      );
    });


  }
}