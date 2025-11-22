import 'package:easacc/features/home/presentation/controller/home_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: Builder(
        builder: (innerContext) {
          return Scaffold(
            bottomNavigationBar: _buildBottomNavigationBar(innerContext),
            body: SafeArea(
              child: BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  return context.read<HomeCubit>().views[context
                      .read<HomeCubit>()
                      .currentView];
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
      ],
      onTap: (index) {
        context.read<HomeCubit>().changeView(index);
      },
    );
  }
}
