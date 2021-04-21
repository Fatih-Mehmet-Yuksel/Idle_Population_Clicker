import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:idle_population_clicker/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Baslangic extends StatefulWidget {
  @override
  _BaslangicState createState() => _BaslangicState();
}

class _BaslangicState extends State<Baslangic> {
  bool _visible = false;
  int tiksayisi=0;
  TextEditingController inputcontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: Center(
        child: InkWell(
          onTap: (){
            Future.delayed(const Duration(milliseconds: 500), () {
              if(tiksayisi == 0){
              setState(() {
                _visible = !_visible;
              });
              tiksayisi++;
            }}
            );   //tıklamada nüfus artışı
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.only(top: 250),
            color: Color(0xFFFFFFFF),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    child: TextLiquidFill(
                      text: 'HOŞGELDİN!',
                      waveColor: Color(0xFF000000),
                      waveDuration: Duration(milliseconds: 3000),
                      boxBackgroundColor: Color(0xFFFFFFFF),
                      textStyle: TextStyle(
                        fontSize: 50.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'nasalization',
                      ),
                      boxHeight: 100.0,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 60),
                    child: AnimatedOpacity(
                      // If the widget is visible, animate to 0.0 (invisible).
                      // If the widget is hidden, animate to 1.0 (fully visible).
                      opacity: _visible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 500),
                      // The green box must be a child of the AnimatedOpacity widget.
                      child: Column(
                        children: [
                          Text('Lütfen yönetmek istediğiniz ırk/topluluk adını seçiniz',style:
                          TextStyle(fontFamily: 'nasalization',fontSize: 12),),
                          Padding(
                            padding: const EdgeInsets.only(right: 20,left: 20,top: 10),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0XFFEFF3F6),
                                //borderRadius: BorderRadius.circular(100.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF91F6DA).withOpacity(0.6),
                                    offset: Offset(6,2),
                                    blurRadius: 6.0,
                                    spreadRadius: 3.0
                                  ),
                                  BoxShadow(
                                      color: Color(0xFFFDADC0).withOpacity(0.5),
                                      offset: Offset(-6,-2),
                                      blurRadius: 6.0,
                                      spreadRadius: 3.0
                                  )
                                ]
                              ),
                              child: TextField(
                                controller: inputcontroller,
                                maxLength: 14,
                                decoration: InputDecoration(
                                  counterText: '',
                                  border: InputBorder.none,
                                  hintText: 'Örnek: Dünyalı',
                                  hintStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20,left: 20,top: 20),
                            child: Container(
                              width: 600,
                              height: 50,
                              child: ElevatedButton(
                                child: Center(child: Text('Oyuna Başla!',style: TextStyle(fontFamily: 'nasalization',color: Colors.white,fontSize: 16),)),
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xFFFA1B83),
                                  onPrimary: Colors.white,
                                  onSurface: Colors.grey,
                                  side: BorderSide(color: Color(0xFFFA1B83))
                                ),
                                onPressed: (){
                                  setState(() {
                                    irk_adi=inputcontroller.text;
                                    save();
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(builder: (context) => Home()),
                                          (Route<dynamic> route) => false,
                                    );
                                  });
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
save() async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'my_int_key';
  final value = irk_adi;
  prefs.setString(key, irk_adi);
  print('saved $value');
}
