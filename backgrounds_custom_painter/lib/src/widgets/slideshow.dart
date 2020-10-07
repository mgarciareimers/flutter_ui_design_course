import 'package:backgrounds_design/src/models/slider_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Slideshow extends StatelessWidget {
  final List<Widget> slides;
  final bool showOnTop;
  final Color primaryColor;
  final Color secondaryColor;

  const Slideshow({ @required this.slides, this.showOnTop = false, this.primaryColor = Colors.black, this.secondaryColor = Colors.grey });
  
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => new SliderModel(),
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              this.showOnTop ? _Dots(number: this.slides.length, primaryColor: this.primaryColor, secondaryColor: this.secondaryColor) : Container(),
              Expanded(child: _Slides(slides: this.slides)),
              this.showOnTop ? Container() : _Dots(number: this.slides.length, primaryColor: this.primaryColor, secondaryColor: this.secondaryColor),
            ],
          ),
        ),
      ),
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
      Provider.of<SliderModel>(this.context, listen: false).currentPage = this.pageViewController.page;
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
  final Color primaryColor;
  final Color secondaryColor;

  const _Dots({ @required this.number, this.primaryColor, this.secondaryColor });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(this.number, (index) => _Dot(index: index, primaryColor: this.primaryColor, secondaryColor: this.secondaryColor)),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final int index;
  final Color primaryColor;
  final Color secondaryColor;

  const _Dot({ Key key, @required this.index, this.primaryColor, this.secondaryColor }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pageViewIndex = Provider.of<SliderModel>(context).currentPage;

    return AnimatedContainer(
      margin: EdgeInsets.symmetric(horizontal: 8),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pageViewIndex >= this.index - 0.5 && pageViewIndex < this.index + 0.5 ? this.primaryColor : this.secondaryColor,
      ), duration: Duration(milliseconds: 200),
    );
  }
}
