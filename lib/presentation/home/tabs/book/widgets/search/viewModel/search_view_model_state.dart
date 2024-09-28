part of 'search_view_model_cubit.dart';

@immutable
sealed class SearchViewModelState {}

final class SearchViewModelInitial extends SearchViewModelState {}
class SearchScreenLoading extends SearchViewModelState{}
class SearchScreenError extends SearchViewModelState{
  String errorMsg;
  SearchScreenError(this.errorMsg);
}
class SearchScreenSuccess extends SearchViewModelState{
  List<BookEntity>  bookEntity;
  SearchScreenSuccess(this.bookEntity);
}
