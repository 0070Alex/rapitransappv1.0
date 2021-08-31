import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_clone/src/pages/pages.home/home_controller.dart';

class HomePage extends StatelessWidget {

  //const HomePage({Key key}) : super(key: key);
  HomeController _con = new HomeController();
  @override
  Widget build(BuildContext context) {
    _con.init(context); //INICIALIZAMOS EL CONTROLADOR
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.black, Colors.black87]
            )
          ),
          child: Column(
            children: [
              _bannerApp(context),
              SizedBox(height: 50,),
              _textRol(),
              SizedBox(height: 50,),
              _imageTypeUser(context, 'assets/img/pasajero.png'),
              SizedBox(height: 10,),
              _textTypeUser('Cliente'),
              SizedBox(height: 30,),
              _imageTypeUser(context, 'assets/img/driver.png'),
              SizedBox(height: 10,),
                _textTypeUser('Conductor')
            ],
          ),
        ),
      ),
    );
  }

  Widget _bannerApp (BuildContext context){
    return     ClipPath(
      clipper: DiagonalPathClipperTwo(),
      child: Container(
        color: Colors.white,
        height: MediaQuery.of(context).size.height *0.3,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/img/logo_app.png',
              width: 150,
              height: 100,
            ),
            Text(
              'Facil y Rápido',
              style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 22,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
}


  Widget _imageTypeUser(BuildContext context, String path){
    return GestureDetector(
      onTap: _con.goToLoginPage,
      child: CircleAvatar(
        backgroundImage: AssetImage(path),
        radius: 50,
        backgroundColor: Colors.grey[900],
      ),
    );
  }

  Widget _textRol(){
    return Text('SELECCIONA TU ROL',
      style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'OneDay'
      ),
    );
  }

  Widget _textTypeUser(String typeUser){
    return Text(
      typeUser,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16
        ),
    );
  }

}
