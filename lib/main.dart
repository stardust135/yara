import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yara/config/routes/routes.dart';
import 'package:yara/core/blocs/app_bloc.dart';
import 'package:yara/core/utils/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'locator.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await setupLocator();
  await locator.dbManager.initValues();
  await locator.settings.initValues();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppBloc(locator()),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: const Color(0xff68be4f),
          useMaterial3: false,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.screensWrapper,
        onGenerateRoute: Routes.generateRoute,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('fa', 'IR'), // Farsi (Persian)
        ],
      ),
    );
  }
}