class ApiConfig {
  // static const String hostName = '192.168.43.143:4040';
  static const String hostName = 'bluetup.herokuapp.com';
  static const String getOtp = '/getOtp';
  static const String checkOtp = '/verifyCode';
  static const String signUp = '/user/register';
  static const String login = '/user/login';
  static const String checkToken = '';
  static const String getWalletBalance = '/gen/getBalance/';
  static const String addWalletBalance = '/gen/addBalance';
  static const String getinvBalance = '/investment/totalBal/';
  static const String addNewInv = '/investment/invest';
  static const String getDeals = '/investment/getDeals';
  static const String getInvz = '/investment/myInvestments/';
  static const String getSavings = '/savings/getSavingsProfile/';
  static const String getRef  = '/ref/getRef/';
  static const String addRef = '/ref/addRef';
  static const String createRef = '/ref/createRef';
  static const String rate =
      'https://fcsapi.com/api-v3/forex/latest?id=1&access_key=TmNAVLIPMxktTQUGQr0kho';
}
