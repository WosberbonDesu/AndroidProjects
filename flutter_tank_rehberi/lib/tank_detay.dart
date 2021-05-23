import 'package:flutter/material.dart';
import 'package:flutter_tank_rehberi/models/tank.dart';
import 'package:flutter_tank_rehberi/tank_liste.dart';
import 'package:palette_generator/palette_generator.dart';


class TankDetay extends StatefulWidget {
  int gelenIndex;

  TankDetay(this.gelenIndex);

  @override
  _TankDetayState createState()  {
    return new _TankDetayState();
  }
}

class _TankDetayState extends State<TankDetay> {
  Tank secilenTank;
  Color baskinRenk;
  PaletteGenerator paletteGenerator;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenTank=TankListesi.tumTanklar[widget.gelenIndex];
    baskinRengiBul();
  }

  void baskinRengiBul(){
    Future<PaletteGenerator> fPaletteGenerator = PaletteGenerator.fromImageProvider(AssetImage("images/"+secilenTank.tankBuyukResim));
    fPaletteGenerator.then((value) {
      paletteGenerator = value;
      debugPrint("Secilen Renk"+ paletteGenerator.dominantColor.color.toString());
      setState(() {
        
        baskinRenk = paletteGenerator.vibrantColor.color;

      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      primary: true,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            pinned: true,
            primary: true,
            backgroundColor: baskinRenk != null ? baskinRenk : Colors.pink,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset("images/"+secilenTank.tankBuyukResim, fit: BoxFit.cover,),
              centerTitle: true,
              title: Text(secilenTank.tankAdi+" Tankı ve Özellikleri"),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.shade200,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: SingleChildScrollView(
                child: Text(secilenTank.tankDetay,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black26),
                ),
              ),
            ),
          )
        ],
      ),
    );

  }
}

