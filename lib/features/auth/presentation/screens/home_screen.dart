import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../home/presentation/widgets/cases_summary_card.dart';
import '../../../home/presentation/widgets/clients_progress_card.dart';
import '../../../home/presentation/widgets/task_summary_card.dart';
import '../../../home/presentation/widgets/users_count_card.dart';
import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                   Expanded(
                    child: TaskSummaryCard(
                      total: 305,
                      progress: 0.7,
                      icon: Icon(Icons.description_outlined, size: 48.r, color: Colors.black87),
                    ),
                  ),
                  20.horizontalSpace,
                  const Expanded(
                      child: CasesSummaryCard(
                    total: 155,
                    openCount: 948,
                    closedCount: 948,
                    inProgressCount: 948,
                  ))
                ],
              ),
              32.h.verticalSpace,
              Row(
                children: [
                  const Expanded(
                    child: UsersCountCard(
                      total: 11,
                      avatars: [
                        AssetImage('assets/avatars/a1.jpg'),
                        AssetImage('assets/avatars/a2.jpg'),
                        AssetImage('assets/avatars/a3.jpg'),
                        AssetImage('assets/avatars/a4.jpg'),
                        AssetImage('assets/avatars/a5.jpg'),
                        AssetImage('assets/avatars/a6.jpg'),
                        AssetImage('assets/avatars/a7.jpg'),
                      ],
                    ),
                  ),
                  20.w.horizontalSpace,
                  const Expanded(
                    child: ClientsProgressCard(
                      total: 100,
                      maleRatio: 1,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
