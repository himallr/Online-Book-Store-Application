import 'package:book_shopping_app/model/user_model.dart';
import 'package:book_shopping_app/pages/Login_page.dart';
import 'package:book_shopping_app/pages/home_page.dart';
import 'package:book_shopping_app/provider/auth_provider.dart';
import 'package:book_shopping_app/services/firestore_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'auth_widget_builder.dart';
import 'package:book_shopping_app/model/cart_model.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
            create: (context) => CartModel())

      ],
      child: MyApp(
        databaseBuilder: (_, uid) => FirestoreDatabase(uid: uid),
        key: Key('MyApp'),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.databaseBuilder}) : super(key: key);

  // This widget is the root of your application.
  final FirestoreDatabase Function(BuildContext context, String uid)
  databaseBuilder;

  @override
  Widget build(BuildContext context) {
    return AuthWidgetBuilder(
      builder: (BuildContext context,
          AsyncSnapshot<UserModel> userSnapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Consumer<AuthProvider>(
            builder: (_, authProviderRef, __) {
              print(userSnapshot.hasData);

              if (userSnapshot.connectionState == ConnectionState.active) {
                return (userSnapshot.hasData && userSnapshot.data!.uid != 'null') ? HomePage() : LoginPage();
              }

              return Material(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      },
      key: Key('Myapp'),
      databaseBuilder: databaseBuilder,
    );
  }
}
