import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/Kelas.dart';

class KelasListView extends StatelessWidget {
  final String _jenisTab;

  KelasListView(this._jenisTab); 



  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final data = Provider.of<Kelas>(context).kelasTerdaftar;
    final dataBimtek = data.where((element) => element['jenis_kelas'] == 'bimtek').toList();
    final dataKelas = data.where((element) => element['jenis_kelas'] == 'kelas').toList();
    final selectedData = this._jenisTab == 'bimtek' ? dataBimtek : dataKelas;
    print(selectedData);
    // return ListView.builder(
    return ListView.builder(
      itemCount: selectedData.length,
      itemBuilder: (ctx, i) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        child: Hero(
          tag: selectedData[i]['id'],
            child: Card(
            elevation: 4,
            color: Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              onTap: () {
                Navigator.of(context).pushNamed('/detail-kelas',arguments: {
                  'id' : selectedData[i]['id'],
                  'terdaftar' : true
                });
                // print(selectedData[i]);
              },
              leading: Container(
                // margin: const EdgeInsets.only(top: 10),
                alignment: Alignment.center, 
                height: media.height * 0.3,
                width: 60,
                padding: const EdgeInsets.only(top:5),
                child: Column(
                  children: [
                      FittedBox(
                        child: Text(
                          DateFormat.MMM().format(selectedData[i]['tanggal']).toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black87
                          ),
                        ),
                      ),
                      Text(
                      DateFormat.d().format(selectedData[i]['tanggal']).toString(),
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ]
                ),
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
                ),
                // color: Color.fromRGBO(33, 43, 96,1 ),
              ),
              title: Text(
                selectedData[i]['nama_sosis'],
                style: Theme.of(context).textTheme.headline6,
                softWrap: true,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                '${selectedData[i]['jam_mulai']} - ${selectedData[i]['jam_selesai']}',
                style: Theme.of(context).textTheme.headline3,
              ),
              trailing: Text(
                selectedData[i]['media'],
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
          ),
        ),
      )
    );

    // );
  }
}
