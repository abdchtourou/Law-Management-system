import 'package:flutter/material.dart';

import '../models/simple_user.dart';
import 'create_administrative_task_screen.dart';
import 'create_legal_task_screen.dart';

export 'create_administrative_task_screen.dart';
export 'create_legal_task_screen.dart';

// =========================
// Demo Home (optional)
// =========================
class DemoCreateTaskHome extends StatelessWidget {
  const DemoCreateTaskHome({super.key});

  @override
  Widget build(BuildContext context) {
    const users = [
      SimpleUser(id: '1', name: 'محمد سعيد'),
      SimpleUser(id: '2', name: 'نور'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
      SimpleUser(id: '3', name: 'أحمد'),
    ];

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(title: const Text('Demo')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CreateAdministrativeTaskScreen(users: users),
                    ),
                  );
                },
                child: const Text('فتح مهمة إدارية'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CreateLegalTaskScreen(
                        insideUsers: users,
                        outsideUsers: users,
                      ),
                    ),
                  );
                },
                child: const Text('فتح مهمة قانونية'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
