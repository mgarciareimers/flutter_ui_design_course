import 'package:animate_do/animate_do.dart';
import 'package:backgrounds_design/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Models.
import 'package:backgrounds_design/src/models/item_emergency_model.dart';

// Widgets.
import 'package:backgrounds_design/src/widgets/item_emergency.dart';
import 'package:backgrounds_design/src/widgets/headers.dart';

class EmergencyPage extends StatelessWidget {

  final List<ItemEmergencyModel> modelItems = [
    new ItemEmergencyModel(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5)),
    new ItemEmergencyModel(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6)),
    new ItemEmergencyModel(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemEmergencyModel(FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
    new ItemEmergencyModel(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5)),
    new ItemEmergencyModel(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6)),
    new ItemEmergencyModel(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemEmergencyModel(FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
    new ItemEmergencyModel(FontAwesomeIcons.carCrash, 'Motor Accident', Color(0xff6989F5), Color(0xff906EF5)),
    new ItemEmergencyModel(FontAwesomeIcons.plus, 'Medical Emergency', Color(0xff66A9F2), Color(0xff536CF6)),
    new ItemEmergencyModel(FontAwesomeIcons.theaterMasks, 'Theft / Harrasement', Color(0xffF2D572), Color(0xffE06AA3)),
    new ItemEmergencyModel(FontAwesomeIcons.biking, 'Awards', Color(0xff317183), Color(0xff46997D)),
  ];
  
  @override
  Widget build(BuildContext context) {
    bool isHighScreen = MediaQuery.of(context).size.height > MyApp.BIG_SCREEN_SIZE;

    List<Widget> items = this.modelItems.map((ItemEmergencyModel item) => FadeInLeft(
      duration: Duration(milliseconds: 500),
      child: ItemEmergency(icon: item.icon, text: item.text, colorStart: item.colorStart, colorEnd: item.colorEnd, onPress: () { print(item.text); }))
    ).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: isHighScreen ?  275 : 0),
            child: SafeArea(
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  isHighScreen ? SizedBox(height: 20) : Container(),
                  ...items,
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
          isHighScreen ? PageHeader() : Container(),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconHeader(icon: FontAwesomeIcons.plus, title: 'Medical Assistance', subtitle: 'You have requested', colorStart: Color(0xff526BF6), colorEnd: Color(0xff67ACF2)),
        Positioned(
          child: RawMaterialButton(
            padding: EdgeInsets.all(15),
            onPressed: () {},
              shape: CircleBorder(),
            child: FaIcon(FontAwesomeIcons.ellipsisV, color: Colors.white, size: 20)
          ),
          right: -10,
          top: 45,
        )
      ],
    );
  }
}
