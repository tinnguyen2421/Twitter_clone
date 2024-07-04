import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/model/user.dart';
import 'package:flutter_twitter_clone/state/authState.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsAppbar.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? UserModel();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: SettingsAppBar(
        title: 'Tài Khoản ',
        subtitle: user.userName,
      ),
      body: ListView(
        children: <Widget>[
          const HeaderWidget('Đăng nhập và bảo mật'),
          SettingRowWidget(
            "Tên người dùng",
            subtitle: user.userName,
          ),
          const Divider(height: 0),
          SettingRowWidget(
            "Số điện thoại",
            subtitle: user.contact,
          ),
          SettingRowWidget(
            "Địa chỉ email",
            subtitle: user.email,
            navigateTo: 'VerifyEmailPage',
          ),
          const SettingRowWidget("Mật khẩu"),
          const SettingRowWidget("Bảo mật"),
          const HeaderWidget(
            'Dữ liệu và Quyền',
            secondHeader: true,
          ),
          const SettingRowWidget("Quốc gia"),
          const SettingRowWidget("Dữ liệu Twitter của bạn"),
          const SettingRowWidget("Ứng dụng và phiên"),
          SettingRowWidget(
            "Đăng xuất",
            textColor: TwitterColor.ceriseRed,
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
              final state = Provider.of<AuthState>(context);
              state.logoutCallback();
            },
          ),
        ],
      ),
    );
  }
}
