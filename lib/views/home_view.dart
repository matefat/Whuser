import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whuser/repositories/user_repository.dart';
import 'package:whuser/viewmodels/home_viewmodel.dart';
import 'package:whuser/views/details_view.dart';
import 'package:whuser/views/persisted_view.dart';
import 'package:whuser/widgets/user_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late HomeViewModel homeVM;

  @override
  void initState() {
    super.initState();
    homeVM = HomeViewModel(
      repo: Provider.of<UserRepository>(context, listen: false),
      tickerProvider: this,
    );
  }

  @override
  void dispose() {
    homeVM.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: homeVM,
      child: Consumer<HomeViewModel>(
        builder: (_, vm, __) => Scaffold(
          appBar: AppBar(
            title: const Text('Whuser'),
          ),
          body: ListView.separated(
            itemCount: vm.users.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final u = vm.users[i];
              return UserTile(
                user: u,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => DetailsPage(user: u)),
                ),
              );
            },
          ),
          floatingActionButton: Stack(
            clipBehavior: Clip.none,
            children: [
              if (vm.loading)
                Positioned(
                  right: 16,
                  bottom: 86,
                  child: FloatingActionButton.small(
                    onPressed: null,
                    child: SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.6,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned(
                right: 16,
                bottom: 16,
                child: FloatingActionButton.extended(
                  icon: const Icon(Icons.storage),
                  label: const Text('Usuários Persistidos'),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const PersistedPage()),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
