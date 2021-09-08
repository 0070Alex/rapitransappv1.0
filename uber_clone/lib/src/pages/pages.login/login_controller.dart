import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:uber_clone/src/providers/auth_provider.dart';
import 'package:uber_clone/src/utils/my_progress_dialog.dart';
import 'package:uber_clone/src/utils/shared_pref.dart';
import 'package:uber_clone/src/utils/snackbar.dart' as utils;

class LoginController {
  BuildContext context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  AuthProvider _authProvider;
  ProgressDialog _progressDialog;
  SharedPref _sharedPref;
  String _typeUser;

  Future init(BuildContext context) async{
    this.context = context;
    _authProvider = new AuthProvider();
    _progressDialog = MyProgresDialg.createProgressDialog(context, 'Espere un momento...');
    _sharedPref = new SharedPref();
    _typeUser = await _sharedPref.read('typeUser');

    print('===========TIPI USUARIO==========');
    print(_typeUser);
  }

  void goToRegisterPage(){

    if(_typeUser == 'client'){
      Navigator.pushNamed(context, 'client/register');
    }else{
      Navigator.pushNamed(context, 'driver/register');
    }



  }

  void login() async{
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    _progressDialog.show();

    try{

      bool isLogin = await _authProvider.login(email, password);
      _progressDialog.hide();

      if(isLogin){
        print('El usuario esta logueado');
        utils.Snackbar.showSnackbar(context, key, "El usuario esta logueado");
      }else{

        utils.Snackbar.showSnackbar(context, key, "El usuario no esta autenticado");
        print('El usuario no esta autenticado');
        _progressDialog.hide();

      }
    }catch(error){

      utils.Snackbar.showSnackbar(context, key, "Error: $error");
      _progressDialog.hide();
      print('Error: $error');

    }



  }
}