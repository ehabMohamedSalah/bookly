
import 'package:bookly/domain/repo_contract/Home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity/BookEntity.dart';

@injectable
class fetchSimilarBooksUsecase{
  HomeRepo homeRepo;
  @factoryMethod
  fetchSimilarBooksUsecase(this.homeRepo);

  Future<Either<List<BookEntity>, String>> call(String category){
    return homeRepo.fetchSimilarBooks(category: category);
  }
}