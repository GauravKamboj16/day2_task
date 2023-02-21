import 'package:day2_task/Constant/app_colors.dart';
import 'package:day2_task/modeules/controller/ListingController.dart';
import 'package:day2_task/widgets/GridListing.dart';
import 'package:day2_task/widgets/listItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

class ListingScreen extends StatefulWidget {
  const ListingScreen({super.key});

  @override
  State<ListingScreen> createState() => _ListingScreenState();
}

class _ListingScreenState extends State<ListingScreen> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    


  }
  
  @override
  Widget build(BuildContext context) {
   final controller=Provider.of<ListingController>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.redColor,
        title: Text("Listing Screen"),
        actions: [IconButton(onPressed: (){
          controller.changeLayout();
        } ,icon: controller.isLIst==true?Icon(Icons.list):Icon(Icons.grid_4x4),color: AppColors.whiteColor,)],
      ),
      body: controller.isLoading==true?
      Center(child:CircularProgressIndicator()):
        SafeArea(child:controller.isLIst==true ?
        ListItem(userList:controller.userList):GridListing(userList: controller.userList,)
      ),
       
    );
  }
}