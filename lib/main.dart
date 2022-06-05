import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_bloc.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/controller/main_screen_events.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/pages/describe_screen.dart';
import 'package:test_work_elki/features/list_of_houses/presentation/pages/main_screen.dart';
import 'package:test_work_elki/service_locator.dart';

GetIt sl = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
  );
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MainScreenBlock>(
          create: (context) => MainScreenBlock(sl())..add(MainScreenLoadEvent()))
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/' :(context) => const MainScreen(),
          '/describe' : (context) => const DescribeScreen()
        },
      ),
    );
  }
}


