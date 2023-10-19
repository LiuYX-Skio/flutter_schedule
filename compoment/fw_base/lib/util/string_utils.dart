class StringUtils{

  /// 判断是否为空，为空返回空字符串
  ///
  /// @param param 参数
  /// @return
   static String getNotNullParam(String param) {
    return isEmpty(param) ? "" : param;
  }
    static bool isEmpty(String str) {
     return (str.isEmpty);
   }

}