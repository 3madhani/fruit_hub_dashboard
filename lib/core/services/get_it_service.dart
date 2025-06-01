import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/images_repo/images_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo.dart';
import 'package:fruit_hub_dashboard/core/repos/products_repo/product_repo_impl.dart';
import 'package:fruit_hub_dashboard/core/services/database_services.dart';
import 'package:fruit_hub_dashboard/core/services/fire_storage.dart';
import 'package:fruit_hub_dashboard/core/services/firestore_services.dart';
import 'package:fruit_hub_dashboard/core/services/supabase_storage.dart';
import 'package:get_it/get_it.dart';

import 'storage_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageServices>(SupabaseStorage());
  getIt.registerSingleton<DatabaseServices>(FireStoreServices());
  getIt.registerSingleton<ImagesRepo>(ImagesRepoImpl(storageServices: getIt.get<StorageServices>()));
  getIt.registerSingleton<ProductRepo>(ProductRepoImpl(
    databaseServices: getIt.get<DatabaseServices>(),
  ));
  
}
