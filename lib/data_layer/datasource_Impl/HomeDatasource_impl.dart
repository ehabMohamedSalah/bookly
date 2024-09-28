
import 'package:bookly/core/api/api_manager.dart';
import 'package:bookly/data_layer/datasource_contract/home_datasource.dart';
import 'package:bookly/data_layer/model/book_response/BookModel.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../domain/entity/BookEntity.dart';
import '../model/book_response/BookResponse.dart';

@Injectable(as: HomeDatasource)
class HomeDatasourceImpl extends HomeDatasource{
  ApiManager apiManager;
  @factoryMethod
  HomeDatasourceImpl(this.apiManager);
  @override
  Future<Either<List<BookModel>,String>> fetchFeaturedBooks()async {
    try{
      var response=await apiManager.getRequest(
        Endpoint:'volumes?Filtering=free-ebooks&q=subject:Programming',
      );
      var bookResponse=BookResponse.fromJson(response.data);
      return left(bookResponse.items??[]);
    }
    catch(error){
      return right(error.toString());
    }
  }

  @override
  Future<Either<List<BookModel>, String>> fetchNewsetBooks() async{
    var response=await apiManager.getRequest(
      Endpoint:  'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science',
    );
    var booklist=BookResponse.fromJson(response.data);
    return left(booklist.items??[]);
  }

  @override
  Future<Either<List<BookModel>, String>> fetchSimilarBooks({required String category})async {
    var response=await apiManager.getRequest(
      Endpoint: 'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming',
    );
    var booklist=BookResponse.fromJson(response.data);
    return left(booklist.items??[]);
  }

  //search endpoint volumes?Filtering=free-ebooks&q=subject:$bookName



}