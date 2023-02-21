import 'dart:convert';

import 'package:http/http.dart'as http;
class NetworkUtil{

Uri url=Uri.parse('https://mocki.io/v1/d4867d8b-b5d5-4a48-a4ab-79131b5809b8');

Future<dynamic> getData()async{

  var res=await http.get(url);

  if(res.statusCode==200){
    return res;


  }else{
    return null;
    print("Error loading Api");
  }
}

}