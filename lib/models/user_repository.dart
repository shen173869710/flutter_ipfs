/// 用户数据仓库
class UserRepository {
  /// 认证
  /// @param username 用户名
  /// @param password 密码
  /// @return 返回认证信息
  Future<String> authenticate({
    required String username,
    required String password,
  }) async {
    await Future.delayed(Duration(seconds: 1));
    return "token";
  }

  /// 删除Token
  Future<void> deleteToToken() async {
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  /// 保存Token
  /// @param token 令牌
  Future<void> persistToken(String token) async {
    // 保存
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  /// 判断是否有Token
  /// @return true: 有; false: 没有Token
  Future<bool> hasToken() async {
    // 读取Token
    await Future.delayed(Duration(seconds: 1));
    return false;
  }
}