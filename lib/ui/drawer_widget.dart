import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/generated/l10n.dart';
import 'package:news/ui/settings_tab.dart';

class DrawerWidget extends StatelessWidget {
  Function onClic;
  DrawerWidget({required this.onClic,super.key});
static const int CATEGORY_ID = 1;
static const int SETTINGS_ID = 2;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width *.7,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            color: Colors.green,
            alignment: Alignment.center,
            child: Text(S.of(context).title,style: TextStyle(
              fontSize: 30,color: Colors.white
            ),),
          ),
          GestureDetector(
            onTap: () {
              onClic(CATEGORY_ID);
            },
            child: Text(S.of(context).categories
                ,style: TextStyle(
                fontSize: 30,color: Colors.black
            )),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              onClic(SETTINGS_ID);
            Navigator.pushNamed(context,SettingsTab.routeName );
            },
            child: Text(S.of(context).settings,style: TextStyle(
                fontSize: 30,color: Colors.black
            )),
          ),
        ],
      ),
    );
  }
}
