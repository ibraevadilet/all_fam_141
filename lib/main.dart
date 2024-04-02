import 'package:all_fam_141/content/cubit/load_data_cubit.dart';
import 'package:all_fam_141/content/transaction_hive_model/transaction_hive_model.dart';
import 'package:all_fam_141/pages/first_screen.dart';
import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

late final SharedPreferences affaafaf;
late final Box<TransactionHiveModel> trHive;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  affaafaf = await SharedPreferences.getInstance();
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionHiveModelAdapter());
  trHive = await Hive.openBox<TransactionHiveModel>('trHive');
  await Apphud.start(apiKey: 'app_iq3oC9NcMFStMu1THxda7rk8AM3Em4');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => BlocProvider(
        create: (context) => LoadDataCubit(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'All Fam 141',
          theme: ThemeData.dark().copyWith(
            appBarTheme: const AppBarTheme(
              backgroundColor: Color(0xff101010),
              shadowColor: Color(0xff101010),
            ),
            scaffoldBackgroundColor: const Color(0xff101010),
            splashColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            highlightColor: Colors.transparent,
          ),
          home: const FirstScreen(),
        ),
      ),
    );
  }
}
