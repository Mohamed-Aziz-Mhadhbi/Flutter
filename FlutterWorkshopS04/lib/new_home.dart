import 'package:flutter/material.dart';
import 'package:workshop_sim4/home.dart';

class NewHome extends StatefulWidget {
  const NewHome({Key? key}) : super(key: key);

  @override
  _NewHomeState createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> {
  //var
  late int? total;
  final List<Game2> Games = const [
    const Game2("assets/images/dmc5.jpg", 200),
    const Game2("assets/images/re8.jpg", 200),
    const Game2("assets/images/nfs.jpg", 100),
    const Game2("assets/images/rdr2.jpg", 150),
    const Game2("assets/images/fifa.jpg", 100)
  ];

  //actions

  //lifecycle
  @override
  void initState() {
    super.initState();
  }

  //build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Panier'),
        ),
        body: GridView.builder(
            itemCount: Games.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 5,
                mainAxisExtent: 155,
                crossAxisSpacing: 5),
            itemBuilder: (context, index) {
              return GridViewItem(Games[index].image, Games[index].prix);
            }));
  }
}

//=============================================================================
//=============================================================================
//=============================================================================

//CustomCell
class GridViewItem extends StatelessWidget {
  //var
  final String _image;
  final int _pirx;

//key
   GlobalKey<FormState> globalKeyy = GlobalKey<FormState>();

  //constructor
  const GridViewItem(this._image, this._pirx);

  //build
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 215,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded( 
                  child: Row(
                children: [

                    ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size.fromHeight(40)),
                  child: const Text(""),
                  onPressed: () {
                    if (globalKeyy.currentState!.validate()) {
                      globalKeyy.currentState!.save();
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
              
              
                  Image.asset(_image),
                  SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: Text(
                      '$_pirx TND',
                      textScaleFactor: 2,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
