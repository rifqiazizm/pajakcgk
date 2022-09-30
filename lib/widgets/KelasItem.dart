import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class KelasItem extends StatelessWidget {
  // final _color = Color.fromRGBO(33, 43, 96,1 );

  final Size media;
  final String id;
  final String namaSosis;
  final String mediaKelas;
  final String jamMulai;
  final String jamSelesai;
  final DateTime tanggal;

  KelasItem({
    this.id,
    this.media,
    this.namaSosis,
    this.mediaKelas,
    this.jamMulai,
    this.jamSelesai,
    this.tanggal
  });

  final _colorBimtek = [
    Color.fromRGBO(33, 43, 96, 1).withOpacity(0.4),
    Color.fromRGBO(33, 43, 96, 1),
  ];

  final _colorKelas = [Colors.amber, Colors.amber.withOpacity(0.1)];

  @override
  Widget build(BuildContext context) {
    final bulan = DateFormat.MMMM().format(this.tanggal).toString();
    final tgl = DateFormat.d().format(this.tanggal).toString();
    return InkWell(
        onTap: () {
          Navigator.of(context).pushNamed('/detail-kelas',arguments: {
            'id' : this.id,
            'terdaftar' : false
          });
        },
        child: Hero(
          tag: this.id,
          child: Card(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Expanded(
                child: Container(
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15)),
                      gradient: LinearGradient(
                          colors: this._colorBimtek,
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          stops: [0.1,0.7])),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        width: this.media.width * 0.39,
                        top: 5,
                        left: 5,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
                                color: Colors.black26,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text(
                                    this.mediaKelas,
                                    style: TextStyle(
                                        color: Colors.white70, fontSize: 14),
                                  ),
                                ),
                              ),
                            ]),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(vertical: this.media.height * 0.025,horizontal: 10),
                        // decoration: BoxDecoration(
                        //   border: Border.all(color: Colors.red,width: 5)
                        // ),
                        alignment: Alignment.bottomCenter,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                tgl,
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 65
                                )
                              ),
                              Text(
                                bulan,
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 25
                                )
                              )
                            ],
                          ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.namaSosis,
                      style: Theme.of(context)
                          .textTheme
                          .headline6
                          .copyWith(fontSize: 14),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                   FittedBox(
                    child: Text('${this.jamMulai} - ${this.jamSelesai}',
                            style: Theme.of(context)
                                .textTheme
                                .headline3
                                .copyWith(fontSize: 14)),
                   ),
                  ],
                ),
              )
            ]),
          ),
        ));
  }
}
