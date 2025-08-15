import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_detail_state.dart';

class ProductDetail extends Cubit<ProductDetailState> {
  ProductDetail() : super(ProductDetailInitial());


  
}
