import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/model/user.dart';
import 'package:flutter_twitter_clone/state/authState.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsAppbar.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class DirectMessagesPage extends StatelessWidget {
  const DirectMessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? UserModel();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: SettingsAppBar(
        title: 'Tin nhắn trực tiếp',
        subtitle: user.userName,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const <Widget>[
          HeaderWidget(
            'Tin nhắn trực tiếp',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Nhận yêu cầu tin nhắn",
            navigateTo: null,
            showDivider: false,
            visibleSwitch: true,
            vPadding: 20,
            subtitle:
                'Bạn sẽ có thể nhận được yêu cầu Tin nhắn Trực tiếp từ bất kỳ ai trên Fwitter, ngay cả khi bạn không theo dõi họ.',
          ),
          SettingRowWidget(
            "Hiển thị đã đọc",
            navigateTo: null,
            showDivider: false,
            visibleSwitch: true,
            subtitle:
                'Khi ai đó gửi tin nhắn cho bạn, mọi người trong cuộc trò chuyện sẽ biết bạn đã xem tin nhắn đó. Nếu tắt cài đặt này, bạn sẽ không thể xem biên nhận đã đọc từ người khác.',
          ),
        ],
      ),
    );
  }
}
