import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whuser/models/user_model.dart';
import 'package:whuser/repositories/user_repository.dart';
import 'package:whuser/widgets/snack.dart';
import 'package:whuser/widgets/user_card.dart';

class DetailsPage extends StatelessWidget {
  final User user;
  const DetailsPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final userRepository = Provider.of<UserRepository>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(user.fullName),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            tooltip: 'Remover usuário',
            onPressed: () => _removeUser(context, userRepository),
          ),
          const SizedBox(width: 4),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(12, 12, 12, 24),
        children: [
          Center(
            child: CircleAvatar(
              radius: 48,
              backgroundImage: NetworkImage(user.picture.large),
            ),
          ),
          const SizedBox(height: 12),
          ExpansionTile(
            initiallyExpanded: true,
            leading: const Icon(Icons.badge_outlined),
            title: const Text(
              'Identidade',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            childrenPadding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            children: [
              UserCard(
                title: 'Identidade',
                rows: {
                  'Nome completo': user.fullName,
                  'Gênero': user.gender,
                  'Nacionalidade': user.nat,
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.mail_outline),
            title: const Text(
              'Contato',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            childrenPadding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            children: [
              UserCard(
                title: 'Contato',
                rows: {
                  'Email': user.email,
                  'Telefone': user.phone,
                  'Celular': user.cell,
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.location_on_outlined),
            title: const Text(
              'Localização',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            childrenPadding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            children: [
              UserCard(
                title: 'Localização',
                rows: {
                  'Rua':
                      '${user.location.street.number} ${user.location.street.name}',
                  'Cidade': user.location.city,
                  'Estado': user.location.state,
                  'País': user.location.country,
                  'CEP/Postcode': user.location.postcode,
                  'Coordenadas':
                      '${user.location.coordinates.latitude}, ${user.location.coordinates.longitude}',
                  'Timezone':
                      '${user.location.timezone.offset} • ${user.location.timezone.description}',
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.lock_outline),
            title: const Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            childrenPadding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            children: [
              UserCard(
                title: 'Login',
                rows: {
                  'UUID': user.login.uuid,
                  'Username': user.login.username,
                  'Password': user.login.password,
                  'Salt': user.login.salt,
                  'MD5': user.login.md5,
                  'SHA1': user.login.sha1,
                  'SHA256': user.login.sha256,
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.cake_outlined),
            title: const Text(
              'Nascimento',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            childrenPadding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            children: [
              UserCard(
                title: 'Nascimento',
                rows: {
                  'Data': user.dob.date.toLocal().toString(),
                  'Idade': '${user.dob.age}',
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.event_available_outlined),
            title: const Text(
              'Registro',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            childrenPadding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            children: [
              UserCard(
                title: 'Registro',
                rows: {
                  'Data': user.registered.date.toLocal().toString(),
                  'Idade de registro': '${user.registered.age}',
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.assignment_ind_outlined),
            title: const Text(
              'Documento',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            childrenPadding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            children: [
              UserCard(
                title: 'Documento',
                rows: {
                  'Nome': user.idDoc.name ?? '-',
                  'Valor': user.idDoc.value ?? '-',
                },
              ),
            ],
          ),
          ExpansionTile(
            leading: const Icon(Icons.image_outlined),
            title: const Text(
              'Fotos',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            childrenPadding: const EdgeInsets.only(
              bottom: 8,
              left: 8,
              right: 8,
            ),
            children: [
              UserCard(
                title: 'Foto (Large)',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    user.picture.large,
                    height: 220,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              UserCard(
                title: 'Médias e Thumbs',
                child: Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          user.picture.medium,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          user.picture.thumbnail,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _removeUser(BuildContext context, UserRepository repo) async {
    bool? confirmed = await showModalBottomSheet<bool>(
      context: context,
      useSafeArea: true,
      showDragHandle: true,
      isScrollControlled: false,
      builder: (ctx) {
        return StatefulBuilder(
          builder: (ctx, setState) => Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Icon(Icons.delete_forever),
                  title: Text('Remover usuário'),
                  subtitle: Text('Confirma a remoção do usuário?'),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(ctx),
                        child: const Text('Cancelar'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton.icon(
                        icon: const Icon(Icons.check),
                        label: const Text('Confirmar'),
                        onPressed: () => Navigator.pop(ctx, true),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (confirmed == null || !confirmed) return;

    try {
      await repo.remove(user.login.uuid);
      AppSnackBar.success('Sucesso', 'Usuário removido.');
      if (context.mounted) Navigator.of(context).popUntil((r) => r.isFirst);
    } catch (e) {
      AppSnackBar.error(
        'Erro ao remover',
        e.toString().replaceFirst('Exception: ', ''),
      );
    }
  }
}
