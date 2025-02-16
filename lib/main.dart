import 'package:flutter/material.dart';
import 'package:flutter_localization/src/app_localizations.g.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en', '');

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Localization Example',
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      home: HomePage(onLanguageChange: _changeLanguage),
    );
  }
}

class HomePage extends StatelessWidget {
  final Function(Locale) onLanguageChange;

  const HomePage({super.key, required this.onLanguageChange});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.appTitle)),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppLocalizations.of(context)!.greeting),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () => onLanguageChange(const Locale('es', '')),
              child: Text('Switch to Spanish'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => onLanguageChange(const Locale('en', '')),
              child: Text('Switch to English'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () => onLanguageChange(const Locale('fr', '')),
              child: Text('Switch to French'),
            ),
          ],
        ),
      ),
    );
  }
}
