import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/model/user.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsAppbar.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/state/authState.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class ContentPrefrencePage extends StatelessWidget {
  const ContentPrefrencePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? UserModel();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: SettingsAppBar(
        title: 'Tùy chọn nội dung',
        subtitle: user.userName,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const <Widget>[
          HeaderWidget('Khám phá'),
          SettingRowWidget(
            "Xu hướng",
            navigateTo: 'TrendsPage',
          ),
          Divider(height: 0),
          SettingRowWidget(
            "Thiết lập tìm kiếm",
            navigateTo: null,
          ),
          HeaderWidget(
            'Ngôn ngữ',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Khuyến nghị",
            vPadding: 15,
            subtitle:
                "Chọn ngôn ngữ bạn muốn đề xuất đưa vào Tweet, con người và xu hướng",
          ),
          HeaderWidget(
            'An toàn',
            secondHeader: true,
          ),
          SettingRowWidget("Tài khoản bị chặn"),
          SettingRowWidget("Tài khoản bị tắt tiếng"),
        ],
      ),
    );
  }
}
