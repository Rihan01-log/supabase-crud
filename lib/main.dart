import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase1/homepage.dart';
import 'package:supabase1/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
      url: 'https://lzhshigibbkztjiapbdh.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imx6aHNoaWdpYmJrenRqaWFwYmRoIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg1NzQ5NjcsImV4cCI6MjA1NDE1MDk2N30.LnRinRNdpSTD8Gm346-vwMFsRE5gq6RNGcile9lCWec');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Supapprovider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: Homepage(),
      ),
    );
  }
}
