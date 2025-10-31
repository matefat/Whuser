import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:whuser/data_sources/persisted_user.dart';
import 'package:whuser/data_sources/remote_user.dart';
import 'package:whuser/models/user_model.dart';
import 'package:whuser/repositories/user_repository.dart';
import 'package:whuser/repositories/user_repository_impl.dart';
import 'package:whuser/utils/theme.dart';
import 'package:whuser/views/home_view.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  //Registra TODOS os adapters usados pelo HIVE
  Hive.registerAdapter(UserNameAdapter());
  Hive.registerAdapter(UserStreetAdapter());
  Hive.registerAdapter(UserCoordinatesAdapter());
  Hive.registerAdapter(UserTimezoneAdapter());
  Hive.registerAdapter(UserLocationAdapter());
  Hive.registerAdapter(UserLoginAdapter());
  Hive.registerAdapter(UserAgeAdapter());
  Hive.registerAdapter(UserDocAdapter());
  Hive.registerAdapter(UserPictureAdapter());
  Hive.registerAdapter(UserAdapter());

  final local = PersistedUserDataSource();
  await local.init();

  final remote = RemoteUserDataSource();
  final repo = UserRepositoryImpl(remote: remote, local: local);

  runApp(
    //Registra o Provider do UserRepository
    MultiProvider(
      providers: [
        Provider<UserRepository>.value(value: repo),
      ],
      child: const RandomUserApp(),
    ),
  );
}

class RandomUserApp extends StatelessWidget {
  const RandomUserApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Whuser',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
