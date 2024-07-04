import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/customWidgets.dart';

class ProxyPage extends StatelessWidget {
  const ProxyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
            'Ủy quyền',
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const <Widget>[
          SettingRowWidget(
            "Kích hoạt proxy HTTP",
            showCheckBox: false,
            vPadding: 15,
            showDivider: true,
            subtitle:
                'Định cấu hình proxy HTTP cho yêu cầu mạng (lưu ý: điều này không áp dụng cho trình duyệt).',
          ),
          SettingRowWidget(
            "Máy chủ proxy",
            subtitle: 'Định cấu hình tên máy chủ proxy của bạn.',
            showDivider: true,
          ),
          SettingRowWidget(
            "Cổng giao thức",
            subtitle: 'Định cấu hình số cổng proxy của bạn.',
          ),
        ],
      ),
    );
  }
}
