import 'package:flutter/material.dart';

class Hakkimizda extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF99153F),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundImage: AssetImage("lib/image/avatar.png"),
            backgroundColor: Colors.white,
            radius: 85,
          ),
          Text(
            "Fatih Mehmet Yüksel",
            style: TextStyle(
                color: Colors.white, fontSize: 40, fontFamily: "pacifico"),
          ),
          Text(
            "FLUTTER DEVELOPER",
            style: TextStyle(
                color: Colors.teal[50],
                fontSize: 20,
                fontFamily: "SansPro",
                letterSpacing: 1),
          ),
          Divider(
            thickness: 1,
            color: Colors.teal[50],
            indent: 70,
            endIndent: 70,
            height: 40,
          ),
          Container(
            padding: EdgeInsets.only(left: 20,right: 10),
            child: Text(
              "Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3301456 kodlu MOBİL PROGRAMLAMA dersi "
                  "kapsamında 203301097 numaralı Fatih Mehmet Yüksel tarafından 30 Nisan 2021 günü yapılmıştır.",
              style: TextStyle(
                  color: Colors.teal[50],
                  fontSize: 20,
                  fontFamily: "SansPro",
                  letterSpacing: 1),
            ),
          ),
        ],
      ),
    );
  }
}