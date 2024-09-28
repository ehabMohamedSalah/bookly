
import 'package:dartz/dartz.dart';

import '../../domain/entity/BookEntity.dart';
import '../model/book_response/BookModel.dart';
import '../model/book_response/BookResponse.dart';

abstract class HomeDatasource{
  Future<Either<List<BookModel>,String>> fetchNewsetBooks();
  Future<Either<List<BookModel>,String>> fetchFeaturedBooks();
  Future<Either<List<BookModel>, String>>   fetchSimilarBooks(
      {required String category});

  Future<Either<List<BookModel>, String>>   SearchBooks(
      {required String bookName});
}