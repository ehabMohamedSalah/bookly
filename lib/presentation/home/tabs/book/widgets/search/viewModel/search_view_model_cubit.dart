import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../../../../domain/entity/BookEntity.dart';
import '../../../../../../../domain/usecases/fetchSearchBookUsecase.dart';

part 'search_view_model_state.dart';
@injectable
class SearchViewModelCubit extends Cubit<SearchViewModelState> {
String? search;
 void  searchChange(newValue){
   if(search==newValue)return;
      search=newValue;
  }
static SearchViewModelCubit get(BuildContext context){
   return BlocProvider.of(context);
}
  @factoryMethod
  FetchSearchBookUsecase fetchSearchBookUsecase;
  SearchViewModelCubit(this.fetchSearchBookUsecase ) : super(SearchViewModelInitial());


  getSearchBook(String bookName)async {
    emit(SearchScreenLoading());
    var response = await fetchSearchBookUsecase.call(bookName: bookName);
    response.fold((books) {
      return emit(SearchScreenSuccess(books));
    },
            (errorMsg) => emit(SearchScreenError(errorMsg))
    );
  }

}
