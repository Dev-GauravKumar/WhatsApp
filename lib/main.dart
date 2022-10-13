import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp/Screens/HomePage.dart';
import 'package:whatsapp/Themes/ThemeManager.dart';
import 'package:whatsapp/Themes/ThemesConstants.dart';
import 'package:whatsapp/ViewModel/ViewModel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
    ChangeNotifierProvider<UserData>(
    create: (context)=>UserData(),
    ),
      ChangeNotifierProvider<ThemeManager>(create: (context)=>ThemeManager(),),
    ],
      child: const MaterialAppWithTheme(),
    );
  }
}
class MaterialAppWithTheme extends StatelessWidget {
  const MaterialAppWithTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider=Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: provider.themeMode,
      home: const HomePage(),
    );
  }
}
