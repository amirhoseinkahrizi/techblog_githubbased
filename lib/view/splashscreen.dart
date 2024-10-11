import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'package:techblog_githubbased/component/my_colors.dart';
import 'package:techblog_githubbased/gen/assets.gen.dart';
import 'package:techblog_githubbased/view/main_screen/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
Future.delayed( const Duration(seconds: 5)).then((value) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MainScreen()));
},);    

super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Assets.images.logo.image(height: 60),
          ),
          const SizedBox(
            height: 35,
          ),
          const SpinKitCubeGrid(
            color: SolidColors.maincolor,
            size: 50.0,
          )
        ],
      ),
    );
  }
}
