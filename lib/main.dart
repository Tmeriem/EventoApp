import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'googleLoginController.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080,2280),
      builder: (context) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context)=> GoogleLoginController(),
              child: Login(),
            )
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                textTheme:GoogleFonts.nunitoSansTextTheme(
                  Theme.of(context).textTheme,
                )
            ),
            home: const Login(),
          ),
        );
      },
    );
  }
}

class splashscreen extends StatefulWidget {
  //new class for splashscreen
  const splashscreen({required Key key}) : super(key: key);

  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 8), () {
      //her duration is 6s
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Login()));
      //move it to dashboard screen
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/logoanime.json'),
            ],
          ),
        ),
      ),
    );
  }
}
