import 'package:flutter/material.dart';
import 'package:flutter_tank_rehberi/models/tank.dart';
import 'package:flutter_tank_rehberi/utils/strings.dart';


class TankListesi extends StatelessWidget {

  static List<Tank> tumTanklar;

  @override

  Widget build(BuildContext context) {

    tumTanklar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(title: Text("Tank Rehberi"),),
      body: listeyiHazirla(),
    );
  }

  List<Tank> veriKaynaginiHazirla() {

    List<Tank> tanklar = [];
    for(int i= 0;i < 12; i++){

      String kucukResim = Strings.TANK_ADLARI[i].toLowerCase()+"${i+1}.png";
      String buyukResim = Strings.TANK_ADLARI[i].toLowerCase()+"_buyuk"+"${i+1}.png";

      Tank eklenecekTank = Tank(Strings.TANK_ADLARI[i],Strings.TANK_TARIHLERI[i],Strings.TANK_GENEL_OZELLIKLERI[i],kucukResim,buyukResim);
      tanklar.add(eklenecekTank);

    }

    return tanklar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(itemBuilder: (BuildContext context, int index){
      return tekSatirTank(context, index);
    },
      itemCount: tumTanklar.length,
    );
  }

  Widget tekSatirTank(BuildContext context, int index) {

    Tank oanListeyeEklenenTank=tumTanklar[index];

    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          onTap: ()=> Navigator.pushNamed(context, "/TankDetay/$index"),
          //onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=>TankDetay($index))),
          leading: Image.asset("images/"+oanListeyeEklenenTank.tankKucukResim,
            width: 64,
            height: 64,),
          title: Text(
            oanListeyeEklenenTank.tankAdi,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w400,
                color: Colors.pink.shade600),
          ),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              oanListeyeEklenenTank.tankTarihi,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios,color: Colors.pink,),
        ),
      ),
    );
  }
}
