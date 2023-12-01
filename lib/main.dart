import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:test_lift_app/global_import.dart';
import 'features/home_window/home_window.dart';
import 'theme.dart';
import 'package:test_lift_app/features/house_window/index.dart';

void main() {
  //sqflite initialization
  sqfliteFfiInit();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      routes: {
        '/houseWindow': (context) => const HouseWindow(),
      },
      home: const Scaffold(
        body: Center(
          child: HomeWindow(),
        ),
      ),
    );
  }
}
