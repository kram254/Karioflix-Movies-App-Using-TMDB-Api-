import 'package:flutter/material.dart';
import 'package:retrofit_api/utils/customText.dart';

class TV extends StatelessWidget {
  final List tv;

  const TV({ Key? key, required this.tv }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
         CustomText(text:'Popular TV Shows', color: Colors.grey, size: 24,),
         SizedBox(height: 10),
         Container(
           height: 200,
           child: ListView.builder(
             scrollDirection: Axis.horizontal,
             itemCount: tv.length,
             itemBuilder: (context, index){
               return InkWell(
                 onTap: (){

                 },
                 child:Container(
                   padding: EdgeInsets.all(5.0),
                   width: 250,
                   child: Column(
                     children: [
                       Container(
                         
                         height: 250,
                         width: 140,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(20.0),
                           image: DecorationImage(
                             image: NetworkImage(
                               'https://image.tmdb.org/t/p/w500'+ tv[index]['backdrop_path'],
                             ),
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),

                       SizedBox(height:10.0),
                       Container(
                         child: CustomText(text: tv[index]['original_name']!=null?
                         tv[index]['original_name']:'Loading...', color: Colors.grey, size:16,),
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