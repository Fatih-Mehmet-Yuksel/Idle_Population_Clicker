import 'package:flutter/material.dart';
import 'package:idle_population_clicker/app_bar.dart';
import 'package:idle_population_clicker/data.dart';

class magaza extends StatefulWidget {
  @override
  _magazaState createState() => _magazaState();
}

class _magazaState extends State<magaza> {
  List<Widget> itemsData=[];        //itemsdata isimli liste oluşturuldu

  void getPostData(){
    List<dynamic> responseList = TEK_KULLANIM_MAGAZA_DATA;
    List<Widget> listItems=[];
    responseList.forEach((post) {
      listItems.add(Container(
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
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),//or 15.0
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(post["gorsel"]),
                            fit: BoxFit.cover,    //box a aldığımız gifi tamamına sığdıracak şekilde genişletiyor
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(post["üstbaslik"],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'nasalization',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
                              fontSize: 8,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),//or 15.0
                  child: Container(
                    height: 80.0,
                    width: 110.0,
                    child: ElevatedButton(
                      child: Text('Satın al',style: TextStyle(fontFamily: 'nasalization'),),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFA1B83),
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                      ),
                      onPressed: (){
                        print("öge alındı");
                      },
                    ),
                  ),
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
  void getPostData2(){    //2.mağaza item içeriği
    List<dynamic> responseList = GELISTIRMELER;
    List<Widget> listItems2=[];
    responseList.forEach((post) {
      listItems2.add(Container(
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
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),//or 15.0
                      child: Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(post["gorsel"]),
                            fit: BoxFit.cover,    //box a aldığımız gifi tamamına sığdıracak şekilde genişletiyor
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 150,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Text(post["üstbaslik"],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: 'nasalization',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
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
                              fontSize: 8,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),//or 15.0
                  child: Container(
                    height: 80.0,
                    width: 110.0,
                    child: ElevatedButton(
                      child: Text('Satın al',
                      style: TextStyle(fontFamily: 'nasalization'),),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xFFFA1B83),
                        onPrimary: Colors.white,
                        onSurface: Colors.grey,
                      ),
                      onPressed: (){
                        getPostData();
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      );
      setState(() {
        itemsData=listItems2;
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
          MyAppBar(),
          Divider(
            color: Colors.transparent,
            height: 20,
            thickness: 5,
            indent: 20,
            endIndent: 0,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: itemsData.length,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return itemsData[index];
                  }),
          ),
          Container(
            width: 400,
            height: 65,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFEF9A9A),Color(0xFF80CBC4)],
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
              borderRadius: BorderRadius.all(Radius.circular(10)),  //köşelerin yuvarlaklık oranı
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: Container(
                      //width: 181,
                        height: 65,
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                              width: 0.2,
                            )
                        ),
                          child: ElevatedButton(
                            child: Text('1.mağaza',style: TextStyle(fontFamily: 'nasalization'),),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.transparent,
                              onPrimary: Colors.white,
                              onSurface: Colors.grey,
                              elevation: 0,
                            ),
                            onPressed: (){
                              getPostData();
                            },
                          )
                    ),
                ),
                Expanded(
                    child: Container(
                      //width: 181,
                      height: 65,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 0.2,
                          )
                      ),
                      child: ElevatedButton(
                        child: Text('İiknci Mağaza',style: TextStyle(fontFamily: 'nasalization'),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                          elevation: 0,
                        ),
                        onPressed: (){
                          getPostData2();
                        },
                      ),
                    )
                )

              ],
            ),
          )
      ],
      ),
    );
  }
}
