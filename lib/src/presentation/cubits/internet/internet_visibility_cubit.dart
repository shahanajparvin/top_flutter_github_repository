import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_visibility_status.dart';

class InternetVisibilityCubit extends Cubit<InternetVisibilityState> {
  InternetVisibilityCubit() : super(InternetVisibilityState(false));

  void updateVisibility(bool isVisible) {
    emit(InternetVisibilityState(isVisible));
  }
}