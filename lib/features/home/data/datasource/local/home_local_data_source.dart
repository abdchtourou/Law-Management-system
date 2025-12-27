import 'package:isar/isar.dart';
import '../../model/isar/home_isar_model.dart';

abstract class HomeLocalDataSource {
  Stream<List<HomeIsarModel>> getHomeStream();
  Future<void> cacheHome(HomeIsarModel homeModel);
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  final Isar isar;

  HomeLocalDataSourceImpl(this.isar);

  @override
  Stream<List<HomeIsarModel>> getHomeStream() {
    print('ajshfkljsh');
    return isar.homeIsarModels.where().watch(fireImmediately: true);
  }

  @override
  Future<void> cacheHome(HomeIsarModel homeModel) async {
    await isar.writeTxn(() async {
      // Assuming singleton or keyed by userId, but for now we replace.
      // If we want singleton replacement, we rely on the unique index on `userId`.
      // We should make sure userId is set.
      homeModel.userId =
          'currentUser'; // Hardcoded for this context as per typical single-user cache
      await isar.homeIsarModels.put(homeModel);
    });
  }
}
