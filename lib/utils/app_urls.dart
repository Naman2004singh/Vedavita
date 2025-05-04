class AppUrls {
  // base url
  static const baseUrl = "https://vedavite-backend-vrgl.onrender.com/api/v1/";


  // auth urls
  static const registerUrl =
      "${baseUrl}user/register";
  static const loginUrl =
      "${baseUrl}user/login";
  static const googleAuthUrl =
      "${baseUrl}user/google-login";
  static const logoutUrl =
      "${baseUrl}user/logout";
  static const getUserDetailUrl =
      "${baseUrl}user/get-user";

  //app urls
  static const chatbotUrl =
      "${baseUrl}chatBot";
  static const uploadImageUrl =
      "${baseUrl}ml/scan-image";
  static const heartRateUrl = 
      "${baseUrl}parameters/heart-rate";
  static const temperatureUrl = 
      "${baseUrl}parameters/temperature";
  static const bloodPressureUrl = 
      "${baseUrl}parameters/blood-pressure";
  static const spo2Url = 
      "${baseUrl}parameters/oxygen-saturation";
  }
