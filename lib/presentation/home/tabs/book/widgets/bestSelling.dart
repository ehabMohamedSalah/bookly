import 'package:bookly/data_layer/model/best_selling/bestselling_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/utils/routes_manager.dart';
import '../../../../../domain/entity/BookEntity.dart';

class BestSelling extends StatelessWidget {
   BookEntity model;
  BestSelling({ required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.bookDetails,arguments: model);

      },
      child: Container(
        width: double.infinity,
            height: 120,
         child: Row(
           crossAxisAlignment: CrossAxisAlignment.start,

           children: [
             CachedNetworkImage(
               imageUrl: model?.volumeInfo?.imageLinks?.thumbnail ??"",
               placeholder: (context, url) => CircularProgressIndicator(),
               errorWidget: (context, url, error) => Icon(Icons.error),
             ),

             SizedBox(width: 10.w,),
             Expanded(
               child: Padding(
                 padding:   EdgeInsets.all(16.0),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.center,

                   children: [

                    Text( model.volumeInfo?.title??"",maxLines: 1,style: Theme.of(context).textTheme.labelLarge?.copyWith(overflow:TextOverflow.ellipsis )),
                     Text( model.volumeInfo?.description??"",maxLines:2,textAlign: TextAlign.left,style: Theme.of(context).textTheme.bodySmall?.copyWith(overflow:TextOverflow.ellipsis) ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Text("Free\$",style: Theme.of(context).textTheme.labelLarge,),
                           ],
                         ),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(Icons.star,color: Colors.yellow,size: 15,),
                              SizedBox(width: 5,),
                              Text("4.6",style: Theme.of(context).textTheme.labelLarge,),
                              SizedBox(width: 5,),

                              Text("|2390|",style: Theme.of(context).textTheme.bodySmall,),

                            ],),

                       ],
                     ),


                   ],),
               ),
             ),
           ],
         ),
       ),
    );
  }
}
