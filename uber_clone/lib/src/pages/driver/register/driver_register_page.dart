import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:uber_clone/src/pages/driver/register/driver_register_controller.dart';


import 'package:uber_clone/src/utils/colors.dart' as utils;
import 'package:uber_clone/src/utils/otp_widget.dart';
import 'package:uber_clone/src/widgets/button_app.dart';

class DriverRegisterPage extends StatefulWidget {

  @override
  _DriverRegisterPageState createState() => _DriverRegisterPageState();
}

class _DriverRegisterPageState extends State<DriverRegisterPage> {

 DriverRegisterController _con = new DriverRegisterController();

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
      key: _con.key,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children:[
            _bannerApp(),
            _textLogin(),
            _textLicencePlate(),
            Container(
              child: OTPFields(
                pin1: _con.Pin1Controller,
                pin2: _con.Pin2Controller,
                pin3: _con.Pin3Controller,
                pin4: _con.Pin4Controller,
                pin5: _con.Pin5Controller,
                pin6: _con.Pin6Controller,
                pin7: _con.Pin7Controller,
                pin8: _con.Pin8Controller,
              ),
            ),
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

  Widget _textLicencePlate(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        'Placa del vehículo',
        style: TextStyle(
          color: Colors.grey[700],
          fontSize: 17
        ),
      ) ,
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
