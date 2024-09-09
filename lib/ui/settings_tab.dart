import 'package:flutter/material.dart';
import 'package:news/bottom_sheet/language_bottom_sheet.dart';
import 'package:news/generated/l10n.dart';

class SettingsTab extends StatelessWidget {
  static const String routeName = 'SettingTab';
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage('assets/images/pattern.png'),
          )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          // actions: [IconButton(onPressed: () {
          //   showSearch(context: context, delegate:SearchTab());
          // },
          //     icon: Icon(Icons.search))],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
          iconTheme: IconThemeData(color: Colors.white, size: 30),
          backgroundColor: Colors.green,
          title: Text(
            S.of(context).settings,
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w400, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                S.of(context).language,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    isDismissible: false,
                    context: context,
                    builder: (context) => LanguageBottomSheet(),
                  );
                },
                child: Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(5),
                          right: Radius.circular(20),
                        ),
                        border: Border.all(
                          color: Colors.green,
                        )),
                    child: InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context)=> LanguageBottomSheet(),
                      );
                    },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Text(
                            S.of(context).arabic,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: Colors.green),

                          ),
                          Image.asset('assets/images/Symbol 156 – 58.png'),
                        ],
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
