import 'package:dwbarbershop/src/core/ui/constants.dart';
import 'package:dwbarbershop/src/feature/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 100 * _scale;
  double get _logoAnimationHeigth => 120 * _scale;


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) { 
      setState(() {
        _animationOpacityLogo = 1.0;
        _scale = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
        body:  DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  ImageConstants.backgroundChair,
                ),
                opacity: 0.2,
                fit: BoxFit.cover),
          ),
          child: Center(
            child: AnimatedOpacity (
              duration: const Duration(seconds: 3),
              curve: Curves.easeIn,
              opacity:  _animationOpacityLogo,
              onEnd: () {
                Navigator.of(context).pushAndRemoveUntil(
                  PageRouteBuilder(
                  settings:  const RouteSettings(name: '/auth/login'),
                  pageBuilder: (
                  context, 
                  animation, 
                  secondaryAnimation,
                  ){
                    return const LoginPage();
                  },
                  transitionsBuilder: (_, animation, __, child) {
                    return FadeTransition(opacity: animation,child: child,);
                    
                  },
                  ), 
                  (route) => false
                  );
              } ,
              child: AnimatedContainer(
              duration: const Duration(seconds: 3),
              width:  _logoAnimationWidth,
              height: _logoAnimationHeigth,
              curve: Curves.linearToEaseOut,
              child: Image.asset(ImageConstants.imageLogo, fit: BoxFit.cover)
              )
            ) 
            ),
          ),
        );
  }
}
