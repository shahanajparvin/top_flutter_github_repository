import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SortingValueSaveCubit extends Cubit<String> {
  SortingValueSaveCubit() : super("updatedDateTime"); // Default sorting option

  // Function to update the selected sorting option
  void updateSortingOption(String option) async {
    emit(option);
    // Persist the selected sorting option using SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('sorting_option', option);
  }

  // Function to retrieve the selected sorting option
  Future<void> getSortingOption() async {
    final prefs = await SharedPreferences.getInstance();
    final savedOption = prefs.getString('sorting_option');
    if (savedOption != null) {
      emit(savedOption);
    }
  }
}
