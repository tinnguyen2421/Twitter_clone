import 'package:flutter/material.dart';
import 'package:flutter_twitter_clone/helper/enum.dart';
import 'package:flutter_twitter_clone/model/feedModel.dart';
import 'package:flutter_twitter_clone/state/feedState.dart';
import 'package:flutter_twitter_clone/widgets/cache_video.dart';
import 'package:flutter_twitter_clone/widgets/cache_image.dart'; // Đảm bảo CacheImage được import đúng
import 'package:provider/provider.dart';

class TweetImage extends StatelessWidget {
  const TweetImage({
    Key? key,
    required this.model,
    this.type,
    this.isRetweetImage = false,
  }) : super(key: key);

  final FeedModel model;
  final TweetType? type;
  final bool isRetweetImage;

  @override
  Widget build(BuildContext context) {
    if (model.imagePath != null && model.videoPath == null) {
      // Hiển thị hình ảnh
      return _buildImageWidget(context);
    } else if (model.imagePath != null) {
      // Kiểm tra phần mở rộng của đường dẫn để phân biệt video và hình ảnh
      if (_isImagePath(model.imagePath!)) {
        return _buildImageWidget(context);
      } else if (_isVideoPath(model.videoPath!)) {
        return _buildVideoWidget(context);
      } else {
        // Trường hợp không rõ ràng
        print('Loại tệp không xác định: ${model.videoPath}');
        return const SizedBox.shrink();
      }
    } else if (model.videoPath != null) {
      // Hiển thị video
      return _buildVideoWidget(context);
    } else {
      // Trường hợp không có nội dung hình ảnh hoặc video
      return const SizedBox.shrink();
    }
  }

  Widget _buildImageWidget(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(isRetweetImage ? 0 : 20),
          ),
          onTap: () {
            if (type == TweetType.ParentTweet) {
              return;
            }
            var state = Provider.of<FeedState>(context, listen: false);
            state.getPostDetailFromDatabase(model.key);
            state.setTweetToReply = model;
            Navigator.pushNamed(context, '/ImageViewPge');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(isRetweetImage ? 0 : 20),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  (type == TweetType.Detail ? 1 : 0.8) -
                  8,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: CacheImage(
                  path: model.imagePath!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVideoWidget(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: InkWell(
          borderRadius: BorderRadius.all(
            Radius.circular(isRetweetImage ? 0 : 20),
          ),
          onTap: () {
            if (type == TweetType.ParentTweet) {
              return;
            }
            var state = Provider.of<FeedState>(context, listen: false);
            state.getPostDetailFromDatabase(model.key);
            state.setTweetToReply = model;
            Navigator.pushNamed(context, '/ImageViewPge');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.all(
              Radius.circular(isRetweetImage ? 0 : 20),
            ),
            child: Container(
              width: MediaQuery.of(context).size.width *
                  (type == TweetType.Detail ? 0.95 : 0.8) -
                  8,
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: CacheVideo(
                  fit: BoxFit.cover,
                  videoPath:
                  'https://firebasestorage.googleapis.com/v0/b/instagram-clone-ddd46.appspot.com/o/tweetImage%2Fv10044g50000cpjtv6vog65vpflplcrg.mp4?alt=media&token=5d9cefb1-080a-481c-95c2-ccb99fca8b9b',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool _isImagePath(String path) {
    // Kiểm tra phần mở rộng của đường dẫn để nhận diện hình ảnh
    return ['.jpg', '.jpeg', '.png', '.gif', '.bmp']
        .any((extension) => path.toLowerCase().endsWith(extension));
  }

  bool _isVideoPath(String path) {
    // Kiểm tra phần mở rộng của đường dẫn để nhận diện video
    return ['.mp4', '.avi', '.mov', '.mkv', '.wmv']
        .any((extension) => path.toLowerCase().endsWith(extension));
  }
}
