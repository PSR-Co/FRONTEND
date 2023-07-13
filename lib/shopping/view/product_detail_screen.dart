import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:psr/common/const/colors.dart';

class ProductDetailScreen extends StatefulWidget {
  final String category;

  const ProductDetailScreen({required this.category, Key? key}) : super(key: key);

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {

  final String sellerName = "루시 앤플 셀러";
  final String name = "폴로랄프로렌 목도리";
  final double avgOfRating = 5.0;
  final int reviewCnt = 12;
  final int price = 79000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: renderBody(),
      bottomNavigationBar: renderBottomButtons(),
    );
  }

  AppBar renderAppBar() {
    final titleStyle = TextStyle(
        color: Colors.black,
        fontSize: 17
    );
    return AppBar(
      backgroundColor: Colors.white,
      title: Text(getTrimmedCategory(), style: titleStyle,),
      centerTitle: true,
      leading: renderleftItem(),
      actions: renderRightItems(),
      elevation: 0,
    );
  }

  String getTrimmedCategory() {
    String category = widget.category;
    if (category.contains('\n')) {
      category = category.replaceAll('\n', ' ');
    }
    return category;
  }

  Widget renderleftItem() {
    return Container(
      child: IconButton(
        icon: SvgPicture.asset("asset/icons/common/chevron.backward.svg"),
        onPressed: didTapBackItem,
      ),
    );
  }

  List<Widget> renderRightItems() {
    List<Widget> rightItems = [];
    rightItems.add(
        IconButton(
          icon: SvgPicture.asset("asset/icons/shopping/declaration.svg"),
          onPressed: didTapDeclarationButton,
        ));
    rightItems.add(
        IconButton(
          icon: SvgPicture.asset("asset/icons/shopping/share.svg"),
          onPressed: didTapShareButton,
        ));
    return rightItems;
  }

  Widget renderBody() {
    final sellerNameStyle = TextStyle(
      fontSize: 14,
      color: GRAY_2_COLOR,
      fontWeight: FontWeight.w500
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // 상품 이미지 리스트
        Image.asset(
          "asset/images/product_sample.png",
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width,
          fit: BoxFit.contain,
        ),
        
        // 팔매자 이름 버튼
        Container(
          padding: EdgeInsets.symmetric(horizontal: 11),
          child: Row(
            children: [
              Container(
                // color: Colors.red,
                child: TextButton(
                    onPressed: (){},
                    child: Text(sellerName, style: sellerNameStyle,)
                ),
              ),
              Container(
                // color: Colors.green,
                child: IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.chevron_right,color: GRAY_2_COLOR)
                ),
              ),
            ],
          ),
        ),
        // 상품 제목
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text(name, style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),),
        ),

        // 별점 이미지 + 리뷰 개수


        // 가격
        Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Text('${price.toString()}원', style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 24,
          ),),
        ),

        // 상세 뷰
        // 더보기 버튼
        // 리뷰 목록 프리뷰
        
      ],
    );
  }

  Widget renderBottomButtons() {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      height: 90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          renderLikeButton(),
          renderOrderButton(),
        ],
      ),
    );
  }

  Widget renderLikeButton() {
    final likeCntStyle = TextStyle(
        fontSize: 12,
        color: PINK_COLOR,
        fontWeight: FontWeight.w500
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 35,
          width: 40,
          child: IconButton(
              onPressed: didTapLikeButton,
              icon: SvgPicture.asset("asset/icons/common/favorite_border.fill.svg")
          ),
        ),
        Text('23', style: likeCntStyle,),
      ],
    );
  }

  Widget renderOrderButton() {
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      width: MediaQuery.of(context).size.width-90,
      child: ElevatedButton(
        onPressed: didTapOrderButton,
        child: Text("1:1 요청하기", style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14
        ),),
        style: ElevatedButton.styleFrom(
            backgroundColor: PURPLE_COLOR,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            elevation: 0
        ),
      ),
    );
  }

  /// 이벤트 메소드 정의
  void didTapBackItem() {
    Navigator.of(context).pop();
  }

  void didTapDeclarationButton() {
    // TODO: 신고하기 팝업 띄우기
    print("didTapDeclarationButton");
  }

  void didTapShareButton() {
    print("didTapShareButton");
  }

  void didTapLikeButton() {
    print("didTapLikeButton");
  }

  void didTapOrderButton() {
    print("didTapOrderButton");
  }
}