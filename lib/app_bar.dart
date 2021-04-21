import 'package:flutter/material.dart';
import 'main.dart';

class MyAppBar extends AppBar{
  MyAppBar({Widget title}) : super(backgroundColor: Colors.transparent,elevation: 0,
    toolbarHeight: 95,
    title: Center(
      child: Text(
        '$nufus_sayisi'+'\n'+'$irk_adi',
        textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontFamily: 'nasalization',
          fontSize: 35,
        ),
      ),
    ),
  );
}