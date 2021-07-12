import 'package:flutter/material.dart';
import 'package:retrofit_api/utils/customText.dart';

class Description extends StatelessWidget {
  final String name;
  final String description;
  final String bannerurl;
  final String posterurl;
  final String vote;
  final String launch_on;

  const Description({Key? key, required this.name, required this.description, required this.bannerurl, required this.posterurl, required this.vote, required this.launch_on}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black87,
      body: Container(
        child: ListView(
          children: [
            Container(
             height: 250.0,
             child: Stack(
               children: [
                 Positioned(
                   child: Container(
                     height: 250.0,
                     width: MediaQuery.of(context).size.width,
                     child: Image.network(bannerurl, fit: BoxFit.cover,),
                     
                   ),
                 ),
                 Positioned(
                   bottom: 10.0,
                   child: CustomText(text: ' ⭐ Average rating: '+ vote , color: Colors.black, size: 18,)
                   ),
               ],
             ),
            ),
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(10.0),
              child: CustomText(text: name!=null?name: 'Not loaded', color:Colors.black, size: 24.0,),
            ),
            Container(
              padding: EdgeInsets.only(left: 10.0),
              child: CustomText(text: 'Releasing on '+ launch_on, size: 14.0, color: Colors.black,),
            ),

            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(5.0),
                   height: 200.0,
                   width:  100.0,
                   child: Image.network(posterurl),
                ),

                Flexible(
                  child: Container(
                    child: CustomText(text: description, color: Colors.black, size: 18.0),
                    
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      
    );
  }
}