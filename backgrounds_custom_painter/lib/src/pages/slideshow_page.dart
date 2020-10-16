import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// Widgets
import 'package:backgrounds_design/src/widgets/slideshow.dart';

class SlideShowPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: _MySlideShow()),
          Expanded(child: _MySlideShow()),
        ],
      ),
    );
  }
}

class _MySlideShow extends StatelessWidget {
  const _MySlideShow({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slideshow(
      showOnTop: false,
      primaryColor: Colors.black,
      secondaryColor: Colors.grey,
      primaryBulletSize: 14,
      secondaryBulletSize: 10,
      slides: [
        SvgPicture.asset('assets/svg/slide_1.svg'),
        SvgPicture.asset('assets/svg/slide_2.svg'),
        SvgPicture.asset('assets/svg/slide_3.svg'),
        SvgPicture.asset('assets/svg/slide_4.svg'),
        SvgPicture.asset('assets/svg/slide_5.svg'),
      ],
    );
  }
}


