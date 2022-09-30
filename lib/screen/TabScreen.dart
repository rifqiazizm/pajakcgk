import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './KelasScreen.dart';
import './ProfileScreen.dart';
import './HomeScreen.dart';



class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {

  int _bottomNavbarIndex;
  PageController _pageController;
  MediaQueryData _media;
  var _color = Color.fromRGBO(33, 43, 96,1 );
  // List<Widget> _pages = [];

  @override
  void initState() {
    this._bottomNavbarIndex = 0;
    this._pageController = PageController(initialPage: _bottomNavbarIndex);
    super.initState();
  }

  void _selectIndex(int index) {
    setState(() {
      this._bottomNavbarIndex = index;
      this._pageController.jumpToPage(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    this._media = MediaQuery.of(context);
    print('ini dari tabscreen ${this._media.size}');
    return Scaffold(
      // bottomNavigationBar: , jangan make argument ini karena nanti radius bottom navbarnya ga ngaruh karena ada garisan/layout bawaan dari flutternya klo make ini

      body: Stack( // kayanya stack ini ga perlu width dan height karena sudah otomatis ngambil space sebanyak yg dia bisa
        children: [ // dikasi stack karena klo langsung listView, maka statusbar area androidnya ga ngikut warna aplikasi, jd make stack biar bisa fullscreen termasuk status bar android
          Container(color: this._color),
          SafeArea(
            child: Container(
              color: Color(0xFFF6F7F9),
              // color: Color.fromRGBO( 249, 249, 249 , 100),
              // color: Colors.yellow,
            ),
          ),
          PageView(
            controller: this._pageController,
            onPageChanged: (ind) {
              setState(() {
                this._bottomNavbarIndex = ind;
              });
            },
            children: <Widget>[
              HomeScreen(this._color),
              KelasScreen(this._media,this._color),
              ProfileScreen(this._media,this._color),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // alignment: Alignment.bottomCenter, alignment ini ga akan berhasil naro bottom navbar di bawah karena alignmentnya container itu buat internal ato buat align leement childnya
              // height: (this._media.size.height - this._media.padding.top) * 0.09 ,
              height: 60,
              // height: 100,
              child: BottomNavigationBar(
                onTap: this._selectIndex,
                currentIndex: this._bottomNavbarIndex,
                elevation: 0,
                backgroundColor: Colors.transparent,
                selectedItemColor: Theme.of(context).accentColor,
                unselectedItemColor: Colors.grey[350],
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home,size: this._media.size.height * 0.035),
                    title: Text('Home' ,style: GoogleFonts.openSans().copyWith(
                      fontSize: 12
                    ),)         
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.class_ ,size: this._media.size.height * 0.035),
                    title: Text('Kelas' ,style: GoogleFonts.openSans().copyWith(
                      fontSize: 12
                    ),)         
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person,size: this._media.size.height * 0.035),
                    title: Text('Profile' ,style: GoogleFonts.openSans().copyWith(
                      fontSize: 12
                    ),)         
                  )
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)
                )
              ),
            ),
          ),
        ],
        
      ),
    );
  }
} 