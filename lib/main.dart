import 'package:flutter/material.dart';
import 'package:weddy/app/app_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

/*
  InjectShared Preferecnes plugin
  so we can save data to the device's memory
  eg: the user token after authentication, so we can keep the user authenticated
*/
void main() => runApp(ModularApp(module: AppModule()));