import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:usersapp/model/users_model.dart';



class UsersRepo{
  Future<UsersModel> getAllUsersdata() async{
    try {
      final response = await http.get(Uri.parse(
          "https://reqres.in/api/users?page=1"
      ));
      final Map<String, dynamic> jsonresponse = jsonDecode(response.body);
      UsersModel usersModel = UsersModel.fromJson(jsonresponse);
      print(usersModel.data![1].firstName);
      return usersModel;
    }
    catch(e){
      print(e.toString());
      throw(e);


    }

  }

}