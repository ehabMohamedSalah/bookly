
import 'package:bookly/domain/repo_contract/Home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../entity/BookEntity.dart';

@injectable
class fetchNewsetBooksUsecase{
  HomeRepo homeRepo;
  @factoryMethod
  fetchNewsetBooksUsecase(this.homeRepo);

  Future<Either<List<BookEntity>, String>> call(){
    return homeRepo.fetchNewsetBooks();
  }
}