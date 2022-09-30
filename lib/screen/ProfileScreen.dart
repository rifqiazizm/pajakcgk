import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/Kelas.dart';
import '../provider/User.dart';

class ProfileScreen extends StatelessWidget {
  final MediaQueryData media;
  final Color color;

  ProfileScreen(this.media, this.color);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    // final kelas = Provider.of<Kelas>(context);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            color: this.color,
          ),
          SafeArea(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.white24,
                      this.color,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.01,0.35]
                  )
              ),
              child: Column(
                children: [
                  Center(
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white70,
                      child: CircleAvatar(
                        child: Image.asset('assets/images/logodjp3.png'),
                        radius: 50,
                        backgroundColor: Colors.white54,
                        // backgroundImage: AssetImage('assets/images/logodjp2.png'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    user.namaWP,
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Consumer<Kelas>(
                    builder: (ctx, kelas, child) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Container(
                            // padding: const EdgeInsets.only(right: 40),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                border: Border(
                                    right: BorderSide(
                                        color: Colors.white, width: 2))),
                            child: Column(
                              children: [
                                Text(
                                  kelas.kelasTerdaftar
                                      .where((element) =>
                                          element['jenis_kelas'] == 'bimtek')
                                      .length
                                      .toString(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Bimtek',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            // padding: const EdgeInsets.only(left: 25),
                            child: Column(
                              children: [
                                Text(
                                  kelas.kelasTerdaftar
                                      .where((element) =>
                                          element['jenis_kelas'] == 'kelas')
                                      .length
                                      .toString(),
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Kelas',
                                  style: TextStyle(
                                      color: Colors.grey[400], fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        )
                        // Divider(
                        //   color: Colors.white,
                        //   height: 25,
                        //   thickness: 15,
                        // ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Nama',
                          style: Theme.of(context).textTheme.headline6
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Text(
                              user.namaWP,
                              // 'Muhammad Rifqi Aziz dan RIstanty Fitri',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No NPWP',
                          style: Theme.of(context).textTheme.headline6
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Text(
                              user.npwp,
                              // 'Muhammad Rifqi Aziz dan RIstanty Fitri',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No HP',
                          style: Theme.of(context).textTheme.headline6
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Text(
                              user.noHp,
                              // 'Muhammad Rifqi Aziz dan RIstanty Fitri',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'No EFIN',
                          style: Theme.of(context).textTheme.headline6
                        ),
                        SizedBox(width: 15,),
                        Expanded(
                          child: Text(
                              user.noEfin,
                              // 'Muhammad Rifqi Aziz dan RIstanty Fitri',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              textAlign: TextAlign.right,
                              softWrap: true,
                              style: Theme.of(context).textTheme.headline3.copyWith(fontSize: 16),
                            ),
                          ),
                      ],
                    ),
                    // FlatButton(onPressed: null, child: null),
                    RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      onPressed: () {},
                      // color: this.color,
                      elevation: 4,
                      color: this.color,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: this.media.size.width * 0.5,
                        child: Text(
                          'Update Profil',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              width: this.media.size.width,
              height: this.media.size.height * 0.60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          )
        ],
      ),
    );
  }
}
