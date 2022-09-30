import 'package:flutter/material.dart';
import '../widgets/CardBerita.dart';

class BeritaMainMenu extends StatelessWidget {
  final _listBerita = [
    {
      'imageUrl':
          'https://accounting.binus.ac.id/files/2019/12/klarifikasi-djp-dinilai-salahi-peraturan-pajak.png',
      'title': 'Tarif Pajak Naik?? Warga berniat Demo waduhh gannn',
      'subtitle': 'KPP Pratama Cengkareng'
    },
    {
      'imageUrl':
          'https://accounting.binus.ac.id/files/2019/12/klarifikasi-djp-dinilai-salahi-peraturan-pajak.png',
      'title': 'Tarif Pajak Naik??',
      'subtitle': 'KPP Pratama Cengkareng'
    },
    {
      'imageUrl':
          'https://accounting.binus.ac.id/files/2019/12/klarifikasi-djp-dinilai-salahi-peraturan-pajak.png',
      'title': 'Tarif Pajak Naik?? Warga berniat Demo',
      'subtitle': 'KPP Pratama Cengkareng'
    }
  ];

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    print('size nya berita $media');
    return Container(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('Lihat Berita',
                  style: Theme.of(context).textTheme.headline6),
              FlatButton(
                padding: const EdgeInsets.only(left: 20),
                child: Text('See All',
                    style: Theme.of(context).textTheme.headline5),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          // color: Colors.grey,
          height: media.height * 0.27,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: this._listBerita.length,
              itemBuilder: (ctx, i) => CardBerita(
                  this._listBerita[i]['imageUrl'],
                  this._listBerita[i]['subtitle'],
                  this._listBerita[i]['title'])),
        ),
      ]),
    );
  }
}
