
import '../../../../services/api.dart';
import '../../../../utils/util.dart';
import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'contact_list_entity.dart';
class ContactRequest{

  static Future<dynamic> requestContactList(String tokenID) async {
    Map resData = await Api().getContactList(tokenID);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<ContactListEntity>(resData);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }


}