import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_flutter_repo/src/presentation/cubits/sort/sort_value_save_cubit.dart';
import 'package:top_flutter_repo/src/presentation/cubits/sort/sort_visibilty_toggle_cubit.dart';



class SortWidget extends StatelessWidget {

  final void Function(String sortValue) onPress;
  const SortWidget({super.key, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SortSectionVisibilityCubit, SortSectionVisibility>(
        builder: (context, sortSectionVisibility) {
          return Column(
            children: [
              BlocBuilder<SortingValueSaveCubit, String>(
                builder: (context, selectedOption) {
                  return Column(children: [
                    if (sortSectionVisibility == SortSectionVisibility.show)
                      Container(
                        width: double.infinity,
                        color: Colors.grey.shade300,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment : CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0, top: 15, bottom: 5),
                              child: Text('Sort by'),
                            ),
                  Theme(
                  data: ThemeData(
                  //here change to your color
                  unselectedWidgetColor: Colors.white,
                  ),
                  child:Row(
                              children: [
                                Radio<String>(
                                  value: "update",
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    context.read<SortingValueSaveCubit>().updateSortingOption(value!);
                                    onPress(value);
                                  },
                                ),
                                const Text('Updated DateTime'),
                                Radio<String>(
                                  value: "start",
                                  groupValue: selectedOption,
                                  onChanged: (value) {
                                    context.read<SortingValueSaveCubit>().updateSortingOption(value!);
                                    onPress(value);
                                  },
                                ),
                                const Text('Star'),
                              ],
                            )),
                          ],
                        ),
                      )
                  ]);
                },
              )
            ]
          );
        });
  }

}