import 'package:flutter/material.dart';
import 'package:idle_population_clicker/pages/diger/versiyon_gecimisi.dart';
import 'diger/ayarlar.dart';
import 'diger/hakkimizda.dart';
import 'diger/kayitli_sil.dart';

class MyVerticalText extends StatelessWidget {   //üstten aşağı yönlü yazı yazmak için gerekli sınıf
  final String text;

  const MyVerticalText(this.text);

  @override
  Widget build(BuildContext context) {
    return Wrap(       //üstten alta yazı kodu
      runSpacing: 30,
      direction: Axis.vertical,
      alignment: WrapAlignment.center,
      children: text.split("").map((string) => Text(string, style: TextStyle(fontSize: 22,fontFamily: 'nasalization',
        fontWeight: FontWeight.bold,))).toList(),
    );
  }
}

class DigerButtonu extends StatelessWidget {     //butonun özelliklerini taşıyan ve sadece yazı ikon ve fonksiyon değişikliğini sağlayan sınıf
  final String butonyazisi;
  final IconData butoniconu;
  final Function butonfonksiyonu;
  const DigerButtonu(this.butonyazisi,this.butonfonksiyonu,this.butoniconu);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 550,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(0xFF15182D).withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(4,4),
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10)),
          border: Border.all(
            color: Colors.black,
            width: 0.2,
          )
      ),
      child: ElevatedButton(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(butoniconu, color: Colors.white,size: 22,),
            MyVerticalText(butonyazisi),
            Icon(butoniconu, color: Colors.white,size: 22,),
          ],
        ),
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF15182D),
          onPrimary: Colors.white,
          onSurface: Colors.grey,
          //elevation: 0,
        ),
        onPressed: butonfonksiyonu,
      ),
    );
  }
}


class Diger extends StatefulWidget {
  @override
  _DigerState createState() => _DigerState();
}

class _DigerState extends State<Diger> {
  List<Color> colorList = [
    Color(0xFFEC407A),
    Color(0xFF80CBC4),
    Color(0xFF9640EC),
    Color(0xFFF1A6C2)
  ];
  List<Alignment> alignmentList = [
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.topRight,
    Alignment.topLeft,
  ];
  int index = 0;
  Color bottomColor = Color(0xFF000000);
  Color topColor = Color(0xFF000000);
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        bottomColor = Color(0xFFEC407A);
      });
    });
    return Scaffold(
        body: Stack(
          children: [
            SizedBox.expand(
              child: AnimatedContainer(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DigerButtonu('    AYARLAR     ', ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ayarlar())),Icons.settings_rounded),
                    DigerButtonu('VERSİYON GEÇMİŞİ', ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Versiyon_Gecmisi())),Icons.timer_rounded),
                    DigerButtonu(' KAYITLIYI SİL  ', ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>KayitSil())),Icons.delete_forever_rounded),
                    DigerButtonu('   HAKKIMIZDA   ', ()=> Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Hakkimizda())),Icons.contact_mail_rounded),
                  ],
                ),
                duration: Duration(seconds: 2),
                onEnd: () {
                  setState(() {
                    index = index + 1;
                    // animate the color
                    bottomColor = colorList[index % colorList.length];
                    topColor = colorList[(index + 1) % colorList.length];

                    //// animate the alignment
                    // begin = alignmentList[index % alignmentList.length];
                    // end = alignmentList[(index + 2) % alignmentList.length];
                  });
                },
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: begin, end: end, colors: [bottomColor, topColor])),
              ),
            )
          ],
        ));
  }
}