part of 'book_screen_view_model_cubit.dart';

@immutable
sealed class BookScreenViewModelState {}

final class BookScreenViewModelInitial extends BookScreenViewModelState {}
class BookScreenLoading extends BookScreenViewModelState{}
class BookScreenError extends BookScreenViewModelState{
  String errorMsg;
  BookScreenError(this.errorMsg);
}
class BookScreenSuccess extends BookScreenViewModelState{
 List<BookEntity>  bookEntity;
  BookScreenSuccess(this.bookEntity);
}
