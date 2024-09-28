

import 'package:bookly/data_layer/datasource_contract/home_datasource.dart';
import 'package:bookly/data_layer/model/book_response/BookResponse.dart';
import 'package:bookly/domain/repo_contract/Home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity/BookEntity.dart';
@injectable
class fetchFeaturedBooksUsecase{
  HomeRepo homeRepo;
  @factoryMethod
  fetchFeaturedBooksUsecase(this.homeRepo);

  Future<Either<List<BookEntity>, String>> call(){
    return homeRepo.fetchFeaturedBooks();
  }
}