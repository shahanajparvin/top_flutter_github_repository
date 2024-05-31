import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/src/presentation/cubits/internet/internet_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/internet/internet_visibility_cubit.dart';
import 'package:top_flutter_repo/src/presentation/widgets/internet_visibility_widget.dart';


class InternetStatusWidget extends StatelessWidget {
  const InternetStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final internetVisibilityCubit = BlocProvider.of<InternetVisibilityCubit>(context);
    return BlocBuilder<InternetCubit, InternetState>(

      builder: (context, state) {
        Timer(const Duration(seconds: 3), () {
          if (state is InternetConnected) {
            internetVisibilityCubit.updateVisibility(false);
          }
        });
        if (state is InternetConnected) {
          internetVisibilityCubit.updateVisibility(true);
            return InternetVisibilityWidget(
                message: 'Online Back', color: Colors.green.shade800);
          }
         else if (state is InternetDisconnected) {
          internetVisibilityCubit.updateVisibility(true);
          return InternetVisibilityWidget(
              message: 'No Internet', color: Colors.red.shade800);
        }
        return const SizedBox();
      },
    );
  }

}
