import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:news/bloc/cubit.dart';
import 'package:news/bloc/language_cubit.dart';
import 'package:news/generated/l10n.dart';
import 'package:news/ui/home.dart';
import 'package:news/ui/news_details.dart';
import 'package:news/ui/settings_tab.dart';
import 'package:permission_handler/permission_handler.dart';

import 'bloc/observer.dart';
bool isConnect=false;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  final connectionChecker = InternetConnectionChecker();

  final subscription = connectionChecker.onStatusChange.listen(
        (InternetConnectionStatus status) {
      if (status == InternetConnectionStatus.connected) {
        print('Connected to the internet');
        isConnect = true;
      } else {
        print('Disconnected from the internet');
        isConnect = false;
      }
    },
  );
  await requestPermission();
  runApp(const MyApp());
}
Future<bool>requestPermission()async{
  var status = await Permission.storage.request();
  return status.isGranted;
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: Builder(
        builder: (context) {
          return  BlocBuilder<LanguageCubit,String>(
            builder: (context,stats) {
              return MaterialApp(

                locale: Locale(stats),
                  localizationsDelegates: [
                          S.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                      ],
                      supportedLocales: S.delegate.supportedLocales,
                routes:{
              HomeScreen.routeName :(context) => HomeScreen(),
              NewsDetails.routeName:(context) => NewsDetails(),
              SettingsTab.routeName:(context) => SettingsTab(),
                },
                initialRoute: HomeScreen.routeName,
                debugShowCheckedModeBanner: false,
              );
            }
          );
        }
      ),
    );
  }
}

