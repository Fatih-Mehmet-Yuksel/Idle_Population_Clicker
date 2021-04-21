import 'package:flutter/material.dart';
import 'package:idle_population_clicker/main.dart';

class Istatistik extends StatefulWidget {
  @override
  _IstatistikState createState() => _IstatistikState();
}

class _IstatistikState extends State<Istatistik> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/upgrade.gif'),
          fit: BoxFit.cover,    //box a aldığımız gifi tamamına sığdıracak şekilde genişletiyor
        ),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(top: 50,bottom: 10),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hesap başlangıcı : ',style: TextStyle(color: Colors.white70,fontFamily: 'nasalization'),),
                Text('Anlık simulasyonda biriken nüfus : ',style: TextStyle(color: Colors.white70,fontFamily: 'nasalization'),),
                Text('$nufus_sayisi',style: TextStyle(color: Colors.white,fontFamily: 'nasalization',fontWeight: FontWeight.bold),),
                Text('Şuana kadar biriktirilen nüfus : ',style: TextStyle(color: Colors.white70,fontFamily: 'nasalization'),),
                Text('Saniyede kazanılan nüfus : ',style: TextStyle(color: Colors.white70,fontFamily: 'nasalization'),),
                Text('Tıklama başına gelen nüfus : ',style: TextStyle(color: Colors.white70,fontFamily: 'nasalization'),),
                Text('Tıklayarak gelen ek nüfus : ',style: TextStyle(color: Colors.white70,fontFamily: 'nasalization'),),
                Text('İzlenen reklam sayısı : ',style: TextStyle(color: Colors.white70,fontFamily: 'nasalization'),),
                Text('Sahip olunan yapılar : ',style: TextStyle(color: Colors.white70,fontFamily: 'nasalization'),),
                Text('Geliştirmeler : ',style: TextStyle(color: Colors.white70,fontFamily: 'nasalization'),),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              child: Text('Başarımları göster',style: TextStyle(fontFamily: 'nasalization',fontSize: 17),),
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFEC407A).withOpacity(0.7),
                onPrimary: Colors.white,
                onSurface: Colors.grey,
              ),
              onPressed: (){

              },
            ),
          ),
        ],
      ),
    );
  }
}
