
import 'package:ipfsnets/models/market_bar_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/user_util.dart';
import 'http_manager.dart';

class QuoteApi{

  //自选接口
  static const String quote_home_user = "quote/app/op/list/";
  // 热搜接口
  static const String quote_home_op = "quote/app/pop/query";
  // 市值
  static const String quote_home__cap = "quote/app/quotes/marketCap";
  // 排行榜
  static const String quote_home__leaderBoard = "quote/app/quotes/leaderBoard";

  static  Future<BaseEntity> getQuoteHome(num type) {
    String url = "";
    bool show = true;
    if (type == 1) {
      url = quote_home_user+UserUtil.getUserInfo().userId.toString();
      show = false;
    }else if (type == 2) {
      url = quote_home__cap;
    }else if (type == 3) {
      url = quote_home_op;
    }else if (type == 4) {
      url = quote_home__leaderBoard;
    }

    return HttpManager.getInstance().get<List<QuoteOptionalEntity>>(url);
  }

  // 热搜推荐
  static const String quote_home_recommend = "quote/app/pop/list/";
  static  Future<BaseEntity> getQuoteRecomend() {
    return HttpManager.getInstance().get<List<QuoteOptionalEntity>>(quote_home_recommend,withLoading: false);
  }
  // 模糊查询币种
  static const String quote_home_search = "quote/app/quotes/searchSymbols/";
  static  Future<BaseEntity> getQuoteSerach(String search) {
    return HttpManager.getInstance().get<List<QuoteOptionalEntity>>(quote_home_search+search,withLoading: false);
  }

}
