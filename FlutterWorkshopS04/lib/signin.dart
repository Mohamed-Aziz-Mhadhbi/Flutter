import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {

  //var

  //Const
  const SignIn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('G-Store Esprit'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image.asset('assets/images/minecraft.jpg'),
            SizedBox(height: 50,),
            Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Username"),
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: const TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Password"),
            ),
          ),
          Container(
            width: 500,
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: ElevatedButton(
              onPressed: (){

              },
              child: const Text("S'authentifier"),  
              ),
          ),
          Container(
            width: 500,
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: ElevatedButton(
              onPressed: (){

              },
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
              child: const Text("Mot de passe oublié ?"),  
              ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Pas encore de compte ?"),
                SizedBox(width: 10,),
                Text("S'inscrire", style: TextStyle(color: Colors.blue),)
              ],
            )
          )


          ],
        ),
      ),
    );
  }
}