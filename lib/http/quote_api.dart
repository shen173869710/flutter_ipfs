
import 'package:ipfsnets/models/market_bar_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'http_manager.dart';

class QuoteApi{
  // 热搜接口
  static const String quote_home = "quote/app/pop/query";
  static  Future<BaseEntity> getQuoteHome() {
    return HttpManager.getInstance().get<List<QuoteOptionalEntity>>(quote_home);
  }



}
