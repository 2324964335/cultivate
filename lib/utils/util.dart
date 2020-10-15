import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'CommenColor.dart';
import '../services/api.dart';
import 'package:cached_network_image/cached_network_image.dart';
export 'sp_util.dart' show SpUtil;
export 'perm_utils.dart' show PermUtils;
export 'log_util.dart' show LogUtil;
export 'screen_adaper.dart' show ScreenAdaper;
export 'toast_show.dart' show ToasrShow;
export 'storage.dart' show StorageUtil;
export 'package:bot_toast/bot_toast.dart' show BotToast;
export 'CommenColor.dart' show CommenColor;
export 'toast_show.dart' show ToastShow;
export 'DarkText.dart' show DarkText;
export 'LightText.dart' show LightText;
export 'Line.dart' show Line;
export '../services/api.dart' show Api;
export 'package:cached_network_image/cached_network_image.dart' show CachedNetworkImage;
class Util {
  /// 防抖函数
  static Function debounce(Function fn, [int t = 30]) {
    Timer _debounce;
    return (data) {
      // 还在时间之内，抛弃上一次
      if (_debounce?.isActive ?? false) _debounce.cancel();

      _debounce = Timer(Duration(milliseconds: t), () {
        fn(data);
      });
    };
  }

  static String getImagePath(String name,{String format:"png"}) {
    return "asset/images/$name.$format";
  }

  /// tosat提示
  static toastTips(String text) {
    Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      // gravity: ToastGravity.CENTER, // 提示位置
      fontSize: 18, // 提示文字大小
    );
  }
}
