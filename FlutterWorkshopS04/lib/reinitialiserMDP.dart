import 'package:flutter/material.dart';

class ReinitialiserMDP extends StatefulWidget {
  const ReinitialiserMDP({Key? key}) : super(key: key);

  @override
  _ReinitialiserMDPState createState() => _ReinitialiserMDPState();
}

class _ReinitialiserMDPState extends State<ReinitialiserMDP> {
  //var
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
        title: const Text("Réinitialiser le mot de passe"),
      ),
      body: Form(
        key: _globalKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: [
            Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 50),
                child: Image.asset("assets/images/minecraft.jpg",
                    width: 460, height: 215)),
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
                  child: const Text("Reinitialiser le mot de passe"),
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      String message =
                          'Password = $password';
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
            ),
          ],
        ),
      ),
    );
  }
}
