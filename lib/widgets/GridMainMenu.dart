import 'package:flutter/material.dart';


class GridMainMenu extends StatelessWidget {

  final List<String> _listImage = [
    'bimtek.png',
    'kelas.png',
    'pbb.png',
    'lainnya.png'
  ];

  Widget _cardMenu(BuildContext ctx,Size constraint,String text,String image,String url,Object args) {
    return InkWell(
      highlightColor: Colors.grey,
      onTap: () {
        Navigator.of(ctx).pushNamed(url,arguments: args);
      },
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          width: constraint.width * 0.4,
          height: constraint.height * 0.25,
          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget> [
                Image.asset(
                  'assets/images/$image',
                  height: constraint.height * 0.16,
                  width: double.infinity,
                  alignment: Alignment.topCenter,
                ),
                FittedBox(
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600
                    ),),
                )
              ],
            ),
          ),
        ),
      );
    } 


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      width: media.width,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                this._cardMenu(context,media, 'Bimtek E-filing', this._listImage[0],'/list-sosis','bimtek'),
                SizedBox(width: media.width * 0.04,),
                this._cardMenu(context,media, 'Kelas Pajak', this._listImage[1],'/list-sosis','kelas'),           
              ],
            ),
            SizedBox(height: media.height * 0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget> [
                this._cardMenu(context,media, 'PBB Sektor Lainnya', this._listImage[2],'/login','bimtek'),
                SizedBox(width: media.width * 0.04,),
                this._cardMenu(context,media, 'Konsultasi Lainnya', this._listImage[3],'/','bimtek'),           
              ],
            ),

          ]
        ),
    );


  }
}