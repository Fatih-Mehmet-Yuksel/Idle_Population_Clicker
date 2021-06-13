class Kayitli{
  static const tblKayitli='Kayitlilar';
  static const colId='id';
  static const colToplam_nufus='toplam_nufus';
  static const colSaniyede_gelen_nufus='saniyede_gelen_nufus';


  Kayitli({this.id,this.toplam_nufus,this.saniyede_gelen_nufus});

  Kayitli.fromMap(Map<String,dynamic> map){
    id=map[colId];
    toplam_nufus=map[colToplam_nufus];
    saniyede_gelen_nufus=map[colSaniyede_gelen_nufus];

  }

  int id=1;
  int toplam_nufus;
  int saniyede_gelen_nufus;

  Map<String,dynamic> toMap(){
    var map = <String,dynamic>{colToplam_nufus:toplam_nufus,colSaniyede_gelen_nufus:saniyede_gelen_nufus};
    if(id !=null) map[colId]=id;
    return map;
  }

}