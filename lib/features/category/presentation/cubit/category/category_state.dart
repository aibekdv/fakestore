part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

// Get catgories
class GetCategoryLoading extends CategoryState {}

class GetCategoryLoaded extends CategoryState {
  final List<String> categories;

  const GetCategoryLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

class GetCategoryError extends CategoryState {
  final String message;

  const GetCategoryError(this.message);

  @override
  List<Object> get props => [message];
}

// Get products by category

class GetProductByCategoryLoading extends CategoryState {}

class GetProductByCategoryLoaded extends CategoryState {
  final List<ProductModel> products;

  const GetProductByCategoryLoaded(this.products);

  @override
  List<Object> get props => [products];
}

class GetProductByCategoryError extends CategoryState {
  final String message;

  const GetProductByCategoryError(this.message);

  @override
  List<Object> get props => [message];
}

// Get product by id

class GetProductByIdLoading extends CategoryState {}

class GetProductByIdLoaded extends CategoryState {
  final ProductModel product;

  const GetProductByIdLoaded(this.product);

  @override
  List<Object> get props => [product];
}

class GetProductByIdError extends CategoryState {
  final String message;

  const GetProductByIdError(this.message);

  @override
  List<Object> get props => [message];
}
