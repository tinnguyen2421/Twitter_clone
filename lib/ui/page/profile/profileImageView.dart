import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/helper/customRoute.dart';
import 'package:flutter_twitter_clone/helper/utility.dart';
import 'package:flutter_twitter_clone/ui/page/profile/profilePage.dart';
import 'package:flutter_twitter_clone/ui/page/profile/widgets/circular_image.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';

class ProfileImageView extends StatelessWidget {
  const ProfileImageView({Key? key, required this.avatar}) : super(key: key);
  final String avatar;
  static Route<T> getRoute<T>(String avatar) {
    return SlideLeftRoute<T>(
        builder: (BuildContext context) => ProfileImageView(avatar: avatar));
  }

  @override
  Widget build(BuildContext context) {
    const List<Choice> choices = <Choice>[
      Choice(title: 'Chia sẻ liên kết hình ảnh', icon: Icons.share, isEnable: true),
      Choice(
          title: 'Mở trong trình duyệt',
          icon: Icons.open_in_browser,
          isEnable: true),
      Choice(title: 'Lưu', icon: Icons.save),
    ];
    return Scaffold(
      backgroundColor: TwitterColor.white,
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton<Choice>(
            onSelected: (d) {
              switch (d.title) {
                case "Chia sẻ liên kết hình ảnh":
                  Utility.share(avatar);
                  break;
                case "Mở trong trình duyệt":
                  Utility.launchURL(avatar);
                  break;
                case "Lưu":
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title,
                        style: TextStyles.textStyle14.copyWith(
                          color: choice.isEnable
                              ? AppColor.secondary.withOpacity(.9)
                              : AppColor.lightGrey,
                        )));
              }).toList();
            },
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: customAdvanceNetworkImage(avatar),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
