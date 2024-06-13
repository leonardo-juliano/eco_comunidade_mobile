import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';


abstract class _LoginBase with Store {
  @observable
  bool isLogin = true;


  
}
