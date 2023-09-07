import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:psr/model/data/shopping/product_model.dart';

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

  void shareMyCode(Product? product, String link) async {
    try {
      var template = getTemplate(product, link);
      var uri = await ShareClient.instance.shareDefault(template: template);

      await ShareClient.instance.launchKakaoTalk(uri);

    } catch (error) {
      print(error.toString());
    }
  }

  String getTemplateTitle(Product? product) {
    if (product == null) { return '공유된 상품을 확인해보세요!'; }
    else { return '\'${product.name}\'을 공유했어요!'; }
  }

  String getTemplateImgUrl(Product? product) {
    if (product != null && product!.imgList.isNotEmpty) {
      return product!.imgList[0];
    } else {
      return 'https://firebasestorage.googleapis.com/v0/b/psr-dev.appspot.com/o/dev-content%2FtempImage.png?alt=media&token=86255155-cf03-4b9a-8603-3d02230b2811';
    }
  }

  FeedTemplate getTemplate(Product? product, String link) {
    Content content = Content(
      title: getTemplateTitle(product),
      imageUrl: Uri.parse(getTemplateImgUrl(product)),
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