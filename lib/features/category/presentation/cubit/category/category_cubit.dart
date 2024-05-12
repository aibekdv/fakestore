import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:fakestore/features/category/domain/models/product_model.dart';
import 'package:fakestore/features/category/domain/repositories/category_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final CategoryRepository categoryRepository;

  CategoryCubit(this.categoryRepository) : super(CategoryInitial());

  getCategories() async {
    emit(GetCategoryLoading());
    try {
      final categories = await categoryRepository.getCategories();
      emit(GetCategoryLoaded(categories));
    } catch (e) {
      emit(GetCategoryError(e.toString()));
    }
  }

  getProductByCategory(String category) async {
    emit(GetProductByCategoryLoading());
    try {
      final products = await categoryRepository.getProductByCategory(category);
      emit(GetProductByCategoryLoaded(products));
    } catch (e) {
      emit(GetProductByCategoryError(e.toString()));
    }
  }

  getProductById(int id) async {
    emit(GetProductByIdLoading());
    try {
      final product = await categoryRepository.getProductById(id);
      emit(GetProductByIdLoaded(product));
    } catch (e) {
      emit(GetProductByIdError(e.toString()));
    }
  }
}
