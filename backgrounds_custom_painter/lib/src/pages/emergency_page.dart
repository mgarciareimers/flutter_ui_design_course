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
    List<Widget> items = this.modelItems.map((ItemEmergencyModel item) => ItemEmergency(icon: item.icon, text: item.text, colorStart: item.colorStart, colorEnd: item.colorEnd, onPress: () { print(item.text); })).toList();

    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 275),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: [
                SizedBox(height: 20),
                ...items,
                SizedBox(height: 20),
              ],
            ),
          ),
          PageHeader(),
        ],
      ),
    );
  }
}

class PageHeader extends StatelessWidget {
  const PageHeader({ Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconHeader(icon: FontAwesomeIcons.plus, title: 'Medical Assistance', subtitle: 'You have requested', colorStart: Color(0xff526BF6), colorEnd: Color(0xff67ACF2));
  }
}
