import 'package:shared_preferences/shared_preferences.dart';


class CacheUtil {

  static SharedPreferences _sharePref;
  static CacheUtil _instance;
  factory CacheUtil() => _shareInstance();
  static CacheUtil get sharedInstance => _shareInstance();

  CacheUtil._intinal() {
    init();
  }


  static _shareInstance(){
    if(_instance == null){
      _instance = new CacheUtil._intinal();
    }
    return _instance;
  }

  static Future init() async {
    _sharePref = await SharedPreferences.getInstance();
  }



  void sotreAuthorizationCode (String code){
    if(code != null && code.length > 0){
      _sharePref.setString('authorization_code', code);
    }
  }

  String getAuthorizationCode (){
    String code = _sharePref.getString('authorization_code');
    return code == null ? '' : code;
  }


  void sotreAccessToken (String token){
    if(token != null && token.length > 0){
      _sharePref.setString('access_token', token);
    }
  }

  String getAccessToken (){
    String token =  _sharePref.getString('access_token');
    return token == null ? '' : token;
  }

  void sotreUid (String uid){
    if(uid != null && uid.length > 0){
      _sharePref.setString('uid', uid);
    }
  }

  String getUid (){
    String uid = _sharePref.getString('uid');
    return uid == null ? '' : uid;
  }


  void sotreExpires (int expires){
      _sharePref.setInt('expires', expires);
  }

  int getExpires (){
    int exp = _sharePref.getInt('expires');
    return exp != null ? exp : 0;
  }
}