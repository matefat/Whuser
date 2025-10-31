import 'package:whuser/data_sources/persisted_user.dart';
import 'package:whuser/data_sources/remote_user.dart';
import 'package:whuser/models/user_model.dart';
import 'package:whuser/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RemoteUserDataSource remote;
  final PersistedUserDataSource local;

  UserRepositoryImpl({required this.remote, required this.local});

  @override
  Future<User> fetchAndPersist() async {
    final remoteUser = await remote.fetch();
    final mappedUser = User.fromJson(remoteUser);
    await local.save(mappedUser);
    return mappedUser;
  }

  @override
  List<User> getAllPersisted() => local.getAll();

  @override
  Future<void> remove(String id) async => await local.remove(id);

  @override
  Future<void> save(User user) async => await local.save(user);

  @override
  bool exists(String id) => local.exists(id);

}
