import 'package:bloc/bloc.dart';
import 'package:bookly/domain/entity/BookEntity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../data_layer/model/book_response/BookResponse.dart';
import '../../../../../domain/usecases/fetchFeaturedBooksUsecase.dart';
import '../../../../../domain/usecases/fetchNewsetBooksUsecase.dart';
import '../../../../../domain/usecases/fetchSearchBookUsecase.dart';

part 'book_screen_view_model_state.dart';

@injectable
class BookScreenViewModelCubit extends Cubit<BookScreenViewModelState> {

  BookScreenViewModelCubit(this.featuredBooksUsecase,this.fetchNewestBook,this.fetchSearchBookUsecase) : super(BookScreenViewModelInitial());
  @factoryMethod
  fetchFeaturedBooksUsecase featuredBooksUsecase;
  fetchNewsetBooksUsecase fetchNewestBook;
  FetchSearchBookUsecase fetchSearchBookUsecase;

  static fetchFeaturedBooksUsecase get(BuildContext context){
    return BlocProvider.of(context);
  }
  getFeaturedBook()async{
    emit(BookScreenLoading());
    var response=await featuredBooksUsecase.call();
    response.fold(
            (response) =>emit(BookScreenSuccess(response)),
            (errorMsg) => emit(BookScreenError(errorMsg)));
  }
  getNewestBook()async{
    emit(BookScreenLoading());
    var response=await fetchNewestBook.call();
    response.fold(
            (response) =>emit(BookScreenSuccess(response)),
            (errorMsg) => emit(BookScreenError(errorMsg)));
  }

  getSearchBook(String bookName)async {
    emit(BookScreenLoading());
    var response = await fetchSearchBookUsecase.call(bookName: bookName);
    response.fold((books) {
      return emit(BookScreenSuccess(books));
    },
            (errorMsg) => emit(BookScreenError(errorMsg))
    );
  }
}
