import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/helper/enum.dart';
import 'package:flutter_twitter_clone/ui/page/settings/widgets/settingsRowWidget.dart';
import 'package:flutter_twitter_clone/state/searchState.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/customWidgets.dart';
import 'package:flutter_twitter_clone/widgets/newWidget/title_text.dart';
import 'package:provider/provider.dart';

class TrendsPage extends StatelessWidget {
  const TrendsPage({Key? key}) : super(key: key);

  void openBottomSheet(
      BuildContext context, double height, Widget child) async {
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

  void openUserSortSettings(BuildContext context) {
    openBottomSheet(
      context,
      340,
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
            child: TitleText('Sắp xếp danh sách người dùng'),
          ),
          const Divider(height: 0),
          _row(context, "Người dùng đã được xác minh", SortUser.Verified),
          const Divider(height: 0),
          _row(context, "Theo thứ tự bảng chữ cái", SortUser.Alphabetically),
          const Divider(height: 0),
          _row(context, "Người dùng mới nhất", SortUser.Newest),
          const Divider(height: 0),
          _row(context, "Người dùng lâu nhất", SortUser.Oldest),
          const Divider(height: 0),
          _row(context, "Người dùng phổ biến", SortUser.MaxFollower),
        ],
      ),
    );
  }

  Widget _row(BuildContext context, String text, SortUser sortBy) {
    final state = Provider.of<SearchState>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 5),
      child: RadioListTile<SortUser>(
        value: sortBy,
        activeColor: TwitterColor.dodgeBlue,
        groupValue: state.sortBy,
        onChanged: (val) {
          context.read<SearchState>().updateUserSortPrefrence = val!;
          Navigator.pop(context);
        },
        title: Text(text, style: TextStyles.subtitleStyle),
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
        title: customTitleText('Xu hướng'),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          SettingRowWidget(
            "Bộ lọc tìm kiếm",
            subtitle:
                context.select((SearchState value) => value.selectedFilter),
            onPressed: () {
              openUserSortSettings(context);
            },
            showDivider: false,
          ),
          const SettingRowWidget(
            "Vị trí xu hướng",
            navigateTo: null,
            subtitle: 'New York',
            showDivider: false,
          ),
          const SettingRowWidget(
            null,
            subtitle:
                'Bạn có thể xem nội dung nào đang thịnh hành ở một vị trí cụ thể bằng cách chọn vị trí nào sẽ xuất hiện trong tab Thịnh hành của bạn.',
            navigateTo: null,
            showDivider: false,
            vPadding: 12,
          ),
        ],
      ),
    );
  }
}
