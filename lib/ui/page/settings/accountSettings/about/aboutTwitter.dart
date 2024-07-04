import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/helper/utility.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/customWidgets.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
          'About Fwitter',
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const HeaderWidget(
            'Nhận trợ giúp',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Trung tâm trợ giúp",
            vPadding: 0,
            showDivider: false,
            onPressed: () {
              Utility.launchURL(
                  "https://github.com/tinnguyen2421/Twitter_clone");
            },
          ),
          const HeaderWidget('Pháp lý'),
          const SettingRowWidget(
            "Điều khoản dịch dụ",
            showDivider: true,
          ),
          const SettingRowWidget(
            "Chính sách riêng tư",
            showDivider: true,
          ),
          const SettingRowWidget(
            "Sử dụng Cookie",
            showDivider: true,
          ),
          SettingRowWidget(
            "Thông báo pháp lý",
            showDivider: true,
            onPressed: () async {
              showLicensePage(
                context: context,
                applicationName: 'Fwitter',
                applicationVersion: '1.0.0',
                useRootNavigator: true,
              );
            },
          ),
          const HeaderWidget('Developer'),
          SettingRowWidget("Github", showDivider: true, onPressed: () {
            Utility.launchURL("https://github.com/tinnguyen2421/Twitter_clone");
          }),
          SettingRowWidget("LinkidIn", showDivider: true, onPressed: () {
            Utility.launchURL("https://github.com/tinnguyen2421/Twitter_clone");
          }),
          SettingRowWidget("Twitter", showDivider: true, onPressed: () {
            Utility.launchURL("https://github.com/tinnguyen2421/Twitter_clone");
          }),
          SettingRowWidget("Blog", showDivider: true, onPressed: () {
            Utility.launchURL("https://github.com/tinnguyen2421/Twitter_clone");
          }),
        ],
      ),
    );
  }
}
