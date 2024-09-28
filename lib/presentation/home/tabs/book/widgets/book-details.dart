  import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
 import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/DI/di.dart';
import '../../../../../domain/entity/BookEntity.dart';
import '../view_model/book_screen_view_model_cubit.dart';
 import 'like_widget.dart';

class BookDetails extends StatefulWidget {


  @override
  State<BookDetails> createState() => _BookDetailsState();
}

class _BookDetailsState extends State<BookDetails> {
  @override
  Widget build(BuildContext context) {

    var model=ModalRoute.of(context)?.settings.arguments as BookEntity;
    final Uri _url = Uri.parse(model.volumeInfo?.previewLink??"");

    return Padding(
      padding:   EdgeInsets.all(9.0),
      child: Container(
        color: Colors.black,
        child: Scaffold(
        backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: IconButton(icon:Icon(Icons.cancel_sharp,color: Colors.white,size: 25,) ,
              onPressed: (){
                  Navigator.pop(context);
            },),
            actions: [
              IconButton(icon:Icon(Icons.shopping_cart_outlined,color: Colors.white,size: 25,) ,
                onPressed: (){

                },),
            ],
          ),
          body: Padding(
            padding:   EdgeInsets.only(top: 30,bottom: 10),
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: model?.volumeInfo?.imageLinks?.thumbnail ??"",width: 125,height: 200,
                  placeholder: (context, url) => CircularProgressIndicator(),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),

                 SizedBox(height:70.h,),
              Text(model.volumeInfo?.title??"",maxLines:1,style: Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 25,overflow: TextOverflow.ellipsis),),
                SizedBox(height: 10,),
                Text(model.volumeInfo?.description??"",maxLines: 1,style: Theme.of(context).textTheme.bodySmall,),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Icon(Icons.star,color: Colors.yellow,size: 15,),
                    SizedBox(width: 5.w,),
                    Text(
                  "  ${"4.6"}",style: Theme.of(context).textTheme.labelMedium,),
                    SizedBox(width: 5.w,),
                    Text("|2300|",style: Theme.of(context).textTheme.bodySmall,),

                  ],),
                SizedBox(height: 35,),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 120,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(15),bottomLeft:  Radius.circular(15)),
                        ),

                        child: Padding(
                          padding:   EdgeInsets.only(right: 20,left: 20,top: 8,bottom: 8),
                          child: Center(child: Text("Free",style: Theme.of(context).textTheme.labelMedium!.copyWith(color: Colors.black,fontSize: 13,fontWeight:FontWeight.bold ),)),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          _launchUrl(_url);

                        },
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                            color: Colors.deepOrangeAccent,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(15),bottomRight:  Radius.circular(15)),
                          ),

                          child: Padding(
                            padding:   EdgeInsets.only(right: 20,left: 20,top: 8,bottom: 8),
                            child: Center(child: Text("Free preview",style: Theme.of(context).textTheme.labelMedium!.copyWith(fontSize: 13),)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50,),
                 Align(
                    alignment: Alignment.centerLeft,
                    child: Text("You can also like",style: Theme.of(context).textTheme.labelMedium,)),
                SizedBox(height: 15,),

                BlocProvider(
                  create: (context) => getIt<BookScreenViewModelCubit>()..getFeaturedBook(),
                  child: BlocBuilder<BookScreenViewModelCubit,BookScreenViewModelState>(
                              builder: (context, state) {
                                if(state is BookScreenError){
                                  return Center(child: Text(state.errorMsg),);
                                }
                                if(state is BookScreenSuccess){
                                  List<BookEntity>bookEntity=state.bookEntity;
                                  return Expanded(
                                    child: ListView.separated(
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) {
                                          return Container(
                                              width: 80,
                                              height: 100,
                                              child: LikeWidget( bookEntity:  bookEntity[index], ));
                                        } ,
                                        separatorBuilder: (context, index) => SizedBox(
                                          width: 5.w,
                                        ),
                                        itemCount: bookEntity.length),
                                  );
                                }
                                return Center(child: CircularProgressIndicator(),);
                          },

                )
                ),
            ]
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _launchUrl(Uri _url) async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}

