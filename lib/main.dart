import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poke_app/app/poke_app.dart';

void main() {
  runApp(const PokeApp());
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
}
