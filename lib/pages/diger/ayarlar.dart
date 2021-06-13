import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'hakkimizda.dart';
import 'kayitli_sil.dart';
import 'versiyon_gecimisi.dart';
import 'hava_durumu.dart';
import '../loading_screen.dart';
import 'package:idle_population_clicker/graphic.dart';

class ayarlar extends StatefulWidget {
  @override
  _ayarlarState createState() => _ayarlarState();
}
bool state;

class Ayar extends StatelessWidget {
  final String ayartexti;
  final Function switchfonksiyonu;
  final double padding;
  const Ayar(this.ayartexti,this.switchfonksiyonu,this.padding);
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.ideographic,
      children: [
        Container(
              padding: EdgeInsets.only(left: 10),
              child: Text(ayartexti,style: TextStyle(fontSize: 24,fontFamily: 'nasalization',color: Color(0xFFEC407A)),)
          ),
        Container(
            padding: EdgeInsets.only(left: padding,top: 120),
            child: LiteRollingSwitch(
              //initial value
              value: true,
              textOn: 'Açık',
              textOff: 'Kapalı',
              colorOn: Color(0xFFEC407A),
              colorOff: Colors.grey,
              iconOn: Icons.volume_up_rounded,
              iconOff: Icons.volume_off_rounded,
              textSize: 19.0,
              onChanged: (bool state) {
                //Use it to manage the different states
                switchfonksiyonu;
              },
            ),
          ),
      ],
    );
  }
}

class ayaricerik extends StatefulWidget {
  @override
  _ayaricerikState createState() => _ayaricerikState();
}

class _ayaricerikState extends State<ayaricerik> {
  @override

  Widget build(BuildContext context) {
    return Material(     //yazıların altında sarı çizgiler olmasın diye kullanıldı
      child: Container(
        child: Column(
          children: [
            Ayar('Müzik',()=> print('Current State of SWITCH IS: $state'),150),
            Ayar('Efekt Sesleri',()=> print('Current State of SWITCH IS: $state'),70),
          ],
        ),
        color: Colors.black,
      ),
    );;
  }
}



class _ayarlarState extends State<ayarlar> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 1,
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
