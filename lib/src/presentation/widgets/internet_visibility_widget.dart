import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/src/presentation/cubits/internet/internet_visibility_cubit.dart';

class InternetVisibilityWidget extends StatelessWidget {
  final String message;
  final Color color;

  const InternetVisibilityWidget({
    Key? key,
    required this.message,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final internetVisibilityCubit = BlocProvider.of<InternetVisibilityCubit>(context);
    return BlocBuilder<InternetVisibilityCubit, InternetVisibilityState>(
      builder: (context, state) {
        return Visibility(
          visible: state.isVisible,
          child: Container(
              height: 40,
              color: color,
              child: Row(children: [
                const SizedBox(
                  width: 10,
                ),
                Text(message,
                    style:const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight
                            .w400)), //Your internet connection was restored.
                const Spacer(),
                Material(
                    color: Colors.transparent,
                    child: InkWell(
                        onTap: () {
                          internetVisibilityCubit.updateVisibility(false);
                        },
                        child: const Text('Dismiss',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold)))),
                const SizedBox(
                  width: 10,
                ),
              ])),
        );
      },
    );
  }


}