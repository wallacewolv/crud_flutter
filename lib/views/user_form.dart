import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();

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
              _form.currentState!.save();
              Navigator.of(context).pop();
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
                onSaved: (value) {
                  print(value);
                },
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
