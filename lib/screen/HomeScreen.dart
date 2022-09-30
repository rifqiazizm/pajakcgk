import 'package:flutter/material.dart';
import '../widgets/BeritaMainMenu.dart';
import '../widgets/GridMainMenu.dart';
import '../widgets/ImageSlider.dart';

class HomeScreen extends StatelessWidget {
  final Color color;

  HomeScreen(this.color);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Container(
                // margin: const EdgeInsets.only(bottom:10),
                height: 50,
                width: 80,
                child: Image.asset('assets/images/logodjp.png',
                    fit: BoxFit.fill))),
        backgroundColor: this.color,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 10,
          ),
          ImageSlider(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Layanan Kami',
                    style: Theme.of(context).textTheme.headline6),
                FlatButton(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text('See All',
                      style: Theme.of(context).textTheme.headline5),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          GridMainMenu(),
          BeritaMainMenu(),
          // Container(
          //   margin: const EdgeInsets.only(top:15),
          //   padding: const EdgeInsets.only(left: 15),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.end,
          //     children: [
          //       Text('Sosmed Kami',
          //         style: Theme.of(context).textTheme.headline6),
          //     ],
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.only(bottom: 40),
            alignment: Alignment.center,
            width: double.infinity,
            height: 300,
            child: Text(''),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/sosmed.jpg'))),
          )
        ],
      ),
    );
  }
}
