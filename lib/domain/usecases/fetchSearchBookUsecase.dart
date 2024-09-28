
import 'package:bookly/data_layer/datasource_contract/home_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../data_layer/model/book_response/BookModel.dart';
import '../entity/BookEntity.dart';
import '../repo_contract/Home_repo.dart';

@injectable
class FetchSearchBookUsecase{
  @factoryMethod
  HomeRepo apiDatasourcee;
  FetchSearchBookUsecase (this.apiDatasourcee);

  Future<Either<List<BookEntity>, String>> call({required String bookName}) async {
 return   apiDatasourcee.searchBooks(bookName: bookName);
  }


}