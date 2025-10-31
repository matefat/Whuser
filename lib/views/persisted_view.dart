import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whuser/models/user_model.dart';
import 'package:whuser/repositories/user_repository.dart';
import 'package:whuser/views/details_view.dart';
import 'package:whuser/widgets/snack.dart';

import '../widgets/user_tile.dart';

class PersistedPage extends StatefulWidget {
  const PersistedPage({super.key});

  @override
  State<PersistedPage> createState() => _PersistedPageState();
}

class _PersistedPageState extends State<PersistedPage> {
  late List<User> _users;
  late UserRepository userRepository;

  @override
  void initState() {
    super.initState();
    userRepository = Provider.of<UserRepository>(context, listen: false);
    _users = userRepository.getAllPersisted();
  }

  Future<void> _remove(String id) async {
    try {
      await userRepository.remove(id);
      setState(() => _users.removeWhere((u) => u.login.uuid == id));
      AppSnackBar.success('Sucesso', 'Usuário removido.');
      if (_users.isEmpty && mounted) Navigator.of(context).pop();
    } catch (e) {
      AppSnackBar.error(
        'Erro ao remover',
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Usuários Persistidos')),
      body: _users.isEmpty
          ? const Center(child: Text('Nenhum usuário salvo.'))
          : ListView.separated(
              itemCount: _users.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (_, i) {
                final u = _users[i];
                return Dismissible(
                  key: ValueKey(u.login.uuid),
                  background: Container(color: Colors.red),
                  onDismissed: (_) => _remove(u.login.uuid),
                  child: UserTile(
                    user: u,
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => DetailsPage(user: u)),
                      );
                      if (!mounted) return;
                      setState(() {
                        _users = userRepository.getAllPersisted();
                      });
                    },
                  ),
                );
              },
            ),
    );
  }
}
