import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../provider/Kelas.dart';

class DetailKelasScreen extends StatefulWidget {
  @override
  _DetailKelasScreenState createState() => _DetailKelasScreenState();
}


class _DetailKelasScreenState extends State<DetailKelasScreen> {

  var _isInit = true;
  var _isSubmitted = false;
  Map<String, Object> rincianKelas;
  Map<String,Object> args;
  Size media;
  final Color _defaultColor = Colors.grey[400];
  final Color _appColor = const Color.fromRGBO(33, 43, 96,1 );

  @override
  void didChangeDependencies() {
    if(_isInit) {
      media = MediaQuery.of(context).size;
      this.args = ModalRoute.of(context).settings.arguments as Map<String,Object>;
      this.rincianKelas = this.args['terdaftar'] 
        ?
          Provider.of<Kelas>(context, listen: false).kelasTerdaftar.firstWhere((element) => element['id'] == this.args['id'])
        :
          Provider.of<Kelas>(context, listen: false)
          .semuaKelas
          .firstWhere((element) => element['id'] == this.args['id']);
      print(args);
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  

  Widget _rincianContainer(
      BuildContext ctx, Size media, String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: media.height * 0.1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.black38,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 22, color: Colors.black),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(args['id']);
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,

      // ),
      body: Hero(
        tag: this.args['id'],
        // tag: '2',
        child: Stack(
          children: [
            Container(
              color: this._appColor,
            ),
            SafeArea(
                child: Container(
              height: media.height * 0.5,
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: rincianKelas['jenis_kelas'] == 'bimtek' ? AssetImage('assets/images/fotobimtek.jpg') : AssetImage('assets/images/fotokelas.jpg'),
                fit: BoxFit.cover,
              )),
              child: Center(
                child: Text(
                  rincianKelas['nama_sosis'],
                  style: Theme.of(context).textTheme.headline6.copyWith(
                        fontSize: 32,
                        color: rincianKelas['jenis_kelas'] == 'bimtek' ? Colors.black54 : Colors.white60,
                        // fontWeight: FontWeight.w900
                      ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )),
            Positioned(
                bottom: 0,
                child: Container(
                  height: media.height * 0.5,
                  width: media.width,
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Container(
                        //   alignment: Alignment.topCenter,
                        //   width: 35,
                        //   height: 5,
                        //   decoration: BoxDecoration(
                        //     color: Colors.grey,
                        //     border: Border.all(color: this._defaultColor),
                        //     borderRadius: BorderRadius.all(Radius.circular(15))
                        //   ),
                        // ),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          height: media.height * 0.1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              this._rincianContainer(
                                  context,
                                  media,
                                  'Kapasitas',
                                  rincianKelas['kapasitas'].toString()),
                              VerticalDivider(
                                color: this._defaultColor,
                                width: 10,
                                thickness: 2.5,
                              ),
                              this._rincianContainer(context, media, 'Media',
                                  rincianKelas['media']),
                              VerticalDivider(
                                color: this._defaultColor,
                                width: 10,
                                thickness: 2.5,
                              ),
                              this._rincianContainer(
                                  context, media, 'Terdaftar', '40'),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tanggal',
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                DateFormat.yMMMMd()
                                    .format(rincianKelas['tanggal'])
                                    .toString(),
                                // 'Muhammad Rifqi Aziz dan RIstanty Fitri',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        // Divider(color: this._defaultColor,height: 15,),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Tempat',
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                rincianKelas['media'] == 'offline'
                                    ? 'KPP Cengkareng'
                                    : 'Zoom Online',
                                // 'Muhammad Rifqi Aziz dan RIstanty Fitri',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Biaya',
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                'GRATIS',
                                // 'Muhammad Rifqi Aziz dan RIstanty Fitri',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25,),
                        if(this.args['terdaftar']) Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Token',
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                rincianKelas['token'],
                                // 'Muhammad Rifqi Aziz dan RIstanty Fitri',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.right,
                                softWrap: true,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    .copyWith(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        if(!this.args['terdaftar']) Expanded(
                          child: Center(
                            child: RaisedButton(
                              elevation: 5,
                              onPressed: () {},
                              // color: this._defaultColor,
                              color: this._appColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  side: BorderSide(color: Colors.grey)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 20),
                                  child: Text( // make loading spinner disini gan!!!
                                    'Daftar Kelas',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20
                                    ),
                                  ),
                                ),
                            ),
                          ),
                        )
                      ]),
                ))
          ],
        ),
      ),
    );
  }
}
