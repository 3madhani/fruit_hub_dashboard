import 'package:get_it/get_it.dart';

import '../../feature/orders/data/repos/orders_repo_impl.dart';
import '../../feature/orders/domain/repos/orders_repo.dart';
import '../repos/images_repo/images_repo.dart';
import '../repos/images_repo/images_repo_impl.dart';
import '../repos/products_repo/product_repo.dart';
import '../repos/products_repo/product_repo_impl.dart';
import 'database_services.dart';
import 'fire_storage.dart';
import 'firestore_services.dart';
import 'storage_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageServices>(FireStorage());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<ImagesRepo>(
    ImagesRepoImpl(storageServices: getIt.get<StorageServices>()),
  );
  getIt.registerSingleton<ProductRepo>(
    ProductRepoImpl(databaseServices: getIt.get<DatabaseServices>()),
  );

  getIt.registerSingleton<OrdersRepo>(
    OrdersRepoImpl(databaseServices: getIt.get<DatabaseServices>()),
  );
}
