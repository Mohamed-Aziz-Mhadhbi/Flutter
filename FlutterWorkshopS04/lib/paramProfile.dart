import 'package:flutter/material.dart';

class paramProfile extends StatefulWidget {
  const paramProfile({Key? key}) : super(key: key);

  @override
  _paramProfileState createState() => _paramProfileState();
}

class _paramProfileState extends State<paramProfile> {
  //var
  late String? username;
  late String? password;
  late String? address;

  //key
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  //Life cycle
  @override
  void initState() {
    super.initState();
  }

  //Build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Paramétre du profil"),
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Image.asset("assets/images/minecraft.jpg",
                    width: 460, height: 215)),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                onSaved: (value) {
                  username = value;
                },
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return 'Le mot de passe ne doit pas etre vide';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Mot de passe actuel"),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              child: TextFormField(
                obscureText: true,
                onSaved: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Le mot de passe est invalid';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Nouveau mot de passe"),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
              child: TextFormField(
                onSaved: (value) {
                  address = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'L' 'adresse email ne doit pas etre vide';
                  }
                },
                maxLines: 4,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Adresse de facturation"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(350,
                        40), 
                  ),
                  child: const Text("Enregister"),
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      String message = 'Username';
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text('Information'),
                            content: Text(message),
                            actions: [
                              TextButton(
                                  onPressed: () {}, child: Text('Got it'))
                            ],
                          );
                        },
                      );
                    }
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
