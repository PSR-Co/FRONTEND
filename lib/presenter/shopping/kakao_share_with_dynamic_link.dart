import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class KakaoShareWithDynamicLink {
  static final KakaoShareWithDynamicLink _manager = KakaoShareWithDynamicLink._internal();

  factory KakaoShareWithDynamicLink() {
    return _manager;
  }

  KakaoShareWithDynamicLink._internal() {
    // init code
  }

  Future<bool> isKakaotalkInstalled() async {
    bool installed = await isKakaoTalkInstalled();
    return installed;
  }

  void shareMyCode(String link) async {
    try {
      var template = getTemplate(link);
      var uri = await ShareClient.instance.shareDefault(template: template);

      await ShareClient.instance.launchKakaoTalk(uri);

    } catch (error) {
      print(error.toString());
    }
  }

  FeedTemplate getTemplate(String link) {
    Content content = Content(
      title: 'title',
      imageUrl: Uri.parse('https://firebasestorage.googleapis.com/v0/b/psr-dev.appspot.com/o/product%2Fproduct-20230818-0?alt=media&token=f5ec4291-1636-4394-a6e0-bc34f96d829c'),
      link: Link(
        mobileWebUrl: Uri.parse(link),
      ),
    );

    FeedTemplate template = FeedTemplate(
        content: content,
        buttons: [
          Button(title: '앱에서 보기', link: Link(mobileWebUrl: Uri.parse(link))),
        ]
    );
    return template;
  }

  Future<String> buildDynamicLink() async {
    String url = "https://psr.page.link";

    final DynamicLinkParameters parameters = DynamicLinkParameters(
      link: Uri.parse('$url'),
      uriPrefix: url,
      androidParameters: AndroidParameters(
        packageName: "com.psr.front.psr"
      ) ,
      iosParameters: IOSParameters(
        bundleId: "com.psr.front.psr",
      )
    );
    // final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
    final ShortDynamicLink dynamicUrl = await FirebaseDynamicLinks.instance.buildShortLink(parameters);
    return dynamicUrl.shortUrl.toString();
  }
}