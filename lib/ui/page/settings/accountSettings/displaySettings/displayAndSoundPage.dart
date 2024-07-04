import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/customWidgets.dart';
import 'package:flutter_twitter_clone/widgets/newWidget/title_text.dart';

class DisplayAndSoundPage extends StatelessWidget {
  const DisplayAndSoundPage({Key? key}) : super(key: key);

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
            padding: EdgeInsets.symmetric(vertical: 10),
            child: TitleText('Chế độ tối'),
          ),
          const Divider(height: 0),
          _row("Bật"),
          const Divider(height: 0),
          _row("Tắt"),
          const Divider(height: 0),
          _row("Tự động vào lúc hoàng hôn"),
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
          'Màn hình và âm thanh',
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          const HeaderWidget('Phương tiện truyền thông'),
          const SettingRowWidget(
            "Xem trước phương tiện",
            showCheckBox: false,
          ),
          const Divider(height: 0),
          const HeaderWidget('Trình chiếu'),
          SettingRowWidget(
            "Chế độ tối",
            subtitle: 'Tắt',
            onPressed: () {
              openDarkModeSettings(context);
            },
            showDivider: false,
          ),
          SettingRowWidget(
            "Xuất hiện Chế độ tối",
            subtitle: 'Mờ',
            onPressed: () {
              openDarkModeAppearanceSettings(context);
            },
            showDivider: false,
          ),
          const SettingRowWidget(
            "Cảm xúc",
            subtitle:
                  'Sử dụng bộ Fwitter thay vì bộ mặc định của thiết bị của bạn',
            showDivider: false,
            showCheckBox: false,
          ),
          const HeaderWidget(
            'Âm thanh',
            secondHeader: true,
          ),
          const SettingRowWidget(
            "Hiệu ứng âm thanh",
            // vPadding: 15,
            showCheckBox: false,
          ),
          const HeaderWidget(
            'Trình duyệt web',
            secondHeader: false,
          ),
          const SettingRowWidget(
            "Sử dụng trình duyệt trong ứng dụng",
            subtitle: 'Mở link ngoài bằng trình duyệt Fwitter',
            showCheckBox: false,
          ),
        ],
      ),
    );
  }
}
