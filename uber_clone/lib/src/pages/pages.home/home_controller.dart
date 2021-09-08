import 'package:flutter/material.dart';
import 'package:uber_clone/src/utils/shared_pref.dart';

class HomeController{
  BuildContext context;
  SharedPref _sharedPref;

  Future init(BuildContext context){
    this.context = context;
    _sharedPref = new SharedPref();
  }

  void goToLoginPage(String typeUser){
    saveTypeUserUser(typeUser);
    Navigator.pushNamed(context, 'login');
  }

  void saveTypeUserUser(String typeUser) async{
    await _sharedPref.save('typeUser', typeUser);
  }



}