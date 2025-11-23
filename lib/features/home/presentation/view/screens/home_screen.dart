import 'package:easacc/features/home/presentation/controller/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeCubit cubit = HomeCubit();

  @override
  void dispose() {
    cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Builder(
        builder: (innerContext) {
          return Scaffold(
            bottomNavigationBar: _buildBottomNavigationBar(innerContext),
            body: SafeArea(
              child: BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  return cubit.views[cubit.currentView];
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        return BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings',
            ),
          ],
          currentIndex: cubit.currentView,
          onTap: (index) {
           cubit.changeView(index);
          },
        );
      },
    );
  }
}
