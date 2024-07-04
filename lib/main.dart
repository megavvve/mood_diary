import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mood_diary/presentation/providers/notes_provider.dart';
import 'package:mood_diary/presentation/providers/self_esteem_provider.dart';
import 'package:mood_diary/presentation/providers/stress_level_provider.dart';
import 'package:provider/provider.dart';
import 'presentation/screens/home_screen/home_screen.dart';
import 'presentation/providers/home_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ru');
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
        ChangeNotifierProvider(create: (_) => StressLevelProvider()),
        ChangeNotifierProvider(create: (_) => SelfEsteemProvider()),
        ChangeNotifierProvider(create: (_) => NotesProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: child,
        );
      },
      child: const HomeScreen(),
    );
  }
}
