import 'package:flutter/material.dart';
import 'package:slider_button/slider_button.dart';
import 'ayarlar.dart';
import 'hakkimizda.dart';
import 'versiyon_gecimisi.dart';
import 'hava_durumu.dart';
import '../loading_screen.dart';

class KayitSil extends StatefulWidget {
  @override
  _KayitSilState createState() => _KayitSilState();
}

class KayitSilicerik extends StatefulWidget {
  @override
  _KayitSilicerikState createState() => _KayitSilicerikState();
}

class _KayitSilicerikState extends State<KayitSilicerik> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/blackhole.gif'),
            fit: BoxFit.cover,    //box a aldığımız gifi tamamına sığdıracak şekilde genişletiyor
          ),
        ),
        child: Container(
          margin: EdgeInsets.only(top: 250,bottom: 200),
          color: Colors.black.withOpacity(0.8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(30),
                child: Text(
                  'Kayıtlıyı silmek istediğinizden emin misiniz?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "SansPro",
                      letterSpacing: 1
                  ),
                ),
              ),
              SliderButton(
                action: () {
                  ///Do something here
                  Navigator.of(context).pop();
                },
                label: Text(
                  "Silmek için Kaydır!",
                  style: TextStyle(
                      color: Color(0xff4a4a4a), fontWeight: FontWeight.w500, fontSize: 17),
                ),
                icon: Text(
                  "x",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 44,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class _KayitSilState extends State<KayitSil> {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 3,
    );
    final pageView=PageView(
      controller: controller,
      children: [
        LoadingScreen(),
        ayaricerik(),
        Versiyon_Gecmisiicerik(),
        KayitSilicerik(),
        Hakkimizdaicerik(),
      ],
    );
    return pageView;
  }
}
