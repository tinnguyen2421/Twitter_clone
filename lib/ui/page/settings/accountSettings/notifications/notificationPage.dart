import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/model/user.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsAppbar.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/state/authState.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? UserModel();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: SettingsAppBar(
        title: 'Thông báo',
        subtitle: user.userName,
      ),
      body: ListView(
        children: const <Widget>[
          HeaderWidget('Bộ lọc'),
          SettingRowWidget(
            "Chât lượng bộ lọc",
            showCheckBox: true,
            subtitle:
                'Lọc chất lượng thấp hơn khỏi thông báo của bạn. Thao tác này sẽ không lọc ra thông báo từ những người bạn theo dõi hoặc tài khoản mà bạn đã tương tác gần đây.',
          ),
          Divider(height: 0),
          SettingRowWidget("Bộ lọc nâng cao"),
          SettingRowWidget("Từ bị cấm"),
          HeaderWidget(
            'Sở thích',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Biểu tượng đếm thông báo chưa đọc",
            showCheckBox: false,
            subtitle:
                'Hiển thị biểu tượng với số lượng thông báo đang chờ bạn bên trong ứng dụng Fwitter.',
          ),
          SettingRowWidget("Thông báo đẩy"),
          SettingRowWidget("Thông báo qua SMS"),
          SettingRowWidget(
            "Thông báo thư điện tử",
            subtitle: 'Kiểm soát tần suất Fwitter gửi email cho bạn.',
          ),
        ],
      ),
    );
  }
}
