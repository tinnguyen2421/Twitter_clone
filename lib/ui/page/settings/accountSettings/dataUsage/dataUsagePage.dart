import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/customWidgets.dart';
import 'package:flutter_twitter_clone/widgets/newWidget/title_text.dart';

class DataUsagePage extends StatelessWidget {
  const DataUsagePage({Key? key}) : super(key: key);

  void openBottomSheet(
    BuildContext context,
    double height,
    Widget child,
  ) async {
    await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (context) {
        return Container(
          height: height,
          decoration: BoxDecoration(
            color: TwitterColor.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: child,
        );
      },
    );
  }

  void openDarkModeSettings(BuildContext context) {
    openBottomSheet(
      context,
      250,
      Column(
        children: <Widget>[
          const SizedBox(height: 5),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: TwitterColor.paleSky50,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: TitleText('Tùy chọn dữ liệu'),
          ),
          const Divider(height: 0),
          _row("Dữ liệu di động và Wi-Fi"),
          const Divider(height: 0),
          _row("Chỉ wifi"),
          const Divider(height: 0),
          _row("Không bao giờ"),
        ],
      ),
    );
  }

  void openDarkModeAppearanceSettings(BuildContext context) {
    openBottomSheet(
      context,
      190,
      Column(
        children: <Widget>[
          const SizedBox(height: 5),
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: TwitterColor.paleSky50,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: TitleText('Xuất hiện chế độ tối'),
          ),
          const Divider(height: 0),
          _row("Mờ"),
          const Divider(height: 0),
          _row("Tắt"),
        ],
      ),
    );
  }

  Widget _row(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: RadioListTile(
        value: false,
        groupValue: true,
        onChanged: (val) {},
        title: Text(text),
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: CustomAppBar(
        isBackButton: true,
        title: customTitleText(
          'Sử dụng dữ liệu',
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const HeaderWidget('Trình tiết kiệm dữ liệu'),
          const SettingRowWidget(
            "Tiết kiệm dữ liệu",
            showCheckBox: true,
            vPadding: 15,
            showDivider: false,
            subtitle:
                'Khi được bật, video sẽ không tự động phát và tải hình ảnh có chất lượng thấp hơn. Điều này sẽ tự động giảm mức sử dụng dữ liệu của bạn cho tất cả tài khoản Fwitter trên thiết bị này.',
            visibleSwitch: null,
          ),
          const Divider(height: 0),
          const HeaderWidget('Hình ảnh'),
          SettingRowWidget(
            "Hình ảnh chất lượng cao",
            subtitle:
                'Dữ liệu di động và Wi-Fi \n\nChọn thời điểm tải hình ảnh chất lượng cao.',
            vPadding: 15,
            onPressed: () {
              openDarkModeSettings(context);
            },
            showDivider: false,
            visibleSwitch: null,
            showCheckBox: null,
          ),
          const HeaderWidget(
            'Video',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Video chất lượng cao",
            subtitle:
                'Chỉ Wi-Fi \n\nChọn thời điểm phát chất lượng cao nhất hiện có.',
            vPadding: 15,
            onPressed: () {
              openDarkModeSettings(context);
            },
            visibleSwitch: null,
            showCheckBox: null,
          ),
          SettingRowWidget(
            "Tự động phát video",
            subtitle:
                'Chỉ Wi-Fi \n\nChọn thời điểm video sẽ tự động phát.',
            vPadding: 15,
            onPressed: () {
              openDarkModeSettings(context);
            },
            showCheckBox: null,
            visibleSwitch: null,
          ),
          const HeaderWidget(
            'Đồng bộ hóa dữ liệu',
            secondHeader: true,
          ),
          const SettingRowWidget(
            "Đồng bộ dữ liệu",
            showCheckBox: true,
            visibleSwitch: null,
          ),
          const SettingRowWidget(
            "Khoảng thời gian đồng bộ hóa",
            subtitle: 'Hằng ngày',
            showCheckBox: null,
            visibleSwitch: null,
          ),
          const SettingRowWidget(
            null,
            subtitle:
                'Cho phép Fwitter đồng bộ hóa dữ liệu ở chế độ nền để nâng cao trải nghiệm của bạn.',
            vPadding: 10,
            showCheckBox: null,
            visibleSwitch: null,
          ),
        ],
      ),
    );
  }
}
