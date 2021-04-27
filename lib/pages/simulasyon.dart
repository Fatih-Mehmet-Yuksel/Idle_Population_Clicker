import 'package:flutter/material.dart';

class simulasyon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/simulasyon.gif'),
            fit: BoxFit.cover,    //box a aldığımız gifi tamamına sığdıracak şekilde genişletiyor
          ),
        ),
        child: Center(
          child: Text("Çok yakında",
            style: TextStyle(
              fontFamily: 'nasalization',
              fontSize: 35,
              color: Color(0xFF61A0B3),
            ),
          ),
        ),
      ),
    );
  }
}
