

import 'package:bookly/data_layer/datasource_contract/home_datasource.dart';
import 'package:bookly/data_layer/model/book_response/BookModel.dart';
import 'package:bookly/domain/entity/BookEntity.dart';
import 'package:bookly/domain/repo_contract/Home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable(as:HomeRepo )
class HomeRepoImpl extends HomeRepo{
  HomeDatasource apiDatasource;
  @factoryMethod
  HomeRepoImpl(this.apiDatasource);
  @override
  Future<Either<List<BookEntity>, String>> fetchFeaturedBooks() async{
  var result= await apiDatasource.fetchFeaturedBooks();
  return result.fold(
          (response) {
             var bookListModel=response;
             var bookListEntity=bookListModel.map((books) => books.toBookEntity()).toList();
             return left(bookListEntity);
          },
          (error) {
            return right(error);
          }
  );
  }

  @override
  Future<Either<List<BookEntity>, String>> fetchNewsetBooks()async {
    var result= await apiDatasource.fetchNewsetBooks();
    return result.fold(
            (response) {
              var bookListModel=response;
              var bookListEntity=bookListModel.map((books) => books.toBookEntity()).toList();
              return left(bookListEntity);
        },
            (error) {
          return right(error);
        }
    );
  }

  @override
  Future<Either<List<BookEntity>, String>> fetchSimilarBooks({required String category}) async{
    var result= await apiDatasource.fetchSimilarBooks(category: category);
    return result.fold(
            (response) {
          var bookListModel=response;
          var bookListEntity=bookListModel.map((books) => books.toBookEntity()).toList();
          return left(bookListEntity);
        },
            (error) {
          return right(error);
        }
    );
  }

  @override
  Future<Either<List<BookEntity>, String>> searchBooks({required String bookName}) async{
   var result=await apiDatasource.SearchBooks(bookName: bookName);
   return result.fold(
           (response) {
             List<BookModel>listBookModel=response;
             List<BookEntity>listBookEntity=listBookModel.map((book) => book.toBookEntity()).toList();
             return left(listBookEntity);
           },
           (error)  {
             return right(error);
           }
   );
  }
}