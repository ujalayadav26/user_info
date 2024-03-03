import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:usersapp/provider/users_notifier.dart';
import 'package:usersapp/provider/users_state.dart';
import 'package:usersapp/screen/users_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hello ReqRes user!",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
        body:Padding(
          padding: const EdgeInsets.all(9.0),
          child: Consumer(builder: (context, ref, child) {
            final state = ref.watch(usersProvider);
            if (state.usersStatus == UsersStatus.loading) {
              return CircularProgressIndicator();
            }
            if (state.usersStatus == UsersStatus.loaded) {

              return GridView.builder(
                  itemCount:state.usersModel!.data!.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context,index) {
                    return UsersScreen(
                        firstname: state.usersModel!.data![index].firstName ?? "",
                        email: state.usersModel!.data![index].email ?? "",
                        avatar: state.usersModel!.data![index].avatar ??
                            "https://img.freepik.com/free-vector/red-prohibited-sign-no-icon-warning-stop-symbol-safety-danger-isolated-vector-illustration_56104-912.jpg?w=740&t=st=1709391300~exp=1709391900~hmac=09d06cc0caf77dc61d9ab1ebc9df95e104c32b1c4f8a976c897df53c4608f30c");
                  }
              );
            }
            return SizedBox();
          }),

        ),
    );
  }
}
