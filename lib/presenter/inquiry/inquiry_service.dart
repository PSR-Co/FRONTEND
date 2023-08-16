import 'package:psr/model/data/inquiry/add_inquiry_model.dart';
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
    return (response == null) ? null : GeneralModel.fromJson(response);
  }

  Future<dynamic> getInquiryList(Map<String, dynamic> queryParameters) async {
    final response = await APIManager().request(RequestType.GET, INQUIRY_PATH, null, queryParameters, null);
    return response;
  }

  Future<dynamic> getDetailInquiry(int inquiryId) async {
    final response = await APIManager().request(RequestType.GET, '$INQUIRY_PATH/$inquiryId', null, null, null);
    print('response : $response');
    return response;
  }

}