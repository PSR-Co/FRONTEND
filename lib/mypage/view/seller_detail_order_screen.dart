// import 'package:flutter/material.dart';
// import 'package:psr/model/data/order/order_detail_model.dart';
// import 'package:psr/mypage/component/action_btn.dart';
// import 'package:psr/mypage/view/detail_order_screen.dart';
// import 'package:psr/presenter/order/order_service.dart';
//
// import '../../common/const/colors.dart';
//
// ///판매자&요청대기 요청상세화면
// class SellerDetailOrderSccreen extends StatefulWidget {
//   String? selectedValue;
//   int orderId;
//   String btnOption1;
//   String btnOption2;
//
//   SellerDetailOrderSccreen(
//       {required this.selectedValue,
//       required this.orderId,
//       required this.btnOption1,
//       required this.btnOption2,
//       Key? key})
//       : super(key: key);
//
//   @override
//   State<SellerDetailOrderSccreen> createState() =>
//       _SellerDetailOrderSccreenState();
// }
//
// ///TO-DO : 채팅 연결
// ///요청 상태가 진행 중 일 때 연결되는 화면
// class _SellerDetailOrderSccreenState extends State<SellerDetailOrderSccreen> {
//   final TextStyle btnTypeTextStyle = const TextStyle(
//       fontSize: 13.0, fontWeight: FontWeight.w500, color: GRAY_4_COLOR);
//   bool readOnly = true;
//
//   OrderDetailModel? data;
//
//   Future<dynamic> fetchData(int orderId) async {
//     return await OrderService().getOrderDetailData(orderId);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//       future: ,
//       builder: (context, snapshot) {
//         return DetailOrderScreen(
//           selectedValue: widget.selectedValue,
//           btnOption1: widget.btnOption1,
//           btnOption2: widget.btnOption2,
//           orderId: widget.orderId,
//           child: ActionBtn(
//             child: Container(
//               width: MediaQuery.of(context).size.width,
//               child: TextButton(
//                   onPressed: () {
//                     Navigator.pop(context, false);
//                   },
//                   child: Text(
//                     '1:1 채팅',
//                     style: btnTypeTextStyle,
//                   )),
//             ),
//           ),
//         );
//       }
//     );
//   }
// }
