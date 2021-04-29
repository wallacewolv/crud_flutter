import 'package:crud_flutter/models/user.dart';
import 'package:crud_flutter/provider/users_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formData = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Formulário de Usuário",
          style: GoogleFonts.architectsDaughter(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState!.validate();

              if (isValid) {
                _form.currentState!.save();

                Provider.of<UsersProvider>(context, listen: false).put(
                  User(
                    id: _formData['id'].toString(),
                    name: _formData['name'].toString(),
                    email: _formData['email'].toString(),
                    avatarUrl: _formData['avatarUrl'].toString(),
                  ),
                );
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: GoogleFonts.architectsDaughter(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Preencha todos os campos antes de salvar";
                  }
                  if (value.trim().length < 3) {
                    return "Nome com minimo de 3 caracteres";
                  }
                },
                onSaved: (value) => _formData['name'] = value.toString(),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "E-mail",
                  labelStyle: GoogleFonts.architectsDaughter(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Preencha todos os campos antes de salvar";
                  }
                  if (value.trim().length < 10) {
                    return "E-mail com minimo de 10 caracteres";
                  }
                },
                onSaved: (value) => _formData['email'] = value.toString(),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "URL do Avatar",
                  labelStyle: GoogleFonts.architectsDaughter(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Preencha todos os campos antes de salvar";
                  }
                  if (value.trim().length < 10) {
                    return "URL do avatar com minimo de 10 caracteres";
                  }
                },
                onSaved: (value) => _formData['avatarUrl'] = value.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
