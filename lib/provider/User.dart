

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class User with ChangeNotifier {

   String npwp;
   String namaWP;
   bool wpcengkareng; 
   String noEfin;
   String noHp;

  User({
    this.namaWP = 'Rifqi Aziz' ,
    this.npwp = '891594856034000',
    this.noEfin = '958632702',
    this.wpcengkareng = false,
    this.noHp = '0895802929454'
  });

  Map<String,Object> get user {
    return {
      'npwp' : npwp,
      'namaWP' : namaWP,
      'wpcengkareng' : wpcengkareng,
      'noEfin' : noEfin,
      'no HP' : noHp
    };
  }

  void addUser(Map<String,Object> userData) {
    this.npwp = userData['npwp'];
    this.namaWP = userData['namaWP'];
    this.noEfin = userData['efin'];
    this.noHp = userData['hp'];
    notifyListeners();
  }

  Future<void> saveUser(Map<String,String> userData) async {
    this.npwp = userData['npwp'];
    this.namaWP = userData['namaWP'];
    this.noEfin = userData['efin'];
    this.noHp = userData['hp'];
    
    final pref = await SharedPreferences.getInstance();
    final jsonData = json.encode(userData);
    pref.setString('userData', jsonData);

    notifyListeners();
  }



}