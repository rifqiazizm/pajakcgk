import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/KelasItem.dart';
import '../provider/Kelas.dart';

class ListSosisScreen extends StatelessWidget {

  // final String _jenis_kelas = 'bimtek';

  // DaftarKelas(this._jenis_kelas);

  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    final media = MediaQuery.of(context).size;
    final listKelas = Provider.of<Kelas>(context).semuaKelas.where((element) => element['jenis_kelas'] == args).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar $args'),
        backgroundColor: Color.fromRGBO(33, 43, 96,1 ),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, 
          childAspectRatio: 4/5,
          crossAxisSpacing: 15, 
          mainAxisSpacing: 15
        ),
        itemCount: listKelas.length,
        itemBuilder: (ctx , ind) => KelasItem(
          id : listKelas[ind]['id'],
          media : media,
          namaSosis: listKelas[ind]['nama_sosis'],
          jamMulai: listKelas[ind]['jam_mulai'],
          jamSelesai: listKelas[ind]['jam_selesai'],
          mediaKelas: listKelas[ind]['media'],
          tanggal: listKelas[ind]['tanggal'],

        ),
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      ),
    );
  }
}
