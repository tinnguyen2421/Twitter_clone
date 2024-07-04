import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/model/user.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsAppbar.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/state/authState.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class PrivacyAndSaftyPage extends StatelessWidget {
  const PrivacyAndSaftyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<AuthState>(context).userModel ?? UserModel();
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: SettingsAppBar(
        title: 'Quyền riêng tư và an toàn',
        subtitle: user.userName,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: const <Widget>[
          HeaderWidget('Tweets'),
          SettingRowWidget(
            "Bảo vệ bài đăng của bạn của bạn",
            subtitle:
                'Chỉ những người theo dõi hiện tại và những người bạn chấp thuận trong tương lai mới có thể xem các tweet của bạn.',
            vPadding: 15,
            showDivider: false,
            visibleSwitch: true,
          ),
          SettingRowWidget(
            "Gắn thẻ ",
            subtitle: 'Bất cứ ai cũng có thể gắn thẻ bạn',
          ),
          HeaderWidget(
            'Tin nhắn trực tiếp',
            secondHeader: true,
          ),
          SettingRowWidget(
            'Tin nhắn trực tiếp',
            navigateTo: 'DirectMessagesPage',
          ),
          HeaderWidget(
            'Video trực tiếp',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Kết nối với kính tiềm vọng",
            subtitle:
                'Nếu được chọn, bạn có thể phát trực tiếp và nhận xét về các chương trình phát sóng của Periscope và mọi người sẽ có thể biết khi nào bạn đang xem. nếu cài đặt này tắt, mọi người sẽ không thể bình luận hoặc phát sóng trực tiếp.',
            vPadding: 15,
            showDivider: false,
            visibleSwitch: true,
          ),
          HeaderWidget(
            'Khả năng khám phá và liên hệ',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Khả năng khám phá và liên hệ",
            vPadding: 15,
            showDivider: false,
          ),
          SettingRowWidget(
            null,
            subtitle:
                'Tìm hiểu thêm về cách dữ liệu này được sử dụng để kết nối bạn với mọi người',
            vPadding: 15,
            showDivider: false,
          ),
          HeaderWidget(
            'An toàn',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Chương trình có thể chứa nội dung nhạy cảm",
            vPadding: 15,
            showDivider: false,
            visibleSwitch: true,
          ),
          SettingRowWidget(
            "Đánh dấu phương tiện bạn tweet là chứa tài liệu có thể nhạy cảm",
            vPadding: 15,
            showDivider: false,
            visibleSwitch: true,
          ),
          SettingRowWidget(
            "Tài khoản bị chặn",
            showDivider: false,
          ),
          SettingRowWidget(
            "Tài khoản bị tắt tiếng",
            showDivider: false,
          ),
          SettingRowWidget(
            "Từ bị cấm",
            showDivider: false,
          ),
          HeaderWidget(
            'Vị trí',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Vị trí chính xác",
            subtitle:
                'Đã tắt \n\n\nNếu được bật, Fwitter sẽ thu thập, lưu trữ và sử dụng vị trí chính xác của thiết bị, chẳng hạn như thông tin GPS của bạn. Điều này cho phép Fwitter cải thiện trải nghiệm của bạn - ví dụ: hiển thị cho bạn nội dung, quảng cáo và đề xuất địa phương mpre.',
          ),
          HeaderWidget(
            'Cá nhân hóa và dữ liệu',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Cá nhân hóa và dữ liệu",
            subtitle: "Allow all",
          ),
          SettingRowWidget(
            "Xem dữ liệu Fwitter của bạn",
            subtitle:
                "Xem lại và chỉnh sửa thông tin hồ sơ và dữ liệu được liên kết với tài khoản của bạn.",
          ),
        ],
      ),
    );
  }
}
