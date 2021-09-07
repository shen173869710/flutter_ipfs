import 'package:ipfsnets/include.dart';
import 'package:ipfsnets/models/access_token_entity.dart';
import 'package:ipfsnets/models/acount_entiy.dart';
import 'package:ipfsnets/models/cny_account_entity.dart';
import 'package:ipfsnets/models/cny_acount_record_entity.dart';
import 'package:ipfsnets/models/cny_recharge_entity.dart';
import 'package:ipfsnets/models/cny_recharge_record_entity.dart';
import 'package:ipfsnets/models/cny_withdrawal_record_entity.dart';
import 'package:ipfsnets/models/cny_withdrawal_setting_entity.dart';
import 'package:ipfsnets/models/fans_entity.dart';
import 'package:ipfsnets/models/home_entity.dart';
import 'package:ipfsnets/models/image_entity.dart';
import 'package:ipfsnets/models/machine_entity.dart';
import 'package:ipfsnets/models/machine_hosting_entity.dart';
import 'package:ipfsnets/models/machine_pledge_entity.dart';
import 'package:ipfsnets/models/machine_top_entity.dart';
import 'package:ipfsnets/models/market_bar_entity.dart';
import 'package:ipfsnets/models/market_buy_entity.dart';
import 'package:ipfsnets/models/market_coupon_entity.dart';
import 'package:ipfsnets/models/market_entity.dart';
import 'package:ipfsnets/models/quote_optional_entity.dart';
import 'package:ipfsnets/models/share_cion_entity.dart';
import 'package:ipfsnets/models/share_day_entity.dart';
import 'package:ipfsnets/models/share_month_entity.dart';
import 'package:ipfsnets/models/transfer_entity.dart';
import 'package:ipfsnets/models/transfer_record_entity.dart';
import 'package:ipfsnets/models/user_entity.dart';
import 'package:ipfsnets/models/wallet_account_entity.dart';
import 'package:ipfsnets/models/wallet_address_entity.dart';
import 'package:ipfsnets/models/wallet_home_entity.dart';
import 'package:ipfsnets/models/wallet_info_entity.dart';
import 'package:ipfsnets/models/wallet_info_list_entity.dart';
import 'package:ipfsnets/models/wallet_rechage_entity.dart';
import 'package:ipfsnets/models/wallet_withdrawal_entity.dart';
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
    }else if (name == "WalletHomeEntity"){
      return WalletHomeEntity.fromJson(json)as T;
    }else if (name == "WalletInfoEntity"){
      return WalletInfoEntity.fromJson(json)as T;
    }else if (name == "MarketEntity"){
      return MarketEntity.fromJson(json)as T;
    }else if (name == "MarketBuyEntity"){
      return MarketBuyEntity.fromJson(json)as T;
    }else if (name == "MachineTopEntity"){
      return MachineTopEntity.fromJson(json)as T;
    }else if (name == "MachineHostingEntity"){
      return MachineHostingEntity.fromJson(json)as T;
    }else if (name == "MachinePledgeEntity"){
      return MachinePledgeEntity.fromJson(json)as T;
    }else if (name == "CnyWithdrawalSettingEntity"){
      return CnyWithdrawalSettingEntity.fromJson(json)as T;
    }else if (name == "FansEntity"){
      return FansEntity.fromJson(json)as T;
    }else if (name == "ShareDayEntity"){
      return ShareDayEntity.fromJson(json)as T;
    }else if (name == "ShareCionEntity"){
      return ShareCionEntity.fromJson(json)as T;
    }else if (name == "ShareMonthEntity"){
      return ShareMonthEntity.fromJson(json)as T;
    }else if (name == "HomeEntity"){
      return HomeEntity.fromJson(json)as T;
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
    }else if(<WalletAccountEntity>[] is M){
      return data.map<WalletAccountEntity>((e) => WalletAccountEntity.fromJson(e)).toList() as M;
    }else if(<WalletRechageEntity>[] is M){
      LogUtil.e("解析数组对象WalletRechageEntity");
      return data.map<WalletRechageEntity>((e) => WalletRechageEntity.fromJson(e)).toList() as M;
    }else if(<WalletWithdrawalEntity>[] is M){
      return data.map<WalletWithdrawalEntity>((e) => WalletWithdrawalEntity.fromJson(e)).toList() as M;
    } else if(<WalletAddressEntity>[] is M){
      return data.map<WalletAddressEntity>((e) => WalletAddressEntity.fromJson(e)).toList() as M;
    } else if(<TransferRecordEntity>[] is M){
      return data.map<TransferRecordEntity>((e) => TransferRecordEntity.fromJson(e)).toList() as M;
    } else if(<WalletInfoListEntity>[] is M){
      return data.map<WalletInfoListEntity>((e) => WalletInfoListEntity.fromJson(e)).toList() as M;
    } else if(<TransferEntity>[] is M){
      LogUtil.e("解析数组对象 TransferEntity");
      return data.map<TransferEntity>((e) => TransferEntity.fromJson(e)).toList() as M;
    }else if(<MarketBarEntity>[] is M){
      LogUtil.e("解析数组对象 MarketBarEntity");
      return data.map<MarketBarEntity>((e) => MarketBarEntity.fromJson(e)).toList() as M;
    }else if(<MarketEntity>[] is M){
      LogUtil.e("解析数组对象 MarketEntity");
      return data.map<MarketEntity>((e) => MarketEntity.fromJson(e)).toList() as M;
    } else if(<MarketCouponEntity>[] is M){
      LogUtil.e("解析数组对象 MarketCouponEntity");
      return data.map<MarketCouponEntity>((e) => MarketCouponEntity.fromJson(e)).toList() as M;
    }else if(<QuoteOptionalEntity>[] is M){
      LogUtil.e("解析数组对象1 QuoteOptionalEntity");
      return data.map<QuoteOptionalEntity>((e) => QuoteOptionalEntity.fromJson(e)).toList() as M;
    }else if(<MachineEntity>[] is M){
      LogUtil.e("解析数组对象 MachineEntity");
      return data.map<MachineEntity>((e) => MachineEntity.fromJson(e)).toList() as M;
    }else if(<FansEntity>[] is M){
      LogUtil.e("解析数组对象 FansEntity");
      return data.map<FansEntity>((e) => FansEntity.fromJson(e)).toList() as M;
    }else if(<ShareDayEntity>[] is M){
      LogUtil.e("解析数组对象 ShareDayEntity");
      return data.map<ShareDayEntity>((e) => ShareDayEntity.fromJson(e)).toList() as M;
    } else if(<ShareCionEntity>[] is M){
      LogUtil.e("解析数组对象 ShareCionEntity");
      return data.map<ShareCionEntity>((e) => ShareCionEntity.fromJson(e)).toList() as M;
    }
    throw Exception("-----------------数组子类异常 no fond");
  }
}

