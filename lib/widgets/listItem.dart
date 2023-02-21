import 'package:day2_task/Constant/app_colors.dart';
import 'package:day2_task/modeules/controller/ListingController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../Model/User.dart';
import '../modeules/view/EditUser.dart';

class ListItem extends StatelessWidget {
  final List<User> userList;
    ListItem({super.key, required this.userList});

    void editUser(int index,BuildContext context){
    Navigator.push((context), MaterialPageRoute(builder: (context){

      return EditUser(user: userList.elementAt(index),);

    }));
    
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;
    return ListView.separated(
       itemCount: userList.length,
      itemBuilder: (context,index){
        return Container(
          height: 65,
          width: screenWidth,
          decoration: BoxDecoration(
            color: AppColors.cardColor,
            borderRadius: BorderRadius.circular(12)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children:   [
                  Text(userList.elementAt(index).name,style: GoogleFonts.poppins(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w500),),
                  Text(userList.elementAt(index).city,style:TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w400))
                ],),
                Spacer(),
                IconButton(onPressed: (){
                  editUser(index, context);


                }, icon: Icon(Icons.edit,color: Colors.white,))
              ],
            ),
          ),
        );

      },
     separatorBuilder: (context,index){
      return SizedBox(height: 8,);

     },
     );
  }
}