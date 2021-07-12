import 'package:flutter/material.dart';
import 'package:retrofit_api/utils/customText.dart';

class TopRated extends StatelessWidget {
  final List toprated;

  const TopRated({ Key? key, required this.toprated }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
         CustomText(text:'Top Rated Movies', color: Colors.grey, size: 24,),
         SizedBox(height: 10),
         Container(
           height: 270,
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemCount: toprated.length,
             itemBuilder: (context, index){
               return InkWell(
                 onTap: (){

                 },
                 child:Container(
                   width: 140,
                   child: Column(
                     children: [
                       Container(
                         height: 200,
                         decoration: BoxDecoration(
                           image: DecorationImage(
                             image: NetworkImage(
                               'https://image.tmdb.org/t/p/w500'+ toprated[index]['poster_path']
                             ),
                           ),
                         ),
                       ),
                       Container(
                         child: CustomText(text: toprated[index]['title']!=null?
                         toprated[index]['title']:'Loading...', color: Colors.grey, size:16,),
                       ),
                     ]
                   ),
                 ),
               );
             },
             ),
         ),
        ],
      ),
      
    );
  }
}