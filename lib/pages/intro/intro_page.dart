import 'package:aoura_chat/pages/home/home_widget.dart';
import 'package:aoura_chat/pages/home/screens/main_page.dart';
import 'package:aoura_chat/resources/firebase_methods_new.dart';
import 'package:aoura_chat/resources/firebase_repository.dart';
import 'package:aoura_chat/widgets/styleguide/responsive_ui/size_config.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  FirebaseRepository _firebaseRepository = FirebaseRepository();
  FirebaseMethods _firebaseMethods = FirebaseMethods();
  PageController _pageController;
  int currentIndex = 0;
  static var stepOneContent = "Your personalized chatroom ...";
  static var stepTwoContent = "";
  static var stepThreeContent = "";

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: CircularParticle(
              awayRadius: 80,
              numberOfParticles: 40,
              speedOfParticles: 1,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              onTapAnimation: true,
              particleColor: Colors.red.withAlpha(150),
              awayAnimationDuration: Duration(milliseconds: 600),
              maxParticleSize: 8,
              isRandSize: true,
              isRandomColor: true,
              randColorList: [
                Colors.red.withAlpha(210),
                Colors.white.withAlpha(210),
                Colors.yellow.withAlpha(210),
                Colors.green.withAlpha(210)
              ],
              awayAnimationCurve: Curves.easeInOutBack,
              enableHover: true,
              hoverColor: Colors.white,
              hoverRadius: 290,
              connectDots: false,
            ),
          ),
          PageView(
            onPageChanged: (int page) {
              setState(() {
                currentIndex = page;
              });
            },
            controller: _pageController,
            children: <Widget>[
              makePage(
                  image: 'assets/images/logo/logo_aoura.png',
                  content: stepOneContent),
              makePage(
                  image: 'assets/images/step-two.png', content: stepTwoContent),
              makePage(
                  image: 'assets/images/step-three.png',
                  content: stepThreeContent),
            ],
          ),
          Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                  bottom: SizeConfig.heightMultiply(220),
                  left: SizeConfig.widthMultiply(80),
                  right: SizeConfig.widthMultiply(80)),
              child: MaterialButton(
                onPressed: () => performLogin(),
                color: Colors.red,
                minWidth: MediaQuery.of(context).size.width / 2,
                height: 60,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      image: NetworkImage(
                          "https://img.icons8.com/bubbles/50/000000/google-logo.png"),
                      width: 40,
                      height: 40,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Text(
                        "Sign-in with Google",
                        style: GoogleFonts.lato(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: SizeConfig.heightMultiply(120)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          )
        ],
      ),
    );
  }

  void performLogin() {
    _firebaseMethods.signInWithGoogle().whenComplete(() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return MainWidget();
          },
        ),
      );
    });
  }

  Widget makePage({image, content, reverse = false}) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          !reverse
              ? Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiply(20),
                          vertical: 30),
                      child: Image.asset(
                        image,
                        height: SizeConfig.heightMultiply(150),
                        width: SizeConfig.widthMultiply(150),
                      ),
                    ),
                  ],
                )
              : SizedBox(),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.widthMultiply(50),
                right: SizeConfig.widthMultiply(50),
                bottom: SizeConfig.heightMultiply(60)),
            child: Text(content,
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                    color: Colors.white,
                    fontSize: SizeConfig.textMultiply(16),
                    fontWeight: FontWeight.w400)),
          ),
          reverse
              ? Column(
                  children: <Widget>[
                    SizedBox(
                      height: SizeConfig.heightMultiply(30),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.widthMultiply(20)),
                      child: Image.asset(image),
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: SizeConfig.heightMultiply(8),
      width:
          isActive ? SizeConfig.widthMultiply(30) : SizeConfig.widthMultiply(8),
      margin: EdgeInsets.only(right: SizeConfig.widthMultiply(5)),
      decoration: BoxDecoration(
          color: Colors.black.withAlpha(390),
          borderRadius: BorderRadius.circular(5)),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < 3; i++) {
      if (currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }
}
