
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// token 로컬 저장을 위한 스토리지
final storage = FlutterSecureStorage();

/// token 로컬 저장을 위한 키값
const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';



/// 사용 목적 별 카테고리 상수
const CATEGORY_FOR_TAB = [ "관심목록", "강사매칭", "라이브커머스\n교육", "방송가능\n상품소싱", "쇼호스트\n구현", "스마트스토어\n런칭", "퍼스널브랜딩", "SNS 마케팅", "홍보물 디자인" ];
const CATEGORY = [ "관심목록", "강사매칭", "라이브커머스 교육", "방송가능 / 상품소싱", "쇼호스트 구현", "스마트스토어 런칭", "퍼스널브랜딩", "SNS 마케팅", "홍보물 디자인" ];

/// 평점에 따른 설명 상수
const RATING_DETAIL = {
  1:'별로에요',
  2:'그저 그래요',
  3:'괜찮아요',
  4:'좋아요',
  5:'최고에요',
};