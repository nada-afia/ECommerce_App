import 'package:ecommerce/domain/entities/response/common/category_or_brands.dart';
import '../../../domain/repositories/brands/get_all_brands_repos.dart';
import '../../data_source/remote/brands_remote_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: BrandsRepository)
class BrandsRepositoryImpl implements BrandsRepository{
  BrandsRemoteDataSource remoteDataSource;
  BrandsRepositoryImpl({required this.remoteDataSource});
  @override
  Future<List<CategoryOrBrands>?> getAllBrands() {
          return remoteDataSource.getAllBrands();
  }

}