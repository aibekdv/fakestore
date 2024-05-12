import 'package:fakestore/features/category/domain/models/product_model.dart';
import 'package:fakestore/features/category/domain/repositories/category_repository.dart';

import '../datasources/category_remote_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<String>> getCategories() {
    return remoteDataSource.getCategories();
  }

  @override
  Future<List<ProductModel>> getProductByCategory(String category) {
    return remoteDataSource.getProductByCategory(category);
  }

  @override
  Future<ProductModel> getProductById(int id) {
    return remoteDataSource.getProductById(id);
  }
}
