import 'package:hive/hive.dart';
import 'package:whuser/models/user_model.dart';

class PersistedUserDataSource {
  static const boxName = 'persisted_users';
  late final Box<User> _box;

  Future<void> init() async {
    _box = await Hive.openBox<User>(boxName);
  }

  Future<void> save(User user) => _box.put(user.login.uuid, user);
  Future<void> remove(String id) => _box.delete(id);
  List<User> getAll() => _box.values.toList(growable: false);
  bool exists(String id) => _box.containsKey(id);

}
