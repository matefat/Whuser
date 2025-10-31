import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:whuser/models/user_model.dart';
import 'package:whuser/repositories/user_repository.dart';
import 'package:whuser/widgets/snack.dart';

class HomeViewModel extends ChangeNotifier {
  final UserRepository repo;

  final List<User> _users = [];
  UnmodifiableListView<User> get users => UnmodifiableListView(_users);

  late final Ticker _ticker;
  bool _loopStarted = false;

  bool _loading = false;
  bool get loading => _loading;

  HomeViewModel({required this.repo, required TickerProvider tickerProvider}) {
    _users.addAll(repo.getAllPersisted());
    _ticker = tickerProvider.createTicker(_onTick)..start();
  }

  Future<void> _onTick(Duration _) async {
    if (_loopStarted) return;
    _loopStarted = true;

    while (_ticker.isActive) {
      await _fetchAndAppend();
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  Future<void> _fetchAndAppend() async {
    if (_loading) return;
    _loading = true;
    notifyListeners();

    try {
      final user = await repo.fetchAndPersist();
      _users.insert(0, user);
    } catch (e) {
      AppSnackBar.error(
        'Falha ao atualizar',
        e.toString().replaceFirst('Exception: ', ''),
      );
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _ticker.dispose();
    super.dispose();
  }
}
