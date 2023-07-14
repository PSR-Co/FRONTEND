import 'package:flutter/material.dart';

// Controller
class SliderController {
  final Curve curve;

  SliderController({
    this.curve = Curves.easeOut,
  });

  Future<void> Function(int i)? moveTo;
  Future<void> Function()? moveToNext;
  Future<void> Function()? moveToPrevious;

  get duration => null;
}


//WidgetSlider의 크기를 생성하는데 사용되는 wrapper widget
class _FlexdSizedBox extends StatelessWidget {
  final Widget? child;
  final double? aspectRatio;
  final double? fixedSize;

  const _FlexdSizedBox({Key? key, this.child, this.aspectRatio, this.fixedSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (fixedSize != null) return SizedBox(height: fixedSize, child: child);
    return AspectRatio(aspectRatio: aspectRatio ?? 1, child: child);
  }
}


class WidgetSlider extends StatefulWidget {
  //itemBuilder를 통해 생성되는 아이템 개수
  final int itemCount;

  //list를 생성해주는 Widget
  //생성된 위젯은 PageView에 표시
  //첫 번째 인덱스는 각 요소의 실제 인덱스고 두 번째 인덱스는은 가운데 아이템의 인덱스입니다.
  final Widget Function(BuildContext, int, int) itemBuilder;

  //아이템 이동에 사용되는 함수
  //i는 이동된 아이템의 인덱스
  final Function(int i)? onMove;


  // next()    | navigates to next(current+1) item.
  // back()    | navigates to back(current-1) item.
  // moveTo(i) | navigates to item at given index(i).
  final SliderController? controller;

  //아이템들 간 인접성
  final double proximity;

  //양 옆 아이템들과 센터 아이템들의 사이즈 비율
  final double? sizeDistinction;

  //스크롤 방향
  final Axis scrollDirection;

  //전체 리스트 위젯 비율
  final double aspectRatio;

  //전체 목록 위젯의 구체적인 고정 크기. => 정해주지 않으면 aspectRatio 값 무시됨
  final double? fixedSize;

  final Curve transformCurve;

  //리스트를 역순으로 초기화
  final bool reverse;

  //위젯의 physics 애니메이션 스냅을 활성화/비활성화
  final bool pageSnapping;

  //리스트 위젯의 무한 스크롤을 활성화/비활성화.
  final bool infiniteScroll;

  //리스트 위젯의 physics
  //physics은 다음을 사용하여 페이지 경계에 스냅하도록 수정됨.
  // [PageScrollPhysics] 사용 전.
  // 명시적인 [ScrollBehavior]가 [scrollBehavior]에 제공되면
  // 해당 동작에 의해 제공되는 [ScrollPhysics]가 다음에 우선함.
  // [physics].
  // 일치하는 플랫폼 규칙으로 기본 설정됩니다.
  final ScrollPhysics? physics;

  //리스트의 양쪽 끝에 패딩을 추가할지 여부.
  // true로 설정되고 [sizeDistinction] < 1.0이면 패딩이 추가.
  // 첫 번째와 마지막 하위 슬라이버가 중앙에 오도록
  // 처음 또는 끝까지 각각 스크롤했을 때의 뷰포트.
  // [sizeDistinction] >= 1.0인 경우 이 속성은 효과가 없음.
  // 설정하지 않으면 기본값은 [true].
  final bool padEnds;

  const WidgetSlider({
    Key? key,
    required this.itemCount,
    required this.itemBuilder,
    this.onMove,
    this.controller,
    this.proximity = .5,
    this.sizeDistinction = 0.8,
    this.scrollDirection = Axis.horizontal,
    this.aspectRatio = 2,
    this.fixedSize,
    this.transformCurve = Curves.easeOut,
    this.reverse = false,
    this.pageSnapping = true,
    this.infiniteScroll = false,
    this.physics,
    this.padEnds = true,
  }) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<StatefulWidget> createState() => WidgetSliderState(controller);
}

class WidgetSliderState extends State<WidgetSlider> {
  WidgetSliderState(SliderController? controller) {
    if (controller == null) return;
    _controller = controller;

    controller.moveTo = moveTo;
    controller.moveToNext = moveToNext;
    controller.moveToPrevious = moveToPrevious;
  }

  //정확한 현재 아이템 인덱스
  double page = 1;

  //구체적인 현재 아이템 인덱스, page의 반올림
  // [widget.itemBuilder]에서 [activeIndex]로 사용됨.
  int activePage = 1;

  SliderController _controller = SliderController();
  late PageController pageController;

  @override
  void initState() {
    _reInitEssentials();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WidgetSlider oldWidget) {
    _reInitEssentials();
    super.didUpdateWidget(oldWidget);
  }

  void _reInitEssentials() {
    pageController = PageController(
      initialPage: activePage,
      viewportFraction: widget.proximity,
    );

    // [페이지 값은 콘텐츠 차원이 설정된 후에만 사용 가능] 오류를 방지하는 데 사용됨
    // 리스너를 통해 페이지 값을 가져오면 오류가 발생하지 않음. [pageController.page] 대신 [currentPage]를 사용.
    pageController.addListener(() {
      if (pageController.page == null) return;
      page = pageController.page!;
    });
  }

// 컨트롤러의 moveTo 함수 클로저(콜백).
  Future<void> moveTo(i) async {
    return await pageController.animateToPage(
      i,
      duration: _controller.duration,
      curve: _controller.curve,
    );
  }

// 컨트롤러의 moveToNext 함수 클로저(콜백).
  Future<void> moveToNext() async {
    return await pageController.nextPage(
      duration: _controller.duration,
      curve: _controller.curve,
    );
  }

// 컨트롤러의 moveToPrevious 함수 클로저(콜백).
  Future<void> moveToPrevious() async {
    return await pageController.previousPage(
      duration: _controller.duration,
      curve: _controller.curve,
    );
  }

  // 각 아이템에 사이즈 설정
  double _generateScale(int index, Size size) {
    if (widget.sizeDistinction == null) return 1;

    final offset = (page - index).abs();
    final ratio = (1 - (widget.sizeDistinction! * offset)).clamp(0, 1);

    return widget.transformCurve.transform(ratio.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return _FlexdSizedBox(
      fixedSize: widget.fixedSize,
      aspectRatio: widget.aspectRatio,
      child: PageView.builder(
        controller: pageController,
        reverse: widget.reverse,
        itemCount: widget.itemCount,
        pageSnapping: widget.pageSnapping,
        physics: widget.physics,
        padEnds: widget.padEnds,
        scrollDirection: widget.scrollDirection,
        onPageChanged: (i) {
          setState(() => activePage = i);

          widget.onMove?.call(i);
        },
        itemBuilder: (context, i) => AnimatedBuilder(
          animation: pageController,
          child: widget.itemBuilder(context, i, activePage),
          builder: (context, child) {
            final size = MediaQuery.of(context).size;
            final scale = _generateScale(i, size);

            return Transform.scale(
              scale: scale,
              child: Builder(
                builder: (context) {
                  if (widget.scrollDirection == Axis.horizontal) {
                    return SizedBox(child: child, width: scale * size.width);
                  }

                  return SizedBox(child: child, height: size.height);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}