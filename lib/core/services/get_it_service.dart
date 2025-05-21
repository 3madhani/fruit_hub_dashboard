import 'package:fruit_hub_dashboard/core/services/fire_storage.dart';
import 'package:get_it/get_it.dart';

import 'storage_services.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<StorageServices>(FireStorage());
}