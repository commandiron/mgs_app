
import 'package:flutter/material.dart';

bool isKeyboardOpen(BuildContext context){
  return MediaQuery.of(context).viewInsets.bottom != 0;
}