import 'package:f_local_database_sqlite_template/data/models/user_model.dart';
import 'package:f_local_database_sqlite_template/domain/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListItem extends StatelessWidget {
  final UserModel user;
  const ListItem(this.user, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int id = user.id ?? 0;
    return Center(
      child: Dismissible(
        key: UniqueKey(),
        background: Container(
            color: Colors.red,
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                "Deleting",
                style: TextStyle(color: Colors.white),
              ),
            )),
        onDismissed: (direction) {},
        child: Card(
          key: Key('userItem' + id.toString()),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: ListTile(
                  // leading: CircleAvatar(
                  //   radius: 30.0,
                  //   backgroundColor: Colors.transparent,
                  //   child: ClipOval(child: Image.network(user.picture)),
                  // ),
                  title: Text(user.name),
                  subtitle: Text(user.city),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text("more"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
