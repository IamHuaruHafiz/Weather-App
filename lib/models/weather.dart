class WeatherData {
  String name;
  String country;
  String condition;
  String icon;
  double tempInC;
  double tempInF;
  int humidity;
  String currentDayDate;
  String currentDaycondition;
  double currentDaymaxTempInC;
  double currentDayminTempInC;
  double currentDaymaxTempInF;
  double currentDayminTempInF;
  int currentDayavgHumidity;
  int currentDaydailyChanceOfRain;
  String nextDayDate;
  String nextDaycondition;
  double nextDaymaxTempInC;
  double nextDayminTempInC;
  double nextDaymaxTempInF;
  double nextDayminTempInF;
  int nextDayavgHumidity;
  int nextDaydailyChanceOfRain;
  String nextTwoDaysDate;
  String nextTwoDayscondition;
  double nextTwoDaysmaxTempInC;
  double nextTwoDaysminTempInC;
  double nextTwoDaysmaxTempInF;
  double nextTwoDaysminTempInF;
  int nextTwoDaysavgHumidity;
  int nextTwoDaysdailyChanceOfRain;
  WeatherData({
    required this.name,
    required this.country,
    required this.condition,
    required this.icon,
    required this.tempInC,
    required this.tempInF,
    required this.humidity,
    required this.currentDayDate,
    required this.currentDaycondition,
    required this.currentDaymaxTempInC,
    required this.currentDayminTempInC,
    required this.currentDaymaxTempInF,
    required this.currentDayminTempInF,
    required this.currentDayavgHumidity,
    required this.currentDaydailyChanceOfRain,
    required this.nextDayDate,
    required this.nextDaycondition,
    required this.nextDaymaxTempInC,
    required this.nextDayminTempInC,
    required this.nextDaymaxTempInF,
    required this.nextDayminTempInF,
    required this.nextDayavgHumidity,
    required this.nextDaydailyChanceOfRain,
    required this.nextTwoDaysDate,
    required this.nextTwoDayscondition,
    required this.nextTwoDaysmaxTempInC,
    required this.nextTwoDaysminTempInC,
    required this.nextTwoDaysmaxTempInF,
    required this.nextTwoDaysminTempInF,
    required this.nextTwoDaysavgHumidity,
    required this.nextTwoDaysdailyChanceOfRain,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json["location"]["name"] as String,
      country: json["location"]["country"] as String,
      condition: json["current"]["condition"]["text"] as String,
      icon: json["current"]["condition"]["icon"] as String,
      tempInC: json["current"]["temp_c"],
      tempInF: json["current"]["temp_f"],
      humidity: json["current"]["humidity"],
      currentDayDate: json["forecast"]["forecastday"][0]["date"],
      currentDaycondition: json["forecast"]["forecastday"][0]["day"]
          ["condition"]["text"],
      currentDaymaxTempInC: json["forecast"]["forecastday"][0]["day"]
          ["maxtemp_c"],
      currentDayminTempInC: json["forecast"]["forecastday"][0]["day"]
          ["mintemp_c"],
      currentDaymaxTempInF: json["forecast"]["forecastday"][0]["day"]
          ["maxtemp_f"],
      currentDayminTempInF: json["forecast"]["forecastday"][0]["day"]
          ["mintemp_f"],
      currentDayavgHumidity: json["forecast"]["forecastday"][0]["day"]
          ["avghumidity"],
      currentDaydailyChanceOfRain: json["forecast"]["forecastday"][0]["day"]
          ["daily_chance_of_rain"],
      nextDayDate: json["forecast"]["forecastday"][1]["date"],
      nextDaycondition: json["forecast"]["forecastday"][1]["day"]["condition"]
          ["text"],
      nextDaymaxTempInC: json["forecast"]["forecastday"][1]["day"]["maxtemp_c"],
      nextDayminTempInC: json["forecast"]["forecastday"][1]["day"]["mintemp_c"],
      nextDaymaxTempInF: json["forecast"]["forecastday"][1]["day"]["maxtemp_f"],
      nextDayminTempInF: json["forecast"]["forecastday"][1]["day"]["mintemp_f"],
      nextDayavgHumidity: json["forecast"]["forecastday"][1]["day"]
          ["avghumidity"],
      nextDaydailyChanceOfRain: json["forecast"]["forecastday"][1]["day"]
          ["daily_chance_of_rain"],
      nextTwoDaysDate: json["forecast"]["forecastday"][2]["date"],
      nextTwoDayscondition: json["forecast"]["forecastday"][2]["day"]
          ["condition"]["text"],
      nextTwoDaysmaxTempInC: json["forecast"]["forecastday"][2]["day"]
          ["maxtemp_c"],
      nextTwoDaysminTempInC: json["forecast"]["forecastday"][2]["day"]
          ["mintemp_c"],
      nextTwoDaysmaxTempInF: json["forecast"]["forecastday"][2]["day"]
          ["maxtemp_f"],
      nextTwoDaysminTempInF: json["forecast"]["forecastday"][2]["day"]
          ["mintemp_f"],
      nextTwoDaysavgHumidity: json["forecast"]["forecastday"][2]["day"]
          ["avghumidity"],
      nextTwoDaysdailyChanceOfRain: json["forecast"]["forecastday"][2]["day"]
          ["daily_chance_of_rain"],
    );
  }
}
