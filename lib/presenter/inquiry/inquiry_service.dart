import 'package:psr/model/data/inquiry/inquiry_model.dart';
import 'package:psr/model/network/api_manager.dart';

import '../../model/data/general_model.dart';

class InquiryService{
  final INQUIRY_PATH = '/inquiries';

  static final InquiryService _inquiryService = InquiryService._();
  InquiryService._();
  factory InquiryService(){
    return _inquiryService;
  }

  Future<dynamic> addInquiry(String title, String content) async {
    final body = AddInquiryRequest(title: title, content: content).toJson();
    final response = await APIManager().request(RequestType.POST, INQUIRY_PATH, null, null, body);
    print('response : $response');
    return (response == null) ? null : GeneralModel.fromJson(response);
  }
}