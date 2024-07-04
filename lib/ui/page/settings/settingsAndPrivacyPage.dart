import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/model/user.dart';
import 'package:flutter_twitter_clone/state/authState.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/customWidgets.dart';
import 'package:provider/provider.dart';

import 'widgets/settingsRowWidget.dart';

class SettingsAndPrivacyPage extends StatelessWidget {
  const SettingsAndPrivacyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? UserModel();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
          'Cài đặt và quyền riêng tư',
        ),
      ),
      body: ListView(
        children: <Widget>[
          HeaderWidget(user.userName),
          const SettingRowWidget(
            "Tài khoản",
            navigateTo: 'AccountSettingsPage',
          ),
          const Divider(height: 0),
          const SettingRowWidget("Quyền riêng tư và chính sách",
              navigateTo: 'PrivacyAndSaftyPage'),
          const SettingRowWidget("Thông báo",
              navigateTo: 'NotificationPage'),
          const SettingRowWidget("Tùy chọn nội dung",
              navigateTo: 'ContentPrefrencePage'),
          const HeaderWidget(
            'Tổng quan',
            secondHeader: true,
          ),
          const SettingRowWidget("Màn hình và âm thanh",
              navigateTo: 'DisplayAndSoundPage'),
          const SettingRowWidget("Sử dụng dữ liệu", navigateTo: 'DataUsagePage'),
          const SettingRowWidget("Khả năng tiếp cận",
              navigateTo: 'AccessibilityPage'),
          const SettingRowWidget("Ủy quyền", navigateTo: "ProxyPage"),
          const SettingRowWidget(
            "Giới thiệu về Twitter",
            navigateTo: "AboutPage",
          ),
          const SettingRowWidget(
            null,
            showDivider: false,
            vPadding: 10,
            subtitle:
                'Những cài đặt này ảnh hưởng đến tất cả tài khoản Twitter của bạn trên thiết bị này.',
          )
        ],
      ),
    );
  }
}
