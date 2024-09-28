import 'dart:ui';

import 'package:bookly/core/utils/routes_manager.dart';
import 'package:bookly/data_layer/model/best_selling/bestselling_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../data_layer/model/book_response/BookModel.dart';
import '../../../../../domain/entity/BookEntity.dart';

class BookView extends StatelessWidget {
   
  BookEntity? model;
   BookView(  {this.model});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, RoutesManager.bookDetails,arguments: model);
      },
      child: Container(
        width: 130,
        height: 224,


        child: Stack(
           children: [
             CachedNetworkImage(
               imageUrl: model?.volumeInfo?.imageLinks?.thumbnail ??"",
               placeholder: (context, url) => CircularProgressIndicator(),
               errorWidget: (context, url, error) => Icon(Icons.error),
             ),
             Positioned(
                 left: 40,
                 top: 120,
                 child: SvgPicture.asset('assets/images/Play.svg',)),
            ],
        ),
      ),
    );
  }
}
