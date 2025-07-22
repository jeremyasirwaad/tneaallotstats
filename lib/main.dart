import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart' hide CarouselController;
import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:tneadash/jsondartmodel/cvreportmodel.dart';
// import './models/cusdrawer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
// import './jsondartmodel/countmodel.dart';
import 'package:http/http.dart' as http;

import 'package:tneadash2/R2Homepage.dart';
import './models/allotstats.dart';
import './R1agtfc.dart';
import './Cusdrawer2.dart';
import './govtmain.dart';
import './Homepage.dart';
import './R1summary.dart';
import './R2summary.dart';
import './R3Homepage.dart';
import './R4Homepage.dart';
import './services/config_service.dart';
import './screens/config_screen.dart';
import './widgets/loading_screen.dart';
// import 'package:multilevel_drawer/multilevel_drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ConfigService.instance.loadConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allotment and Admissions',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: _appDecider(),
      routes: {
        '/config': (context) => const ConfigScreen(),
      },
    );
  }
}

class _AppDecider extends StatefulWidget {
  @override
  _AppDeciderState createState() => _AppDeciderState();
}

class _AppDeciderState extends State<_AppDecider> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _checkConfiguration();
  }

  Future<void> _checkConfiguration() async {
    // Small delay to show loading screen
    await Future.delayed(const Duration(milliseconds: 500));
    
    // Ensure configuration is loaded
    await ConfigService.instance.loadConfig();
    
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const LoadingScreen();
    }

    // Check if configuration is complete
    if (!ConfigService.instance.isConfigured) {
      return const ConfigScreen();
    }
    
    return homepagedecider();
  }
}

Widget _appDecider() {
  return _AppDecider();
}

Widget homepagedecider() {
  final DateTime round1 = DateTime(2025, 7, 19, 0, 0);
  final DateTime round2 = DateTime(2025, 7, 31, 0, 0);
  final DateTime round3 = DateTime(2025, 8, 12, 0, 0);
  DateTime today = DateTime.now();


  if (today.compareTo(round3) > 0) {
    return const R3MyHomePage();
  }
  if (today.compareTo(round2) > 0) {
    return const R2MyHomePage();
  }
  if (today.compareTo(round1) > 0) {
    return const MyHomePage();
  } else {
    return const MyHomePage();
  }
}
