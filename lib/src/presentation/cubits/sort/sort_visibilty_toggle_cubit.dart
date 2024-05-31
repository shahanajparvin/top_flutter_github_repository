
import 'package:flutter_bloc/flutter_bloc.dart';

enum SortSectionVisibility { show, hide }

class SortSectionVisibilityCubit extends Cubit<SortSectionVisibility> {
  SortSectionVisibilityCubit() : super(SortSectionVisibility.hide);

  void toggleSortSectionVisibility() {
    if (state == SortSectionVisibility.show) {
      emit(SortSectionVisibility.hide);
    } else {
      emit(SortSectionVisibility.show);
    }
  }
}