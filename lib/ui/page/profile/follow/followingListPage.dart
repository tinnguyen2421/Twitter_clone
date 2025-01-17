import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/model/user.dart';
import 'package:flutter_twitter_clone/ui/page/common/usersListPage.dart';
import 'package:flutter_twitter_clone/ui/page/profile/follow/followListState.dart';
import 'package:flutter_twitter_clone/widgets/newWidget/customLoader.dart';
import 'package:provider/provider.dart';

class FollowingListPage extends StatelessWidget {
  const FollowingListPage(
      {Key? key, required this.profile, required this.userList})
      : super(key: key);
  final List<String> userList;
  final UserModel profile;

  static MaterialPageRoute getRoute(
      {required List<String> userList, required UserModel profile}) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return ChangeNotifierProvider(
          create: (_) => FollowListState(StateType.following),
          child: FollowingListPage(profile: profile, userList: userList),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (context.watch<FollowListState>().isbusy) {
      return SizedBox(
        height: context.height,
        child: const CustomScreenLoader(
          height: double.infinity,
          width: double.infinity,
          backgroundColor: Colors.white,
        ),
      );
    }
    return UsersListPage(
      pageTitle: 'Đang theo dõi',
      userIdsList: userList,
      emptyScreenText:
            '${profile.userName ?? profile.userName} không theo dõi ai cả',
      emptyScreenSubTileText: ' Khi họ theo dõi, họ sẽ được liệt kê ở đây.',
      onFollowPressed: (user) {
        context.read<FollowListState>().followUser(user);
      },
      isFollowing: (user) {
        return context.watch<FollowListState>().isFollowing(user);
      },
    );
  }
}
