
import '../../../../services/api.dart';
import '../../../../utils/util.dart';
import 'package:cultivate/generated/json/base/json_convert_content.dart';
import 'message_model_list_entity.dart';
class MessageRequest{

  static Future<dynamic> requestMessageList(String tokenID,Map params) async {
    Map resData = await Api().getMessageList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<MessageModelListEntity>(resData["data"][0]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

  static Future<dynamic> requestMessageDetail(String tokenID,Map params) async {
    Map resData = await Api().getMessageList(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<MessageModelListEntity>(resData["data"][0]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

  static Future<dynamic> requestMessageDetailSee(String tokenID,Map params) async {
    Map resData = await Api().getMessageDetailSee(tokenID,params);
    LogUtil.d(resData);
    if (resData['success'] == 1){
      return JsonConvert.fromJsonAsT<MessageModelListEntity>(resData["data"][0]);
    }else if(resData['success'] == -1101){
      return resData;
    }else{
      return null;
    }
  }

}