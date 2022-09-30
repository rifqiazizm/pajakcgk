import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/User.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLoading = false;
  var _formVal = {
    'npwp' : '',
    'namaWP' : '',
    'efin' : '',
    'hp' : ''
  };
  var _color = Color.fromRGBO(33, 43, 96, 1);


  void _saveForm()  {
    print('pressed!!');
    setState(() {
      _isLoading = true;
    });

    if(this._formKey.currentState.validate()) {
      
      Future.delayed(Duration(seconds: 2)).then((value) => {
        this._formKey.currentState.save(),
        Provider.of<User>(context,listen: false).saveUser(this._formVal),
        print(this._formVal),
        setState(() {
          this._isLoading = false;
        }),
        Navigator.of(context).pushReplacementNamed('/app')
      });
        
    
    } else {
      this._isLoading = false;
    }


  }


  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
          child: Form(
            key: this._formKey,
            child: ListView(
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/logodjp4.png'))),
                ),
                SizedBox(
                  height: media.height * 0.04,
                ),
                Text(
                  'Isikan Data Diri Anda',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 25,
                    fontWeight: FontWeight.w800
                  ),
                  // style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: media.height * 0.04),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: this._color),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: this._color),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)),
                    labelText: 'NPWP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.amber, width: 15),
                    ),
                  ),
                  onSaved: (val) {
                    this._formVal = {
                      ...this._formVal,
                      'npwp' : val
                    };
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Kolom Harus Diisi';
                    }
                    if (val.length <= 15) {
                      return 'NPWP Tidak Valid';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: this._color),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: this._color),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)),
                    labelText: 'Nama (Sesuai tertera di NPWP)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.amber, width: 15),
                    ),
                  ),
                  onSaved: (val) {
                    this._formVal = {
                      ...this._formVal,
                      'namaWP' : val
                    };
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Kolom Harus Diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: this._color),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: this._color),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)),
                    labelText: 'No EFIN',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.amber, width: 15),
                    ),
                  ),
                  onSaved: (val) {
                    this._formVal = {
                      ...this._formVal,
                      'efin' : val
                    };
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Kolom Harus Diisi';
                    }
                    if (val.length <= 9) {
                      return 'No EFIN Tidak Valid';
                    }
                    // if(double.parse(val) == null) {
                    //   return 'Input Harus Angka';
                    // }
                    return null;
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(color: this._color),
                    enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: this._color),
                        borderRadius: BorderRadius.circular(25)),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.amber)),
                    labelText: 'No HP',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.amber, width: 15),
                    ),
                  ),
                  onSaved: (val) {
                    this._formVal = {
                      ...this._formVal,
                      'hp' : val
                    };
                  },
                  validator: (val) {
                    if (val.isEmpty) {
                      return 'Kolom Harus Diisi';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: media.height * 0.1,
                ),
                RaisedButton(
                  elevation: 5,
                  highlightColor: Colors.amber,
                  splashColor: Colors.amber,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(25))
                  ),
                  color: this._color,
                  onPressed: () => this._saveForm(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10, horizontal: 20
                    ),
                    child: this._isLoading ?
                      CircularProgressIndicator()
                    :
                      Text(
                        'Simpan dan Lanjut',
                        // style: Theme.of(context).textTheme.headline4
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),
                      ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
