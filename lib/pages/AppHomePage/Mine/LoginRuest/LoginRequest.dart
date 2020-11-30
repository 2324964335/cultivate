import '../../../../utils/storage.dart';
import '../../../../utils/util.dart';
import '../../../../utils/LoginModel.dart';

class MineRequest{
  static Future<UserModel> requestLoginByPASS(String mobile_str,String pass_word_str,String deviceID_str) async{
    Map resData = await Api().loginByPass(mobile_str, pass_word_str,deviceID_str);
    LogUtil.d(resData);
    final subject = resData['data'];
    if(resData['success'] == 1){
      StorageUtil().setUserJSON(resData['data']);
      return UserModel.fromMap(subject);
    }else{
      return null;
    }
  }

  static Future<Map> requestAboutUS() async{
    Map resData = await Api().aboutUS();
    LogUtil.d(resData);
    return resData;
  }
}