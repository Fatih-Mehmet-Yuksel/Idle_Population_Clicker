import 'package:flutter/material.dart';
import 'package:idle_population_clicker/data.dart';
import 'ayarlar.dart';
import 'kayitli_sil.dart';
import 'hakkimizda.dart';
import 'hava_durumu.dart';
import '../loading_screen.dart';

class Versiyon_Gecmisi extends StatefulWidget {
  @override
  _Versiyon_GecmisiState createState() => _Versiyon_GecmisiState();
}
class Versiyon_Gecmisiicerik extends StatefulWidget {
  @override
  _Versiyon_GecmisiicerikState createState() => _Versiyon_GecmisiicerikState();
}

class _Versiyon_GecmisiicerikState extends State<Versiyon_Gecmisiicerik> {
  List<Widget> itemsData=[];

  void getPostData(){
    List<dynamic> responseList = VERSIYON_GECMISI;
    List<Widget> listItems=[];
    responseList.forEach((post) {
      listItems.add(Container(                                                 //BURAYI SINIF YAPISINA ÇEVİR MEHMET
        margin: const EdgeInsets.only(bottom: 10,top: 10),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0XFF1A237E),Color(0xFFEC407A)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFEC407A).withOpacity(0.4),
              blurRadius: 8,
              spreadRadius: 2,
              offset: Offset(4,4),

            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      width: 300,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Center(
                              child: Text(post["üstbaslik"],
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontFamily: 'nasalization',
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black45,
                            height: 5,
                            thickness: 2,
                            indent: 0,
                            endIndent: 0,
                          ),
                          Text(post["altbaslik"],
                            style: TextStyle(
                              fontFamily: 'nasalization',
                              fontSize: 11,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      );
      setState(() {
        itemsData=listItems;
      });
    });
  }
  @override
  void initState(){
    super.initState();
    getPostData();
  }
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/upgrade.gif'),   //arkaplan resmi
          fit: BoxFit.cover,    //box a aldığımız gifi tamamına sığdıracak şekilde genişletiyor
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: itemsData.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index){
                  return itemsData[index];
                }),
          ),
        ],
      ),
    );
  }
}


class _Versiyon_GecmisiState extends State<Versiyon_Gecmisi> {
  @override
  Widget build(BuildContext context) {
    final controller = PageController(
      initialPage: 2,
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


