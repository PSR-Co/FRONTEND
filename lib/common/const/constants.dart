
/// auth 관련 상수
const SIGNUP_GUIDE_TITLE = [
  '개인정보 수집에\n동의해주세요',
  '아래의 회원 종류 중 하나를\n선택해주세요',
  '사업자 정보를\n입력해주세요',
  '이메일과 비밀번호를\n입력해주세요',
  '본인인증을 위해 필요한 정보를\n입력해주세요',
  '회원가입이\n완료되었습니다',
  '관심있는 주제를\n선택해주세요',
];

/// 사용 목적 별 카테고리 상수
const CATEGORY_FOR_TAB = [ "관심목록", "강사매칭", "라이브커머스\n교육", "라이브커머스\n대행", "방송가능\n상품소싱", "쇼호스트\n구인", "스마트스토어\n런칭", "영상 편집", "SNS 마케팅", "홍보물 디자인" ];
const CATEGORY = [ "관심목록", "강사매칭", "라이브커머스 교육", "라이브커머스 대행", "방송가능 상품소싱", "쇼호스트 구인", "스마트스토어 런칭", "영상편집", "SNS 마케팅", "홍보물 디자인" ];
const CATEGORY_LIST_FOR_ADD = [ "강사매칭", "라이브커머스 교육", "라이브커머스 대행", "방송가능 상품소싱", "쇼호스트 구인", "스마트스토어 런칭", "영상편집", "SNS 마케팅", "홍보물 디자인" ];
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

/// 자주 묻는 질문 탭 상수
const FAQ_LIST_TAP = ['전체', '계정관리', '컨설팅', '상품'];

/// 회원 종류 상수
// const USER_TYPE = ['사업자', '관리자'];

///질문 & 문의 & 공지사항 임시데이터
const CONTENT = '잘못 송금한 경우 아래 내용을 확인해주세요.\n\n1. 돈을 송금받은 수취인에게 당근마켓 채팅방을 통해 직접 연락을 부탁드려요.\n\n■ 수취인이 당근페이에 가입하지 않은 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 송금 받은 메시지의 ${'되돌려 주기'} 버튼 선택 > 한 번 더 확인되는 ${'되돌려 주기'} 선택\n■ 수취인이 당근페이에 가입한 경우 아래의 방법으로 반환을 요청해 주세요.\n- 채팅 > 반환할 사용자의 채팅방 진입 > 좌측 하단의 '+' 버튼 선택 > ${'송금'} 선택\n※ 한 번 송금하면 회수할 수 없으니 금액을 잘 확인해 주세요.\n\n2. 연락이 불가하거나 해결이 되지 않을 경우, 당근페이 고객센터 문의를 접수해주세요.\n\n3. 고객센터에서 송금받은 수취인에게 알림 발송/연락 등 반환 동의를 구하기 위해 노력할게요.';

///요청 상태
const ORDER_STATUS = ['요청대기', '진행중', '진행완료', '요청취소'];

/// 채팅 신고 사유
const SELECT_REASON = '타당한 신고 사유를 선택해주세요.\n신고 사유에 맞지 않는 신고를 하실 경우,\n해당 신고는 처리 되지 않습니다.';
enum ReasonForReporting {
  spam('스팸홍보/도배'),
  profanity('욕설/혐오/차별'),
  harmful('음란물/유해한 정보'),
  fraud('사기/불법정보'),
  inappropriate('부적절한 내용');

  const ReasonForReporting(this.korean);
  final String korean;
}