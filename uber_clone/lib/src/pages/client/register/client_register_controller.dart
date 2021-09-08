import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:uber_clone/src/models/client.dart';
import 'package:uber_clone/src/providers/auth_provider.dart';
import 'package:uber_clone/src/providers/client_provider.dart';
import 'package:uber_clone/src/utils/my_progress_dialog.dart';
import 'package:uber_clone/src/utils/snackbar.dart' as utils;


class ClientRegisterController {
  BuildContext context;
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  AuthProvider _authProvider;
  ClientProvider _clientProvider;
  ProgressDialog _progressDialog;


  Future init(BuildContext context){
    this.context = context;
    _authProvider = new AuthProvider();
    _clientProvider = new ClientProvider();
    _progressDialog = MyProgresDialg.createProgressDialog(context, "Espere un momento...");

  }

  void register() async{
    String userName = userNameController.text;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email: $email');
    print('Password: $password');

    if(userName.isEmpty && email.isEmpty && password.isEmpty && confirmPassword.isEmpty){
      print('Debe ingresar todos los datos');
      utils.Snackbar.showSnackbar(context, key, "Debe ingresar todos los campos");
      return;

    }
    if(confirmPassword != password){
      print('Contraseña no coincie');
      utils.Snackbar.showSnackbar(context, key, "Contraseña no coincie");
      return;
    }

    if(password.length<6){
      print('El password debe tener al menos 6 caracteres');
      utils.Snackbar.showSnackbar(context, key, "El password debe tener al menos 6 caracteres");
      return;
    }

    _progressDialog.show();

    try{
      bool isRegister = await _authProvider.register(email, password);
      if(isRegister){
        Client client = new Client(
          id: _authProvider.getUser().uid,
          email: _authProvider.getUser().email,
          username: userName,
          password: password
        );

        await _clientProvider.create(client);
        _progressDialog.hide();
        utils.Snackbar.showSnackbar(context, key, "El usuario se registro con exito");

        print('El usuario se registro con exito');
      }else{
        _progressDialog.hide();
        print('El usuario no se registro');
      }
    }catch(error){
      _progressDialog.hide();
      print('Error: $error');
    }



  }
}