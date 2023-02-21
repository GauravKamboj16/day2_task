import 'package:day2_task/modeules/controller/EditUserController.dart';
import 'package:day2_task/modeules/controller/ListingController.dart';
import 'package:day2_task/modeules/view/listingScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (_)=>ListingController()),
         ChangeNotifierProvider(create: (_)=>EditUserController())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:   ListingScreen(),
       
      ),
    );
  }
}
 