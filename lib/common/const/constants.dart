
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// token 로컬 저장을 위한 스토리지
final storage = FlutterSecureStorage();

/// token 로컬 저장을 위한 키값
const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

/// auth 관련 상수
const SIGNUP_GUIDE_TITLE = [
  '아래의 회원 종류 중 하나를\n선택해주세요',
  '이메일과 비밀번호를\n입력해주세요',
  '본인인증을 위해 필요한 정보를\n입력해주세요',
  '회원가입이\n완료되었습니다',
  '관심있는 주제를\n선택해주세요',
];

/// 사용 목적 별 카테고리 상수
const CATEGORY_FOR_TAB = [ "관심목록", "강사매칭", "라이브커머스\n교육", "방송가능\n상품소싱", "쇼호스트\n구현", "스마트스토어\n런칭", "퍼스널브랜딩", "SNS 마케팅", "홍보물 디자인" ];
const CATEGORY = [ "관심목록", "강사매칭", "라이브커머스 교육", "방송가능 / 상품소싱", "쇼호스트 구현", "스마트스토어 런칭", "퍼스널브랜딩", "SNS 마케팅", "홍보물 디자인" ];
const CATEGORY_LIST_FOR_SIGNUP = [ "방송가능\n상품소싱", "쇼호스트\n구인", "라이브커머스\n대행", "라이브커머스\n교육", "스마트스토어\n런칭", "영상 편집", "강사 매칭", "SNS\n마케팅", "홍보물\n디자인", ];

/// 평점에 따른 설명 상수
const RATING_DETAIL = {
  1:'별로에요',
  2:'그저 그래요',
  3:'괜찮아요',
  4:'좋아요',
  5:'최고에요',
};

/// 요청 목록 탭 상수
const ORDER_LIST_TAB = [ "요청받은 상품", "요청한 상품"];

/// 내 문의내역 탭 상수
const MY_INQUIRY_LIST_TAB = [ "진행중 문의", "완료된 문의"];