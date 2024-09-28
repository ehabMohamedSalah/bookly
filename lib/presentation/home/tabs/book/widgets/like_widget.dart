import 'package:bookly/core/utils/routes_manager.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../data_layer/model/best_selling/bestselling_model.dart';
import '../../../../../domain/entity/BookEntity.dart';

class LikeWidget extends StatelessWidget {
 BookEntity bookEntity;
  LikeWidget({required this.bookEntity});
  @override
  Widget build(BuildContext context) {
    return             InkWell(
      onTap: () {
        Navigator.pushNamed(context, RoutesManager.bookDetails,arguments: bookEntity);
      },
      child: CachedNetworkImage(
        imageUrl: bookEntity?.volumeInfo?.imageLinks?.thumbnail ??"",width: 50,height: 50,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
   }
}
