import 'package:flutter/material.dart';


class CardBerita extends StatelessWidget {

  final String imageUrl;
  final String title;
  final String subTitle;

  CardBerita(this.imageUrl,this.subTitle,this.title);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return InkWell(
            onTap: () {},
            child: Card( // card ini ga punya width atau height berarti panjang lebarnya tergantung dari child widgetnya
              margin: const EdgeInsets.symmetric(horizontal : 15,vertical: 5),
              elevation: 7,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Container(
                // color: Colors.yellow,
                // height : 50,
                width: media.width * 0.75,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect( // make clipRrect ini karena mau mengatur gambarnya (sebagai child) supaya bisa punya rounded border, karena Image() gapunya properties buat ngatur border
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15)
                      ),
                      child: Image.network(
                        this.imageUrl,
                        height: media.height * 0.18,
                        width: double.infinity,
                        fit: BoxFit.fill
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        title,
                        maxLines: 1,
                        // softWrap: true,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        subTitle,
                        style: TextStyle(
                          fontFamily: 'Lato',
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ), 
          );
  }
}