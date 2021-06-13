import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:idle_population_clicker/models/kayitli.dart';
import 'package:idle_population_clicker/pages/istatistik.dart';
import 'package:idle_population_clicker/pages/loading_screen.dart';
import 'package:idle_population_clicker/pages/magaza.dart';
import 'package:idle_population_clicker/pages/simulasyon.dart';
import 'package:idle_population_clicker/services/database_helper.dart';
import 'pages/clicker.dart';
import 'package:idle_population_clicker/pages/diger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:after_layout/after_layout.dart';
import 'pages/baslangic.dart';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:slide_popup_dialog/slide_popup_dialog.dart' as slideDialog;

Timer timer;
int start = 3;
var irk_adi;

_read() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'my_int_key';
  final value = prefs.getString(key) ?? 0;
  print('read: $value');
  irk_adi='$value';
}
int nufus_sayisi;
int SeciliSayfa = 0;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(idle_population_clicker());
}

class idle_population_clicker extends StatefulWidget {
  @override
  _idle_population_clickerState createState() => _idle_population_clickerState();
}

class _idle_population_clickerState extends State<idle_population_clicker> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,          //debug yazısını kaldır
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  SplashState createState() => new SplashState();
}
class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      _read();
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Home()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new Baslangic()));
    }
  }
  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();
  @override
  Widget build(BuildContext context) {
    return LoadingScreen();
  }
}


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Kayitli kayitli=Kayitli();
  DatabaseHelper dbHelper;


  @override
  void initState() {
    getcount();
    super.initState();
    setState(() {
      dbHelper = DatabaseHelper.instance;
    });
  }
  @override
  Widget build(BuildContext context) {
    final _SayfaSecenekleri = [              //alt bardaki sayfalara gidilen yer
      clicker(),
      magaza(),
      simulasyon(),
      Istatistik(),
      Diger(),
    ];
      return Scaffold(
        body: _SayfaSecenekleri[SeciliSayfa],
        //body içerisini sayfa seceneklerinden seçili olan indekse göre body'e getiriyor
        bottomNavigationBar: ConvexAppBar(
          items: [ //alt bar itemlerinin ikon ve yazıları
            TabItem(icon: Icons.touch_app_rounded, title: 'Tıkla!'),
            TabItem(icon: Icons.store_rounded, title: 'Mağaza'),
            TabItem(icon: Icons.developer_board_rounded, title: 'Simülasyon'),
            TabItem(icon: Icons.timeline_rounded, title: 'İstatistik'),
            TabItem(icon: Icons.view_week_rounded, title: 'Diğer'),
          ],
          gradient: LinearGradient(
            colors: [Color(0xFFEC407A), //bottomnavigationbar gradient renkleri
              Color(0xFF15182D)],
            begin: Alignment.bottomCenter,
            stops: [
              0.0, 0.4
            ],
            end: Alignment.topCenter,
          ),
          height: 70,
          backgroundColor: Color(0xFFEC407A),
          //seçili sayfanın arkaplan rengini değiştir
          initialActiveIndex: 0,
          //başlangıçta seçili olan sayfanın indeksi
          onTap: (int i) {
            setState(() {
              SeciliSayfa =
                  i; //alt barda seçilen indeksli sayıyı seçilen sayfa olarak atıyor
            });
          },
        ),
      );
  }
}

