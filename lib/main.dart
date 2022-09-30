import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kppcgk/provider/User.dart';
import 'package:provider/provider.dart';
import './screen/SplashScreen.dart';
import './screen/LoginScreen.dart';
import './provider/Kelas.dart';
import './screen/DetailKelasScreen.dart';
import './screen/TabScreen.dart';
import './screen/ListSosisScreen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
   
  @override  
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => User()),
        ChangeNotifierProxyProvider<User,Kelas>(
          create: null,
          update: (ctx, user,prevKelas) => Kelas(),
        )
      ],
      child: MaterialApp(
        title: 'KPP Cengkareng',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.amber,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
          // hintColor: Colors.yellow,
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(
              color: Color.fromRGBO(33, 43, 96,1 )
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber)
            )
          ),
          textTheme: ThemeData.light().textTheme.copyWith(
            headline4: GoogleFonts.roboto().copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 22
            ),
            headline6 : GoogleFonts.openSans().copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 15
            ),
            headline5: GoogleFonts.openSans().copyWith(
              color: Colors.amber[700],
              fontSize: 13,
              fontWeight: FontWeight.bold
            ),
            headline3: TextStyle(
              color: Colors.grey,
              fontSize: 14
            )
          )
        ),
        initialRoute: '/',
        routes: {
          '/' : (ctx) => SplashScreen(),
          '/list-sosis' : (ctx) => ListSosisScreen(),
          '/detail-kelas' : (ctx) => DetailKelasScreen(),
          '/login' : (ctx) => LoginScreen(),
          '/app' : (ctx) => TabScreen()
        },
      ),
    );
  }
}
