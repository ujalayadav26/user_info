import 'package:flutter/material.dart';
class UsersScreen extends StatelessWidget {
   String firstname;
   String email;
   String avatar;

   UsersScreen ({super.key,
   required this.firstname,
   required this.email,
   required this.avatar,
   });
   @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("${firstname}",
          style: TextStyle(
            fontWeight: FontWeight.w500
          ),),
          Text("${email}",
            ),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Image.network(
            "${avatar}",
            fit: BoxFit.cover,
          ),
        ),
      ),

        ],
      ),
    );
  }
}
