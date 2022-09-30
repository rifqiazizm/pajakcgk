import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Kelas with ChangeNotifier {

  final _url = 'https://jsonplaceholder.typicode.com/posts';

  final List<Map<String,Object>> _allKelas = [
    {
      'id' : '1',
      'nama_sosis' : 'Efiling WP Badan ',
      'jenis_kelas' : 'bimtek',
      'tanggal' : DateTime.now().add(Duration(days: 5)),
      'jam_mulai' : '09.00',
      'jam_selesai' : '12.00',
      'media' : 'offline',
      'kapasitas' : 50,
    },
    {
      'id' : '2',
      'nama_sosis' : 'Efiling WP OP',
      'jenis_kelas' : 'bimtek',
      'tanggal' : DateTime.now().add(Duration(days: 4)),
      'jam_mulai' : '09.00',
      'jam_selesai' : '12.00',
      'media' : 'offline',
      'kapasitas' : 50, 
    },
    {
      'id' : '3',
      'nama_sosis' : 'Efiling WP OP UMKM E-Form ',
      'jenis_kelas' : 'bimtek',
      'tanggal' : DateTime.now().add(Duration(days: 10)),
      'jam_mulai' : '09.00',
      'jam_selesai' : '12.00',
      'media' : 'offline',
      'kapasitas' : 50, 
    },
    {
      'id' : '4',
      'nama_sosis' : 'Kelas Pajak PMK-239',
      'jenis_kelas' : 'kelas',
      'tanggal' : DateTime.now().add(Duration(days: 15)),
      'jam_mulai' : '09.00',
      'jam_selesai' : '12.00',
      'media' : 'offline',
      'kapasitas' : 50, 
    },
    {
      'id' : '5',
      'nama_sosis' : 'Kelas Pajak PMK-239',
      'jenis_kelas' : 'kelas',
      'tanggal' : DateTime.now().add(Duration(days: 14)),
      'jam_mulai' : '09.00',
      'jam_selesai' : '12.00',
      'media' : 'offline',
      'kapasitas' : 50, 
    },
  ];


  final List<Map<String,Object>> _kelasTerdaftar = [
    {
      'id_kelas' : '2',
      'npwp' : '123456',
      'token' : 'WAB98B'
    },
    {
      'id_kelas' : '3',
      'npwp' : '123456',
      'token' : 'WAB98B'
    },
    {
      'id_kelas' : '4',   
      'npwp' : '123456',
      'token' : 'WAB98B'
    },
  ];


  Future<void> fetchAllKelas() {
    notifyListeners();
  }



  Future<void> fetchKelasTerdaftar() async {
    
    try {
      final res = await http.get(this._url);
    } catch(err) {
      throw err;
    }
    notifyListeners();
  }



  List<Map<String,Object>> get semuaKelas {
    return [
      ...this._allKelas
    ];
  }


  List<Map<String,Object>> get kelasTerdaftar {
    final selectedKelas = this._kelasTerdaftar.map((val) {
      final kelasInduk = this._allKelas.firstWhere((element) => element['id'] == val['id_kelas']); // make firstWhere biar langsung formatnya Map<> klo make where biasa formatnya jadi Iterable<>
      return {
        ...kelasInduk,
        'token' : val['token']
      };
    
    }).toList();
    return selectedKelas;
  }


  



}