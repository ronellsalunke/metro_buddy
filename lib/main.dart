import 'package:flutter/material.dart';
import 'package:metro_buddy/di/service_locator.dart';
import 'package:metro_buddy/modules/home/home_page.dart';
import 'package:metro_buddy/providers/metro_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => getIt<MetroProvider>()..fetchMetroData())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Metro Buddy',
        theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey)),
        home: const HomePage(),
      ),
    );
  }
}
