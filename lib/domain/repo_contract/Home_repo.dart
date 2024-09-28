

import 'package:bookly/data_layer/model/book_response/BookModel.dart';
import 'package:dartz/dartz.dart';

import '../entity/BookEntity.dart';

abstract class HomeRepo{

Future<Either<List<BookEntity>,String>> fetchNewsetBooks();
Future<Either<List<BookEntity>,String>> fetchFeaturedBooks();
Future<Either<List<BookEntity>,String>> fetchSimilarBooks({required String category});
Future<Either<List<BookEntity>,String>> searchBooks({
  required String bookName
});


}