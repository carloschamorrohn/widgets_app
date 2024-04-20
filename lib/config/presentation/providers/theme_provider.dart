import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

// Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Un simple boolean
final isDarkModeProvider = StateProvider<bool>((ref) => false);

//Un simple entero
final selectedColorProvider = StateProvider<int>((ref) => 0);

//Una objeto de tipo AppTheme

final themeNotifierProvider = StateNotifierProvider<ThemeNotifier,AppTheme>(
  (ref) => ThemeNotifier(),
  );

class ThemeNotifier extends StateNotifier<AppTheme> {
  //STATE = Estado = new AppTheme()
  ThemeNotifier() : super(AppTheme());

  void toggleDarkMode() {
   state = state.copyWith(isDarkMode: !state.isDarkMode);
  }

  void changeColorIndex(int colorIndex) {
    state = state.copyWith(selectedColor: colorIndex);
  }
}
