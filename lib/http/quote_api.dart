
import 'dart:convert';

import 'package:ipfsnets/models/find__entity.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/net/base_entity.dart';
import 'package:ipfsnets/utils/user_util.dart';

import 'http_manager.dart';

class QuoteApi{

  //自选接口
  static const String quote_home_user = "quote/app/op/query/";
  // 热搜接口
  static const String quote_home_op = "quote/app/pop/query";
  // 市值
  static const String quote_home__cap = "quote/app/quotes/marketCap";
  // 排行榜
  static const String quote_home__leaderBoard = "quote/app/quotes/leaderBoard";


  static  Future<BaseEntity> getQuoteHome(num type) {
    String url = "";
    if (type == 1) {
      url = quote_home_user+UserUtil.getUserInfo().userId.toString();
    }else if (type == 2) {
      url = quote_home__cap;
    }else if (type == 3) {
      url = quote_home_op;
    }else if (type == 4) {
      url = quote_home__leaderBoard;
    }

    return HttpManager.getInstance().get<List<QuoteOptionalEntity>>(url,withLoading: false);
  }

  //{
  //   "asc": 0,
  //   "orderBy": 0,
  //   "userId": 0
  // }
  static  Future<BaseEntity> getQuoteHomeOb(int asc, int orderBy) {
    Map<String, dynamic> param = new Map();
    param['asc'] = asc;
    param['orderBy'] = orderBy;
    param['userId'] = UserUtil.getUserInfo().userId.toString();
    return HttpManager.getInstance().post<List<QuoteOptionalEntity>>(quote_home_user,jsonEncode(param),withLoading: false);
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

  // 币种添加关注
  static const String quote_op_add = "quote/app/op/add/";
  static  Future<BaseEntity> quoteAdd(String name) {
    return HttpManager.getInstance().get(quote_op_add+name);
  }
  // 币种取消关注
  static const String quote_op_del = "quote/app/op/";
  static  Future<BaseEntity> quoteDel(String name) {
    // List<String>list = [];
    // list.add(name);
    return HttpManager.getInstance().del(quote_op_del+name,"");
  }

  // 公告
  static const String find_list = "quote/app/notice/availableNoticeList";
  static  Future<BaseEntity> findList() {
    return HttpManager.getInstance().get<List<FindEntity>>(find_list);
  }
}
