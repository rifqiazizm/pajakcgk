import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:kppcgk/widgets/KelasListView.dart';
// import 'package:provider/provider.dart';
// import '../provider/Kelas.dart';

class KelasScreen extends StatefulWidget {
  final MediaQueryData _media;
  final Color _color;

  KelasScreen(this._media, this._color);

  @override
  _KelasScreenState createState() => _KelasScreenState();
}

class _KelasScreenState extends State<KelasScreen> {
  var _tabSelect = 'bimtek';
  var _isInit = true;
  var _isLoading = false;

  void _selectorTab(String tab) {
    setState(() {
      this._tabSelect = tab;
    });
  }

  // @override
  // void didChangeDependencies() {
  //   if(this._isInit) {
  //     setState(() {
  //       this._isLoading = true;
  //     });
  //     Provider.of<Kelas>(context).fetchKelasTerdaftar().then((value) {
  //       setState(() {
  //         this._isLoading = false;
  //       });
  //     });
  //   }
  //   this._isInit = false;
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    print('ini bulannya ${DateFormat.M().format(DateTime(2021,4,3,9)).toString()}');
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: this.widget._color,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
            ),
            height: this.widget._media.size.height * 0.20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  child: Text(
                    'Daftar Kelas',
                    style: Theme.of(context).textTheme.headline4),
                    
                  margin: const EdgeInsets.only(left: 24, bottom: 30),
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => this._selectorTab('bimtek'),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          alignment: Alignment.center,
                          height: widget._media.size.height * 0.05,
                          width: widget._media.size.width * 0.5,
                          // color: isKelasPajak ?  Colors.transparent : Theme.of(context).accentColor,
                          child: Text(
                            'Bimtek E-filing',
                            style: GoogleFonts.roboto().copyWith(
                                color: this._tabSelect == 'bimtek'
                                    ? Colors.white
                                    : Color(0xFF6F678E),
                                fontSize: 15),
                          ),
                          decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: this._tabSelect == 'bimtek'
                                        ? Theme.of(context).accentColor
                                        : Colors.transparent,
                                    width: 5
                                )
                            )
                              // border: Border.all(color: Theme.of(context).accentColor,width: 5)
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => this._selectorTab('kelas'),
                        child: Container(
                          padding: const EdgeInsets.only(bottom: 10),
                          alignment: Alignment.center,
                          height: widget._media.size.height * 0.05,
                          width: widget._media.size.width * 0.5,
                          // color: this._tabSelect ?  Colors.transparent : Theme.of(context).accentColor,
                          child: Text(
                            'Kelas Pajak',
                            style: GoogleFonts.roboto().copyWith(
                                color: this._tabSelect == 'kelas'
                                    ? Colors.white
                                    : Color(0xFF6F678E),
                                fontSize: 15),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: this._tabSelect == 'kelas'
                                          ? Theme.of(context).accentColor
                                          : Colors.transparent,
                                      width: 5
                                  )
                              )
                              // border: Border.all(color: Theme.of(context).accentColor,width: 5)
                          ),
                        ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top:widget._media.size.height * 0.2),
            height: widget._media.size.height * 0.70,
            width : double.infinity,
            // color: Colors.black,
            child: this._isLoading ? CircularProgressIndicator() : KelasListView(this._tabSelect),
          )
        ],
    ));
  }
}
