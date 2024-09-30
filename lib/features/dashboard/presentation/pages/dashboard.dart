import 'package:flutter/material.dart';
import 'package:flutter_assignment/core/di/di.dart';
import 'package:flutter_assignment/features/dashboard/domain/entity/statistics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/statitics_cubit.dart';

const dashboardRoute = '/dashboard';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: BlocProvider<StatisticsCubit>(
        create: (context) => serviceLocator()..fetchStatistics(),
        child: BlocBuilder<StatisticsCubit, List<Statistics>>(
          builder: (context, statistics) {
            if (statistics.isEmpty) {
              return const Center(child: CircularProgressIndicator());
            }
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // Statistics Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard(
                          'Users', '1.2K', Icons.person, Colors.blue),
                      _buildStatCard('Revenue', '\$12K', Icons.monetization_on,
                          Colors.green),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard(
                          'Orders', '450', Icons.shopping_cart, Colors.purple),
                      _buildStatCard(
                          'Reviews', '4.5/5', Icons.star, Colors.orange),
                    ],
                  ),
                  // Add charts if needed
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  // Statistic Card Widget
  Widget _buildStatCard(
      String title, String value, IconData icon, Color color) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(16),
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(title,
                style: const TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
