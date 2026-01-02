import 'package:isar/isar.dart';
import '../../models/isar/user_isar_model.dart';

abstract class UserLocalDataSource {
  Stream<List<UserIsarModel>> getUserStream();
  Future<void> cacheUsers(List<UserIsarModel> users);
  Future<void> clearUsers();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  final Isar isar;

  UserLocalDataSourceImpl(this.isar);

  @override
  Stream<List<UserIsarModel>> getUserStream() {
    return isar.userIsarModels.where().watch(fireImmediately: true);
  }

  @override
  Future<void> cacheUsers(List<UserIsarModel> users) async {
    await isar.writeTxn(() async {
      await isar.userIsarModels.clear();
      await isar.userIsarModels.putAll(users);
    });
  }

  @override
  Future<void> clearUsers() async {
    await isar.writeTxn(() async {
      await isar.userIsarModels.clear();
    });
  }
}
