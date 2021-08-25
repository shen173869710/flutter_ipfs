import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/routes/route_handlers.dart';
import 'package:ipfsnets/ui/pages/me/baseListpage/base_list_page.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_rechage_page.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_withdrawal_end_page.dart';
import 'package:ipfsnets/ui/pages/me/cny/cny_withdrawal_page.dart';
import 'package:ipfsnets/ui/pages/me/more/more_page.dart';
import 'package:ipfsnets/ui/pages/me/setting/password_page.dart';
import 'package:ipfsnets/ui/pages/webview_page.dart';

class Routes {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  static String root = "/";
  static String index = "/index";
  static String login = "/login";
  static String register = "/register";
  static String forget = "/register/forget";
  static String webViewPage = '/webView';
  static String userManager = "/me/usermanager";
  static String userEdit = "/me/useredit";
  //cny
  static String cnyAccount = '/cny/cnyAccount';
  static String cnyRechage = "/cny/cnyrechage";
  static String cnyRechageRecord = "/cny/cnyrechagerecord";
  static String cnyWithdrawal = "/cny/cnywithdrawal";
  static String cnyWithdrawalRecord = "/cny/cnywithdrawalrecord";
  static String cnyWithdrawalEnd = "/cny/cnywithdrawalend";
  static String morePage = "/me/more/morepage";
  // 我的钱包
  static String walletPage = "/me/wallet/walletpage";
  static String walletInfoPage = "/me/wallet/walletinfopage";
  // 钱包
  static String walletScanPage = "/me/wallet/walletscanpage";
  static String walletWithdrawalPage = "/wallet/user/walletwithdrawalpage";
  static String walletRechagePage = "/me/wallet/walletrechagepage";
  static String walletExchangePage = "/me/wallet/walletexchangepage";

  static String walletRechageRecordPage = "/me/wallet/walletrechagerecordpage";
  static String walletWithdrawalRecordPage = "/me/wallet/walletwithdrawalrecordpage";
  static String walletWithdrawalAddressPage = "/me/wallet/walletwithdrawaladdresspage";

  static String qrcodeScannerPage = "/me/wallet/qrcodescannerpage";
  static String walletExchangeRecordPage = "/me/wallet/walletexchangerecordpage";
  // 内网转账
  static String transferPage = "/me/transfer/transferpage";
  static String transferRecordPage = "/me/transfer/transferrecordpage";
  // 我的服务器
  static String machinePage = "/me/machine/machinePage";
  static String machineInfoPage = "/me/machine/machineInfoPage";
  static String machineTotalPage = "/me/machine/machineTotalPage";
  static String machineEarningsPage = "/me/machine/machineEarningsPage";
  static String machineHostingPage = "/me/machine/machineHostingPage";
  static String machinePledgePage = "/me/machine/machinePledgePage";
  static String machineUpdatePage = "/me/machine/machineUpdatePage";
  // 服务器市场
  static String marketInfoPage = "/market/marketinfopage";
  static String marketBuyPage = "/market/marketbuypage";
  static String marketCouponsPage = "/me/market/marketCouponspage";
  static String marketEndPage = "/me/market/marketEndpage";
  //市场行情
  static String quoteSearchPage = "/quote/quoteSearchPage";
  // 设置页面
  static String settingPage = "/me/setting/settingpage";
  static String fansPage = "/me/fanspage";
  static String passwordPage = "/me/setting/passwordpage";
  static String languagePage = "/me/setting/languagePage";
  static String baseListPage = "/me/baselistpage/baselistpage";
  static String photoPage = "/me/photopage";
// 路由管理
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
          print("ROUTE WAS NOT FOUND !!!");
          return;
        });
    router.define(root, handler: rootHandler);
    router.define(index, handler: indexHandler);
    router.define(login, handler: loginHandler);
    router.define(register, handler: registerHandler);
    router.define(forget, handler: forgetHandler);

    router.define(cnyAccount, handler: cnyAccountHandler);
    router.define(webViewPage, handler: Handler(handlerFunc: (_, params) {
      final String title = params['title']?.first ?? '';
      final String url = params['url']?.first ?? '';
      return WebViewPage(title: title, url: url);
    }));
    // cny充值
    router.define(cnyRechage, handler:cnyRechageHandler);
    // cny提现
    router.define(cnyWithdrawal, handler:cnyWithdrawalHandler);
    router.define(cnyRechageRecord, handler: cnyRechageRecordHandler);
    router.define(cnyWithdrawalRecord, handler: cnyWithdrawalRecordHandler);
    router.define(cnyWithdrawalEnd, handler: cnyWithdrawalEndHandler);
    router.define(morePage, handler: moreHandler);

    router.define(walletPage, handler: walletHandler);
    router.define(walletInfoPage, handler: walletInfoHandler);
    router.define(walletScanPage, handler: walletScanHandler);
    router.define(walletWithdrawalPage, handler: walletWithdrawalHandler);
    router.define(walletRechagePage, handler: walletRechageHandler);
    router.define(walletExchangePage, handler: walletExchangeHandler);
    router.define(walletRechageRecordPage, handler: walletRechageRecordHandler);
    router.define(walletWithdrawalRecordPage, handler: walletWithdrawalRecordHandler);
    router.define(walletWithdrawalAddressPage, handler: walletWithdrawalAddressHandler);
    router.define(walletExchangeRecordPage, handler: walletExchangeRecordHandler);
    router.define(languagePage, handler: languageHandler);

    router.define(qrcodeScannerPage, handler: qtcodeScannerHandler);
    router.define(transferPage, handler: transferHandler);
    router.define(transferRecordPage, handler: transferRecordHandler);

    router.define(userManager, handler: userManagerHandler);
    router.define(userEdit, handler: userEditHandler);
    router.define(settingPage, handler: settingHandler);
    router.define(languagePage, handler: languageHandler);
    router.define(passwordPage, handler: Handler(handlerFunc: (_, params) {
      final String type = params['type']?.first ?? '';
      return PasswordPage(type: type);
    }));

    router.define(baseListPage, handler:baseListHandler);
    router.define(marketInfoPage, handler:marketInfoHandler);
    router.define(marketBuyPage, handler:marketBuyHandler);
    router.define(marketCouponsPage, handler:marketCouponsHandler);
    router.define(marketEndPage, handler:marketEndHandler);
    router.define(machinePage, handler:machineHandler);
    router.define(machineInfoPage, handler:machineInfoHandler);
    router.define(machineTotalPage, handler:machineTotalHandler);
    router.define(machineEarningsPage, handler:machineEarningsHandler);
    router.define(machineHostingPage, handler:machineHostingHandler);
    router.define(machinePledgePage, handler:machinePledgeHandler);
    router.define(machineUpdatePage, handler:machineUpdateHandler);

    router.define(quoteSearchPage, handler:quoteSearchHandler);
    router.define(fansPage, handler:fansHandler);
    router.define(photoPage, handler:photoHandler);
  }
}

