import 'package:book_grocer/common/color_extenstion.dart';
import 'package:flutter/material.dart';

class OurBooksView extends StatefulWidget {
  const OurBooksView({super.key});

  @override
  State<OurBooksView> createState() => _OurBooksViewState();
}

class _OurBooksViewState extends State<OurBooksView> {

  List imageArr = ["assets/img/ob1.png","assets/img/ob2.png","assets/img/ob3.png"];

  @override
  Widget build(BuildContext context) {
    var media  = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [

              Image.asset("assets/img/our_books_top.png", width:  media.width, fit: BoxFit.fitWidth, ),
             

              AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                ),

                Container(
                  height: media.width * 0.9 ,
                 
                  alignment: Alignment.bottomLeft,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child:  Row( children: imageArr.map((iName) {
                      var isFirst= imageArr.first == iName;
                      var isLast = imageArr.last == iName;
                    return Container(
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      padding: isFirst ? const EdgeInsets.only(left: 15 ) : ( isLast ? const EdgeInsets.only(right: 15) : null ) ,
                      child: Image.asset( iName,  height: 120 , fit: BoxFit.fitHeight, ),);
                  } ).toList() , ),),
                )

              

            ],),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
              child: Text("""Our bookshop, Novel Nest, is nestled in the heart of Colombo, Sri Lanka.

At Novel Nest, we pride ourselves on offering a diverse and expanding selection of discounted remainder and secondhand books. Our mission is to provide our customers with exceptional quality books at the best possible prices.

We take great care in curating our collection, sourcing titles from reputable publishers and suppliers around the world. Every book that finds its way onto our shelves is chosen because it's something we believe in and would recommend to others.

Despite our focus on offering discounted books, we strive to create an atmosphere that mirrors that of a traditional retail bookstore. We want our customers to feel as though they're browsing through the pages of their favorite novel in a welcoming and cozy environment.""", textAlign: TextAlign.center , style: TextStyle(color: TColor.subTitle, fontSize: 15),),
            )
            
          ],
        ),
      ),
    );
  }
}
