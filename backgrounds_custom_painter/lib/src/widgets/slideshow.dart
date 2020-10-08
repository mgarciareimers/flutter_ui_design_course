import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Models.
//import 'package:backgrounds_design/src/models/slider_model.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool showOnTop;
  final Color primaryColor;
  final Color secondaryColor;
  final double primaryBulletSize;
  final double secondaryBulletSize;

  const Slideshow({ @required this.slides, this.showOnTop = false, this.primaryColor = Colors.black, this.secondaryColor = Colors.grey, this.primaryBulletSize = 12, this.secondaryBulletSize = 12 });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new _SlideShowModel(),
      child: SafeArea(
        child: Center(
          child: Builder(
            builder: (BuildContext context) {
              Provider.of<_SlideShowModel>(context).primaryColor = this.primaryColor;
              Provider.of<_SlideShowModel>(context).secondaryColor = this.secondaryColor;
              Provider.of<_SlideShowModel>(context).primaryBulletSize = this.primaryBulletSize;
              Provider.of<_SlideShowModel>(context).secondaryBulletSize = this.secondaryBulletSize;

              return this._createContent();
            },
          ),
        ),
      ),
    );
  }

  // Method that creates the content.
  Widget _createContent() {
    return Column(
      children: [
        this.showOnTop ? _Dots(number: this.slides.length) : Container(),
        Expanded(child: _Slides(slides: this.slides)),
        this.showOnTop ? Container() : _Dots(number: this.slides.length),
      ],
    );
  }
}



class _Slides extends StatefulWidget {
  final List<Widget> slides;

  const _Slides({ this.slides });
  
  @override
  __SlidesState createState() => __SlidesState();
}

class __SlidesState extends State<_Slides> {
  final PageController pageViewController = new PageController();

  @override
  void initState() {
    this.pageViewController.addListener(() {
      Provider.of<_SlideShowModel>(this.context, listen: false).currentPage = this.pageViewController.page;
    });
    super.initState();
  }

  @override
  void dispose() {
    this.pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        controller: this.pageViewController,
        physics: BouncingScrollPhysics(),
        children: widget.slides.map((slide) => _Slide(slide: slide,)).toList(),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Widget slide;

  const _Slide({ this.slide });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: EdgeInsets.all(80),
      child: this.slide,
    );
  }
}

class _Dots extends StatelessWidget {
  final int number;

  const _Dots({ @required this.number });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.number, (index) => _Dot(index: index)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;

  const _Dot({ Key key, @required this.index }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final slideShowModel = Provider.of<_SlideShowModel>(context);
    final bool isPrimary = slideShowModel.currentPage >= this.index - 0.5 && slideShowModel.currentPage < this.index + 0.5;

    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: isPrimary ? slideShowModel.primaryBulletSize : slideShowModel.secondaryBulletSize,
      height: isPrimary ? slideShowModel.primaryBulletSize : slideShowModel.secondaryBulletSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isPrimary ? slideShowModel.primaryColor : slideShowModel.secondaryColor,
      ), duration: Duration(milliseconds: 200),
    );
  }
}

class _SlideShowModel with ChangeNotifier {
  double _currentPage = 0;
  Color _primaryColor = Colors.black;
  Color _secondaryColor = Colors.grey;
  double _primaryBulletSize = 12;
  double _secondaryBulletSize = 12;

  // Current page.
  double get currentPage => this._currentPage;

  set currentPage(double currentPage) {
    this._currentPage = currentPage;

    notifyListeners();
  }

  // Primary color.
  Color get primaryColor => this._primaryColor;

  set primaryColor(Color color) {
    this._primaryColor = color;

    //notifyListeners(); Not required because primary color is only set once.
  }

  // Secondary color.
  Color get secondaryColor => this._secondaryColor;

  set secondaryColor(Color color) {
    this._secondaryColor = color;

    //notifyListeners(); Not required because secondary color is only set once.
  }

  // Primary bullet size.
  double get primaryBulletSize => this._primaryBulletSize;

  set primaryBulletSize(double size) {
    this._primaryBulletSize = size;

    //notifyListeners(); Not required because primary bullet size is only set once.
  }

  // Secondary bullet size.
  double get secondaryBulletSize => this._secondaryBulletSize;

  set secondaryBulletSize(double size) {
    this._secondaryBulletSize = size;

    //notifyListeners(); Not required because secondary bullet size is only set once.
  }
}