import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_clone/src/pages/pages.login/login_controller.dart';
import 'package:uber_clone/src/pages/register/register_controller.dart';
import 'package:uber_clone/src/utils/colors.dart' as utils;
import 'package:uber_clone/src/widgets/button_app.dart';

class RegisterPage extends StatefulWidget {

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterController _con = new RegisterController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('INIT STATE');

    SchedulerBinding.instance.addPersistentFrameCallback((timeStamp) {
      _con.init(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children:[
            _bannerApp(),
            _textLogin(),

            _textFieldUserName(),
            _textFieldEmail(),
            _textFieldPassword(),
            _textFieldConfirmPassword(),
            _buttonRegister(),

          ],
        ),
      ),
    );
  }


  Widget _buttonRegister(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: ButtonApp(
          onPressed: _con.register,
          text: 'Registrar ahora',
          color: utils.Colors.uberCloneColor,
          textColor: Colors.white,
      ),
    );
  }

  Widget _textFieldUserName(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        controller: _con.userNameController,
        decoration: InputDecoration(
          hintText: 'Pepito Perez',
          labelText: 'Nombre de Usuario',
          suffixIcon: Icon(
            Icons.person_outline,
            color: utils.Colors.uberCloneColor,
          ),
        ),
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: _con.emailController,
        decoration: InputDecoration(
            hintText: 'correo@gmail.com',
            labelText: 'Correo electronico',
            suffixIcon: Icon(
              Icons.email_outlined,
              color: utils.Colors.uberCloneColor,
            ),
        ),
      ),
    );
  }


  Widget _textFieldPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        obscureText: true,
        controller: _con.passwordController,
        decoration: InputDecoration(
            labelText: 'Contraseña',
            suffixIcon: Icon(
              Icons.lock_open_outlined,
              color: utils.Colors.uberCloneColor,
            ),
        ),
      ),
    );
  }

  Widget _textFieldConfirmPassword(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: TextField(
        obscureText: true,
        controller: _con.confirmPasswordController,
        decoration: InputDecoration(
          labelText: 'Confirmar contraseña',
          suffixIcon: Icon(
            Icons.lock_open_outlined,
            color: utils.Colors.uberCloneColor,
          ),
        ),
      ),
    );
  }





  Widget _textLogin(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Text(
        'REGISTRO',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),
      ),
    );
  }

  Widget _bannerApp (){
    return     ClipPath(
      clipper: WaveClipperTwo(),
      child: Container(
        color: utils.Colors.uberCloneColor,
        height: MediaQuery.of(context).size.height *0.22,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            )
          ],
        ),
      ),
    );
  }
}
