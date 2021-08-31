import 'package:flutter/material.dart';
import 'package:uber_clone/src/providers/auth_provider.dart';

class RegisterController {
  BuildContext context;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController userNameController = new TextEditingController();
  TextEditingController confirmPasswordController = new TextEditingController();

  AuthProvider _authProvider;


  Future init(BuildContext context){
    this.context = context;
    _authProvider = new AuthProvider();

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
      return;

    }
    if(confirmPassword != password){
      print('Contraseña no coincie');
      return;
    }

    if(password.length<6){
      print('El password debe tener al menos 6 caracteres');
      return;
    }

    try{
      bool isRegister = await _authProvider.register(email, password);
      if(isRegister){
        print('El usuario se registro con exito');
      }else{
        print('El usuario no se registro');
      }
    }catch(error){
      print('Error: $error');
    }



  }
}