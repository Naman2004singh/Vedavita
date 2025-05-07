import 'package:vedavita/data/network/network_api_service.dart';
import 'package:vedavita/models/heartRate/heart_rate_response.dart';
import 'package:vedavita/utils/app_urls.dart';

class HeartChartRepository {

  final _api = NetworkApiService();

  
  // get heart rate data
  Future<HeartRateResponse> getHeartRateData() async {
    final response = await _api.getApi(AppUrls.heartRateUrl);

    final heartRateResponse = HeartRateResponse.fromJson(response);
    return heartRateResponse;
  }
}
