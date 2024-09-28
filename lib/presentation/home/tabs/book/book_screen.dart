import 'package:bookly/core/DI/di.dart';
import 'package:bookly/data_layer/model/book_response/BookModel.dart';
import 'package:bookly/presentation/home/tabs/book/view_model/book_screen_view_model_cubit.dart';
import 'package:bookly/presentation/home/tabs/book/widgets/Book_view.dart';
import 'package:bookly/presentation/home/tabs/book/widgets/bestSelling.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/strings_manager.dart';
import '../../../../data_layer/model/best_selling/bestselling_model.dart';
import '../../../../domain/entity/BookEntity.dart';


class BookTab extends StatelessWidget {
List<String>images=[
  'assets/images/BookL.svg',
  'assets/images/BookL.svg',
  'assets/images/BookL.svg',
  'assets/images/BookL.svg',
  'assets/images/BookL.svg',
  'assets/images/BookL.svg',
];
List<BestSellingModel>bestSelling=[
  BestSellingModel(images: 'assets/images/BookL.svg',price: 100,title: "The Jungle Book",desc: 'j.k Rowling', review: 8),
  BestSellingModel(images: 'assets/images/BookL.svg',price: 100,title: "The Jungle Book",desc: 'j.k Rowling', review: 8),
  BestSellingModel(images: 'assets/images/BookL.svg',price: 100,title: "The Jungle Book",desc: 'j.k Rowling', review: 8),
  BestSellingModel(images: 'assets/images/BookL.svg',price: 100,title: "The Jungle Book",desc: 'j.k Rowling', review: 8),
  BestSellingModel(images: 'assets/images/BookL.svg',price: 100,title: "The Jungle Book",desc: 'j.k Rowling', review: 8),
  BestSellingModel(images: 'assets/images/BookL.svg',price: 100,title: "The Jungle Book",desc: 'j.k Rowling', review: 8),
  BestSellingModel(images: 'assets/images/BookL.svg',price: 100,title: "The Jungle Book",desc: 'j.k Rowling', review: 8),
  BestSellingModel(images: 'assets/images/BookL.svg',price: 100,title: "The Jungle Book",desc: 'j.k Rowling', review: 8),
];

  @override
  Widget build(BuildContext context) {
    return   Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
      /* SizedBox(
         height: 220,
         width: double.infinity,
         child: ListView.separated(
           scrollDirection: Axis.horizontal,
             itemBuilder: (context, index) {
               return BookView( BookView(model: model[index]);
             },
             separatorBuilder:  (context, index) => SizedBox(width: 10.w,),
             itemCount: model.length),
       ),*/
        BlocProvider(
          create: (context) => getIt<BookScreenViewModelCubit>()..getFeaturedBook(),
          child: BlocBuilder<BookScreenViewModelCubit,BookScreenViewModelState>(
            builder:(context, state) {
              if(state is BookScreenError){
                return Center(child: Text(state.errorMsg,style: TextStyle(color: Colors.white),),);
              }
              if(state is BookScreenSuccess){
                List<BookEntity> model = state.bookEntity;
                return  SizedBox(
                    height: 200,
                    child: CarouselSlider.builder(
                      options: CarouselOptions(
                        height: 200.0,               // Set height of the carousel
                        enlargeCenterPage: true,     // Enlarge the center image
                        autoPlay: true,              // Enable auto-play
                        autoPlayInterval: Duration(seconds: 3),  // Auto-play interval
                        viewportFraction: 0.4,
                      ),
                      itemBuilder: (context, index, realIndex) =>  BookView(model: model[index],),
                      itemCount: model.length,));
              }
              return CircularProgressIndicator();

            },


          ),
        ),

        SizedBox(height: 10,),
        Align(
            alignment: Alignment.centerLeft,
            child: Text('Best Seller',style: Theme.of(context).textTheme.labelLarge,)),
        BlocProvider(
          create: (context) => getIt<BookScreenViewModelCubit>()..getFeaturedBook(),
          child: BlocBuilder<BookScreenViewModelCubit,BookScreenViewModelState>(
    builder: (context, state) {
      if(state is BookScreenSuccess){
      return  Expanded(
          child: ListView.separated(
              itemBuilder: (context, index) => BestSelling(model: state.bookEntity[index],  ),
              separatorBuilder: (context, index) => SizedBox(
                height: 10.h,
              ),
              itemCount: state.bookEntity.length),
        );
    }
      return Center(child: CircularProgressIndicator());
    },
    )

           ),


      ],
    );
  }
}
