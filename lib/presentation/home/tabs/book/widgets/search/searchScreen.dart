import 'package:bookly/domain/entity/BookEntity.dart';
import 'package:bookly/presentation/home/tabs/book/widgets/search/viewModel/search_view_model_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../../../../core/DI/di.dart';
import '../../../../../provider/search_provider.dart';
import '../../view_model/book_screen_view_model_cubit.dart';
import '../bestSelling.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  @override
  Widget build(BuildContext context) {
    SettingProvider   searchProvider = Provider.of<SettingProvider>(context);


    return  
      Container(
        decoration: BoxDecoration(
          color: Colors.black
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
           body:Padding(
             padding: EdgeInsets.all(10),
             child: Column(
                children: [
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(onPressed:  (){
                        Navigator.pop(context);
                      }, icon:  Icon(Icons.arrow_back,color: Colors.white,),),



                        Expanded(
                          child: TextFormField(
                            cursorColor: Colors.white,
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              searchProvider.changeSearchQuery(value);
                             },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.black, // Black background
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0), // Optional: for rounded borders
                                borderSide: BorderSide(
                                  color: Colors.white70, // White border
                                  width: 2.0, // Border width
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Colors.white70,
                                  width: 2.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8.0),
                                borderSide: BorderSide(
                                  color: Colors.white70,
                                  width: 2.0,
                                ),
                              ),
                              hintText: 'Search . . . ',
                              hintStyle: TextStyle(color: Colors.white70,fontWeight: FontWeight.w400), // Optional: for a lighter hint
                            ),
                            style: TextStyle(color: Colors.white30), // White text
                          )

                        ),


                    ],
                  ),
                  SizedBox(height: 20.h,),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Search Result',style: TextStyle(color: Colors.white70,fontWeight: FontWeight.w300,fontSize: 18),)),
                  searchProvider.isSearchEmpty?Center(child: Text("Empty",style: TextStyle(color: Colors.white),),):
                  BlocProvider.value(
                    value: getIt<SearchViewModelCubit>()..getSearchBook(searchProvider.searchQuery),
                    child: BlocBuilder<SearchViewModelCubit,SearchViewModelState>(
                      builder: (context, state) {
                          if(state is SearchScreenError){
                            return Center(child: CircularProgressIndicator(),);
                          }
                        if(state is SearchScreenSuccess){
                          List<BookEntity> books=state.bookEntity;
                    
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
                    ),
                  ),

                ],
              ),
           ),
          ));
    

  }
}
