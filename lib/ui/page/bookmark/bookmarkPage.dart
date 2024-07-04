import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/helper/enum.dart';
import 'package:flutter_twitter_clone/model/feedModel.dart';
import 'package:flutter_twitter_clone/state/bookmarkState.dart';
import 'package:flutter_twitter_clone/ui/theme/theme.dart';
import 'package:flutter_twitter_clone/widgets/customAppBar.dart';
import 'package:flutter_twitter_clone/widgets/newWidget/emptyList.dart';
import 'package:flutter_twitter_clone/widgets/tweet/tweet.dart';
import 'package:provider/provider.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  static Route<T> getRoute<T>() {
    return MaterialPageRoute(
      builder: (_) {
        return Provider(
          create: (_) => BookmarkState(),
          child: ChangeNotifierProvider(
            create: (BuildContext context) => BookmarkState(),
            builder: (_, child) => const BookmarkPage(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColor.mystic,
      appBar: CustomAppBar(
        title: Text("Dấu trang", style: TextStyles.titleStyle),
        isBackButton: true,
      ),
      body: const BookmarkPageBody(),
    );
  }
}

class BookmarkPageBody extends StatelessWidget {
  const BookmarkPageBody({Key? key}) : super(key: key);

  Widget _tweet(BuildContext context, FeedModel model) {
    return Container(
      color: Colors.white,
      child: Tweet(
        model: model,
        type: TweetType.Tweet,
        scaffoldKey: GlobalKey<ScaffoldState>(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var state = Provider.of<BookmarkState>(context);
    var list = state.tweetList;
    if (state.isbusy) {
      return const SizedBox(
        height: 3,
        child: LinearProgressIndicator(),
      );
    } else if (list == null || list.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: EmptyList(
          'Chưa có dấu trang nào',
          subTitle: 'Khi tìm thấy dấu trang mới, chúng sẽ hiển thị ở đây.',
        ),
      );
    }
    return ListView.builder(
      addAutomaticKeepAlives: true,
      itemBuilder: (context, index) => _tweet(context, list[index]),
      itemCount: list.length,
    );
  }
}
