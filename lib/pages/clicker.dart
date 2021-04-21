import 'package:flutter/material.dart';
import '../main.dart';
import '../app_bar.dart';


class clicker extends StatefulWidget {
  @override
  _clickerState createState() => _clickerState();
}

class _clickerState extends State<clicker> {
  void nufusu_artir(){  //nüfus artışını sağlayan fonksiyon
    setState(() {
      nufus_sayisi=nufus_sayisi+1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        nufusu_artir();   //tıklamada nüfus artışı
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/source.gif'),
            fit: BoxFit.cover,    //box a aldığımız gifi tamamına sığdıracak şekilde genişletiyor
          ),
        ),
        child: Column(
          children: [
            MyAppBar(),
            Divider(
              color: Colors.transparent,
              height: 20,
              thickness: 5,
              indent: 20,
              endIndent: 0,
            ),
          ],
        ),
      ),
    );
  }
}
