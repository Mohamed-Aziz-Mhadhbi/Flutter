import 'package:flutter/material.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  //var
  late String? username;
  late String? password;

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
        title: const Text("S'authentifier"),
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Image.asset("assets/images/minecraft.jpg",
                    width: 460, height: 215)),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: TextFormField(
                onSaved: (value) {
                  username = value;
                },
                validator: (value) {
                  if (value!.isEmpty || value.length < 5) {
                    return 'Le username ne doit pas etre vide';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Username"),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextFormField(
                obscureText: true,
                onSaved: (value) {
                  password = value;
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Le mot de passe ne doit pas etre vide';
                  }
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Mot de passe"),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40)),
                  child: const Text("S'authentifier"),
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      String message =
                          'Username = $username  \nPassword = $password';
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(40),
                    primary: Colors.red,
                  ),
                  child: const Text("Créer un compte"),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Mot de pass oublié?"),
                SizedBox(
                  width: 10,
                ),
                Text("Cliquez ici",
                    style: TextStyle(
                      color: Colors.blue,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
