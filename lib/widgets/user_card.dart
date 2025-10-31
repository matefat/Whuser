import 'package:flutter/material.dart';

/// Card reutilizável para exibir as informações do usuário.
class UserCard extends StatelessWidget {
  final String title;
  final Map<String, String?> rows;
  final Widget? child;

  const UserCard({
    super.key,
    required this.title,
    this.rows = const {},
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      elevation: 1.5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
              ),
            ),
            const Divider(height: 16),
            if (rows.isNotEmpty)
              ...rows.entries.map(
                    (e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          e.key,
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      Expanded(child: Text(e.value ?? '-')),
                    ],
                  ),
                ),
              ),
            if (child != null) ...[
              const SizedBox(height: 8),
              child!,
            ],
          ],
        ),
      ),
    );
  }
}
