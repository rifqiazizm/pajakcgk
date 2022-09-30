import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageSlider extends StatefulWidget {


  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {

  static final _imgAsset = [
    'aziz.png', 
    'lapor.jpg',
    'insentif.jpg'
  ];

  // dimensi gambar 
  // width = 10393px
  // height = 6236px

  MediaQueryData _media;

  @override
  void didChangeDependencies() {
    this._media = MediaQuery.of(context);
    super.didChangeDependencies();
  }



  @override
  Widget build(BuildContext context) {
    return  CarouselSlider(
    options: CarouselOptions(
      autoPlay: true,
      height: this._media.size.height * 0.20,
      // aspectRatio: 10/3
      // aspectRatio: 9/3

    ),
    items: _imgAsset.map((image) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: AssetImage('assets/images/$image'),
            fit: BoxFit.fill
          )
        ),
      );
    }).toList(),

  );

  }
}