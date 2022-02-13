import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo_mobx/screens/base/base_screen.dart';
import 'package:xlo_mobx/stores/category_store.dart';
import 'package:xlo_mobx/stores/home_store.dart';
import 'package:xlo_mobx/stores/page_store.dart';
import 'package:xlo_mobx/stores/user_manager_store.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(HomeStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
}

Future<void> initializeParse() async {
  await Parse().initialize('JJBBgFzlcJtfRKlAjmSSUxzzV7sHomvs7SKLlr7I',
      'https://parseapi.back4app.com/',
      clientKey: 'vZHjfBduz9zmgsfvZZJmBogbVYy3IZJmkwkfLHVp',
      autoSendSessionId: true,
      debug: true);

  // Insert
  // final category = ParseObject('Categories')
  //   ..set<String>('Title', 'Camisetas')
  //   ..set<int>('Position', 2);

  // final response = await category.save();

  // print(response.success);

  // Update
  // final category = ParseObject('Categories')
  //   ..objectId = 'BASVTwqH6Q'
  //   ..set('Position', 4);

  // final response = await category.save();

  // print(response.success);

  // Delete
  // final category = ParseObject('Categories')
  //   ..objectId = 'BASVTwqH6Q';

  // final response = await category.delete();

  // print(response.success);

  // GET
  // final response = await ParseObject('Categories').getObject('87lSXc7Ybu');
  // if (response.success) {
  //   print(response.result);
  // }

  // GET ALL
  // final response = await ParseObject('Categories').getAll();
  // if (response.success) {
  //   for (final object in response.result) {
  //     print(object);
  //   }
  // }

  // Query
  // final query = QueryBuilder(ParseObject('Categories'));
  // query.whereEqualTo('Position', 2);

  // final response = await query.query();

  // if (response.success) {
  //   print(response.result);
  // }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.purple,
        scaffoldBackgroundColor: Colors.purple,
        appBarTheme: const AppBarTheme(elevation: 0),
        cursorColor: Colors.orange,
      ),
      supportedLocales: const [
        Locale('pt', 'BR'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      home: BaseScreen(),
    );
  }
}
