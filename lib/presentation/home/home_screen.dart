import 'package:bookly/core/DI/di.dart';
import 'package:bookly/core/utils/routes_manager.dart';
import 'package:bookly/presentation/home/tabs/book/book_screen.dart';
 import 'package:bookly/presentation/home/tabs/book/view_model/book_screen_view_model_cubit.dart';
import 'package:bookly/presentation/home/tabs/book/widgets/search/viewModel/search_view_model_cubit.dart';
import 'package:bookly/presentation/home/tabs/music/music_screen.dart';
import 'package:bookly/presentation/home/tabs/profile/profile_screen.dart';
import 'package:bookly/presentation/home/tabs/wishlist/wishilist_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/utils/colors_manager.dart';
import '../../core/utils/strings_manager.dart';

class HomeScreen extends StatelessWidget {

  List<Widget> Tabs = [BookTab(), WishListTab(), MusicTab(), ProfileTab()];

  int currentIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:   EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,

        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            leadingWidth: 90.w,
            leading: SvgPicture.asset(
              StringsManager.Klogo, height: 50.h, width: 50.w,),
            actions: [
              BlocProvider(
                create: (context) => getIt<SearchViewModelCubit>(),
                child: IconButton(onPressed:(){
                    Navigator.pushNamed(context, RoutesManager.searchScreen);
                },
                  icon: Icon(Icons.search, color: Colors.white, size: 45.sp,),),
              ),
             ],
          ),
          /*  bottomNavigationBar: BottomNavigationBar(
                      currentIndex: currentIndex ,
                      onTap: (newindex) {
                        homeViewModel.changeIndex(newindex);
                      },
                      showUnselectedLabels: false,
                      showSelectedLabels: false,
                       items: [
                        BottomNavigationBarItem(

                          backgroundColor: ColorManager.ternaryColor,
                          icon:Icon(Icons.book,color: Colors.white30,),
                          label: "",
                          activeIcon:   Icon(Icons.book,color: Colors.white,),
                        ),
                        BottomNavigationBarItem(
                          backgroundColor:ColorManager.ternaryColor,

                          icon: SvgPicture.asset(
                            "assets/images/Saved.svg",colorFilter: ColorFilter.mode(Colors.black, BlendMode.srcIn)),
                          label: "",
                          activeIcon: SvgPicture.asset(
                            "assets/images/Saved.svg",colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),),

                        ),
                        BottomNavigationBarItem(
                          backgroundColor: ColorManager.ternaryColor,
                          icon: SvgPicture.asset(
                              "assets/images/Audio.svg"),
                          label: "",
                          activeIcon: SvgPicture.asset(
                              "assets/images/Audio.svg",colorFilter: ColorFilter.mode(Colors.white, BlendMode.screen)),

                        ),
                        BottomNavigationBarItem(
                          backgroundColor: ColorManager.ternaryColor,
                          icon: CircleAvatar(
                            radius:19 ,
                            child: ClipRRect(
                              clipBehavior:Clip.antiAlias ,
                              borderRadius: BorderRadius.circular(40),
                              child: SvgPicture.asset(
                                  "assets/images/Profile.svg",fit: BoxFit.cover,),
                            ),
                          ),
                          label: "",
                          activeIcon:CircleAvatar(
                            radius:30 ,
                            child: ClipRRect(
                              clipBehavior:Clip.antiAlias ,
                              borderRadius: BorderRadius.circular(19),
                              child: SvgPicture.asset(
                                "assets/images/Profile.svg",fit: BoxFit.cover,),
                            ),
                          ),

                        ),


                      ]

                  ),*/

          //body:  Tabs[homeViewModel.currentIndex],
          body: BookTab(),
        ),
      ),
    );
  }

  }

