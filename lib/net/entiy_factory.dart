import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/access_token_entity.dart';
import 'package:ipfsnets/models/acount_entiy.dart';
import 'package:ipfsnets/models/cny_account_entity.dart';
import 'package:ipfsnets/models/cny_acount_record_entity.dart';
import 'package:ipfsnets/models/cny_recharge_entity.dart';
import 'package:ipfsnets/models/cny_recharge_record_entity.dart';
import 'package:ipfsnets/models/cny_withdrawal_record_entity.dart';
import 'package:ipfsnets/models/image_entity.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:ipfsnets/models/wallet_withdrawal_record_entity.dart';

class EntityFactory {
  static T? generateOBJ<T>(json) {
    if (json == null) {
      return null;
    }

    String name = T.toString();
    if (json is List) {
      return _getListChildType(json);
    } else if (name == "AccessTokenEntity") {
      return AccessTokenEntity.fromJson(json)as T;
    }else if (name == "UserEntity"){
      return UserEntity.fromJson(json)as T;
    } else if (name == "ImageEntity"){
      return ImageEntity.fromJson(json)as T;
    } else if (name == "CnyAccountEntity"){
      return CnyAccountEntity.fromJson(json)as T;
    } else if (name == "CnyRechargeEntity"){
      return CnyRechargeEntity.fromJson(json)as T;
    }else if (name == "AccountEntiy"){
      return AccountEntiy.fromJson(json)as T;
    }else {
      return json as T;
    }
  }


  static M _getListChildType<M>(List data) {
    LogUtil.e("解析数组对象");
    if(<CnyAcountRecordEntity>[] is M){
      return data.map<CnyAcountRecordEntity>((e) => CnyAcountRecordEntity.fromJson(e)).toList() as M;
    }else if(<CnyRechargeRecordEntity>[] is M){
      return data.map<CnyRechargeRecordEntity>((e) => CnyRechargeRecordEntity.fromJson(e)).toList() as M;
    }else if(<CnyWithdrawalRecordEntity>[] is M){
      LogUtil.e("解析数组对象CnyWithdrawalRecordEntity");
      return data.map<CnyWithdrawalRecordEntity>((e) => CnyWithdrawalRecordEntity.fromJson(e)).toList() as M;
    }else if(<WalletWithdrawalRecordEntity>[] is M){
      LogUtil.e("解析数组对象CnyWithdrawalRecordEntity");
      return data.map<WalletWithdrawalRecordEntity>((e) => WalletWithdrawalRecordEntity.fromJson(e)).toList() as M;
    }else if(<AccountEntiy>[] is M){
      return data.map<AccountEntiy>((e) => AccountEntiy.fromJson(e)).toList() as M;
    }
    throw Exception("数组子类异常 fond");
  }
}

