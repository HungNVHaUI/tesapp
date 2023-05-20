import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:testapp/firebase_options.dart';
import 'package:testapp/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:testapp/src/repository/authentication_repository/authentication_repository.dart';
import 'package:testapp/src/utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super (key : key);


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.leftToRightWithFade,
      transitionDuration: const Duration(milliseconds: 500),
      home: SplashScreen(),
    );

  }
}
class AppHome extends StatelessWidget {
  const AppHome({Key? key}) : super (key : key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("....data"), leading: const Icon(Icons.image_outlined),),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.add_shopping_cart_outlined), onPressed: () {
        print("Button pressed");
      },),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
             Text(
              "heading",
              style: Theme.of(context).textTheme.headline2,
            ),
            const Text("sub_heading"),
            ElevatedButton(onPressed: () {}, child: const Text("ElevatedButton"),),
            OutlinedButton(onPressed: () {}, child: const Text("OutlineButton"),),
            const Padding(padding: EdgeInsets.all(20.0),
              child: Image(image: AssetImage('assets/images/aaa.png')),

            ),
          ],
        ),

      ),
    );
  }

}



