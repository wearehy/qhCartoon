
import 'dart:io';
import '../../common.dart';
import 'package:dio/dio.dart';
import 'api.dart';

class HttpRequest {
  static final HttpRequest instance = HttpRequest._privateConstructor();
  Dio _dio;
  BaseOptions options;
  CancelToken cancelToken = CancelToken();

  HttpRequest._privateConstructor() {
    options = new BaseOptions(
      baseUrl: Api.BASE_URL,
      connectTimeout: 15000,
      receiveTimeout: 15000,
      contentType: ContentType.json.toString(),
      responseType: ResponseType.plain
    );
    _dio = new Dio(options);
    //添加拦截器
    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      logP('\n\n☘️☘️☘️request>>-------------------------------------------');
      logP('request url = ' + _dio.options.baseUrl + options.path);
      logP('request method = ${options.method}');
      logP('request query = ' + options.queryParameters.toString());
      logP('request sign = ' + options.headers['sign'].toString());
      logP('request data = ${options.data is FormData ? options.data.fields : options.data ?? ''}');
      logP('-------------------------------------------<<request☘️☘️☘️\n\n');
      // Do something before request is sent
      return options; //continue
    }, onResponse: (Response response) {
          logP('\n\n🌿🌿🌿response>>-------------------------------------------');
          logP('response url = ${response.request.uri}');
          logP('response code = ${response.statusCode}');
          logP('response data = ${response.data ?? ''}');
          logP('-------------------------------------------<<🌿🌿🌿️response\n\n');
      // Do something with response data
      return response; // continue
    }, onError: (DioError e) {
      logP('\n\n💊💊💊error>>-------------------------------------------');
      logP('error url = ${e.response.request.uri}');
      logP('error type = ${e.type}');
      logP('error message = ${e.message}');
      logP('error data = ${e.response.data}');
      logP('-------------------------------------------<<💊💊💊️error\n\n');
      // Do something with response error
      return e; //continue
    }));
  }

  static const ignoreKeys = ['token', 'headpic'];
  /// 构建认证code
  _buildAuthCode(String date, Map<String, dynamic> params) {
    logP('date: $date');
    String values = '';
    if (params != null && params.length > 0) {
      final keys = List.from(params.keys);
      keys.sort();
      logP('***keys = $keys');
      final reduceKeys = keys.where((key) => !ignoreKeys.contains(key));
      if (reduceKeys.length > 0) {
        values = reduceKeys.map((key) => '${params[key]}').reduce((s1, s2) => '$s1$s2');
      }
      logP('auth = $values');
    }
    return md5Text('$values${md5Text(date.substring(0, 8))}$date');
  }

  /// 构建头部
  _buildHeaders(Map<String, dynamic> headers, {Map<String, dynamic> params}) {
    Map<String, dynamic> result = Map<String, dynamic>();
    // todo 如果对头部信息需要添加
//    result['version'] = '1.0.0';
//    result['timestamp'] = DateTime.now().millisecondsSinceEpoch;
//    result['sign'] = _buildAuthCode(result['timestamp'].toString(), params);
////    if (Global.instance.isLogin) {
////      result = {'Authorization': "Bearer ${ Global.instance.user.auth}"};
////    } else {
////      result = Map<String, dynamic>();
////    }
//    if (headers != null) {
//      result.addAll(headers);
//    }
    return result;
  }

  /// get 请求
  get(url, {queryParams, isFullUrl = false, cancelToken, Map<String, dynamic> headers}) async {
    Response response;
    try {
      response = await _dio.get(isFullUrl ? "" : url, options:
      isFullUrl
          ? RequestOptions(baseUrl: url, headers: _buildHeaders(headers))
          : RequestOptions(baseUrl: Api.BASE_URL, headers: _buildHeaders(headers)), queryParameters: queryParams, cancelToken: cancelToken);
    } on DioError catch (e) {
      return e;
    }
    return response.data;
  }

  /// delete 请求
  delete(url, {queryParams, isFullUrl = false, cancelToken, Map<String, dynamic> headers}) async {
    Response response;
    try {
      response = await _dio.delete(isFullUrl ? "" : url, options: isFullUrl ? RequestOptions(baseUrl: url, headers: _buildHeaders(headers)) : RequestOptions(baseUrl: Api.BASE_URL, headers: _buildHeaders(headers)), queryParameters: queryParams, cancelToken: cancelToken);
    } on DioError catch (e) {
      return e;
    }
    return response.data;
  }

  /// post
  post(String url, {queryParams, Map<String, dynamic> formParams, model, isFullUrl = false, cancelToken, Map<String, dynamic> headers, isNotToken = false}) async {
    Response response;
    if (formParams == null && model == null) {
      formParams = Map<String, dynamic>();
    }
    // todo 如果需要自动在表单中加入token
//    if (!isNotToken && !formParams.containsKey('token')) {
//      final user = Global.user;
//      if (formParams != null && user != null) {
//        logP('token = ${user.token}');
//        formParams['token'] = user.token;
//      }
//    }
    final data =  model != null ? model.toJson() : formParams != null ? FormData.fromMap(formParams) : null;
    try {
      response = await _dio.post(isFullUrl ? "" : url,
          data: data,
          queryParameters: queryParams,
          options: RequestOptions(contentType: model == null ? "multipart/form-data" : "application/json", baseUrl: isFullUrl ? url : Api.BASE_URL, headers: _buildHeaders(headers, params: formParams)), cancelToken: cancelToken);
    } on DioError catch (e) {
      _formatError(e);
      return e;
    }
    return response.data;
  }

  /// put
  put(String url, {queryParams, formParams, model, isFullUrl = false, cancelToken, Map<String, dynamic> headers}) async {
    Response response;
    final data =  model != null ? model.toJson() : formParams != null ? FormData.fromMap(formParams) : null;
    try {
      response = await _dio.put(isFullUrl ? "" : url,
          data: data,
          queryParameters: queryParams,
          options: RequestOptions(contentType: model == null ? "multipart/form-data" : "application/json", baseUrl: isFullUrl ? url : Api.BASE_URL, headers: _buildHeaders(headers, params: formParams)), cancelToken: cancelToken);
    } on DioError catch (e) {
      _formatError(e);
      return e;
    }
    return response.data;
  }

  /*
   * error统一处理
   */
  void _formatError(DioError e) {
    if (e.response != null) {
      if (e.response.statusCode == 400) {
        toast('登录失效，请重新登录');
//        Global.instance.loginOut();
//        Global.instance.pushNamed(LoginPage.route);
        return;
      } else if (e.response.statusCode == 404) {
        toast('页面没有找到');
        return;
      } else if (e.response.statusCode == 500) {
        toast('服务器开小差了[500]');
        return;
      }
    }
    if (e.type == DioErrorType.CONNECT_TIMEOUT) {
      toast("连接超时");
    } else if (e.type == DioErrorType.SEND_TIMEOUT) {
      toast("请求超时");
    } else if (e.type == DioErrorType.RECEIVE_TIMEOUT) {
      toast("响应超时");
    } else if (e.type == DioErrorType.RESPONSE) {
      toast("出现异常");
    } else if (e.type == DioErrorType.CANCEL) {
      toast("请求取消");
    } else {
      toast("未知错误" + e.type.toString());
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

}
