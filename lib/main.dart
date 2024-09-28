import 'package:bookly/core/DI/di.dart';
import 'package:bookly/core/utils/routes_manager.dart';
import 'package:bookly/presentation/home/home_screen.dart';
import 'package:bookly/presentation/home/tabs/book/book_screen.dart';
 import 'package:bookly/presentation/home/tabs/book/view_model/book_screen_view_model_cubit.dart';
import 'package:bookly/presentation/home/tabs/book/widgets/book-details.dart';
import 'package:bookly/presentation/home/tabs/book/widgets/search/searchScreen.dart';
import 'package:bookly/presentation/provider/search_provider.dart';
 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'config/theme/AppTheme.dart';
import 'core/api/api_manager.dart';
import 'core/observer.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();

  ApiManager.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();

  runApp(
      MyApp());
}

class MyApp extends StatelessWidget {
    MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) => getIt<BookScreenViewModelCubit>(),),
      ],
      
      child: ChangeNotifierProvider(
          create:  (context) => SettingProvider(),
        child: ScreenUtilInit(
            designSize: const Size(430, 932),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (context, child) {
          return MaterialApp(
             debugShowCheckedModeBanner: false,
            theme: AppTheme.darkTheme,
           routes: {
               RoutesManager.bookScreen:(context) => BookTab(),
             RoutesManager.homeScreen:(context) => HomeScreen(),
             RoutesManager.bookDetails:(context) => BookDetails(),
             RoutesManager.searchScreen:(context) => SearchScreen(),
          
           },
          initialRoute: RoutesManager.homeScreen,
          );}
        ),
      ),
    );
  }
}
