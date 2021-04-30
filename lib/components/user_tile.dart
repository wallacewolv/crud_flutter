import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users_provider.dart';
import 'package:crud_flutter/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserTile extends StatelessWidget {
  final User user;
  const UserTile(this.user);

  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarUrl == null || user.avatarUrl.isEmpty
        ? CircleAvatar(
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        : CircleAvatar(
            backgroundImage: NetworkImage(user.avatarUrl),
          );
    return ListTile(
      leading: avatar,
      title: Text(
        user.name,
        style: GoogleFonts.architectsDaughter(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.indigo,
        ),
      ),
      subtitle: Text(
        user.email,
        style: GoogleFonts.abel(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              color: Colors.green,
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: Text("Excluir Usuário"),
                    content: Text("Gostaria de excluir ${user.name} ?"),
                    actions: [
                      FlatButton(
                        child: Text("Não"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      FlatButton(
                        child: Text("Sim"),
                        onPressed: () {
                          Provider.of<UsersProvider>(context, listen: false)
                              .remove(user);
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
