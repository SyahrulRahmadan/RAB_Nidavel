import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'pages/homepage.dart';
import 'models/pages/pages.dart';
import 'models/proyek/proyek.dart';
import 'models/material/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PagesBloc>(
          create: (context) => PagesBloc()..add(PagesLoadingEvent()),
        ),
        BlocProvider<ProyekBloc>(
          create: (context) => ProyekBloc()..add(ProyekLoadingEvent()),
        ),
        BlocProvider<MaterialBloc>(
          create: (context) => MaterialBloc()..add(MaterialEventLoad()),
        )
      ], 
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      )
    );
  }
}
