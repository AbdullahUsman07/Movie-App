import 'package:flutter/material.dart';
import 'package:movie_app/utlis/text.dart';

class DescriptionScreen extends StatefulWidget {
  String bannerUrl, rating, title, release_date, details, poster;
  bool isFavourite = false;

  DescriptionScreen({
    super.key,
    required this.bannerUrl,
    required this.rating,
    required this.title,
    required this.release_date,
    required this.details,
    required this.poster,
  });

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(
          children: [
            Container(  
              height: 250,
              child: Stack(  
                children: [
                  Positioned(child: Container(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: Image.network(widget.bannerUrl,fit: BoxFit.cover,),
                  )),
                  Positioned(
                    bottom: 10.0,
                    left:2.0,
                    child: Custom_Text(text: '⭐Average Rating - '+widget.rating, color: Colors.white, font: 18)),
                    Positioned(
                      right:10,
                      bottom:2,
                      child: IconButton(onPressed: (){
                        setState(() {
                          widget.isFavourite = ! widget.isFavourite;
                        });
                      }, icon: Icon(Icons.favorite,color: widget.isFavourite? Colors.red: Colors.white)),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Custom_Text(text: widget.title, color: Colors.white, font: 23)),
              Container(
                padding: EdgeInsets.only(left: 10.0),
                child: Custom_Text(text: 'Releasing on - '+widget.release_date, color: Colors.white, font: 16),
              ),
              const SizedBox(height: 20.0,),
              Row(children: [
                Container(
                  padding: const EdgeInsets.only(left:5.0),
                  height: 200,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Image.network(widget.poster,fit: BoxFit.fill,),  
                ),
                Flexible(child: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Custom_Text(text: widget.details, color:Colors.white, font: 18))),
              ],)
          ],
        ),
      ),
    );
  }
}
