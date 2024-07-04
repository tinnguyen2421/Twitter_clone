import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/headerWidget.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/customWidgets.dart';
import 'package:flutter_twitter_clone/widgets/newWidget/title_text.dart';

class AccessibilityPage extends StatelessWidget {
  const AccessibilityPage({Key? key}) : super(key: key);

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
          _row("Dữ liệu di động & Wi-Fi"),
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
            child: TitleText('Chế dộ ban đêm'),
          ),
          const Divider(height: 0),
          _row("Mờ"),
          const Divider(height: 0),
          _row("Tắt đèn"),
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
          'Khả năng tiếp cận',
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
            const HeaderWidget('Đọc màn hình'),
          const SettingRowWidget(
            "Phát âm # là \"hashtag\"",
            showCheckBox: true,
          ),
          const Divider(height: 0),
          const HeaderWidget('Tầm nhìn'),
          SettingRowWidget(
            "Thêm mô tả hình ảnh",
            subtitle:
                'Thêm khả năng mô tả hình ảnh cho người khiếm thị.',
            vPadding: 15,
            showCheckBox: false,
            onPressed: () {
              openDarkModeSettings(context);
            },
            showDivider: false,
          ),
          const HeaderWidget(
            'Chuyển động',
            secondHeader: true,
          ),
          SettingRowWidget(
            "Giảm chuyển động",
            subtitle:
                'Giới hạn số lượng hoạt ảnh trong ứng dụng, bao gồm cả số lượt tương tác trực tiếp.',
            vPadding: 15,
            showCheckBox: false,
            onPressed: () {
              openDarkModeSettings(context);
            },
          ),
          SettingRowWidget(
            "Tự động phát video",
            subtitle: 'Chỉ wifi ',
            onPressed: () {
              openDarkModeSettings(context);
            },
          ),
        ],
      ),
    );
  }
}
