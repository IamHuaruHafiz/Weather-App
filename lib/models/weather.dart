class CurrentWeather {
  String name;
  String country;
  String condition;
  String icon;
  double tempInC;
  double tempInF;
  int humidity;
  CurrentWeather({
    required this.name,
    required this.country,
    required this.condition,
    required this.icon,
    required this.tempInC,
    required this.tempInF,
    required this.humidity,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      name: json["location"]["name"] as String,
      country: json["location"]["country"] as String,
      condition: json["current"]["condition"]["text"] as String,
      icon: json["current"]["condition"]["icon"] as String,
      tempInC: json["current"]["temp_c"],
      tempInF: json["current"]["temp_f"],
      humidity: json["current"]["humidity"],
    );
  }
}

class ForeCastCurrentDay {
  final String date;
  final String condition;
  final double maxTempInC;
  final double minTempInC;
  final double maxTempInF;
  final double minTempInF;
  final int avgHumidity;
  final int dailyChanceOfRain;

  ForeCastCurrentDay({
    required this.date,
    required this.condition,
    required this.maxTempInC,
    required this.minTempInC,
    required this.maxTempInF,
    required this.minTempInF,
    required this.avgHumidity,
    required this.dailyChanceOfRain,
  });

  factory ForeCastCurrentDay.fromJson(Map<String, dynamic> json) {
    return ForeCastCurrentDay(
      date: json["forecast"]["forecastday"][0]["date"],
      condition: json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
      maxTempInC: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      minTempInC: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      maxTempInF: json["forecast"]["forecastday"][0]["day"]["maxtemp_f"],
      minTempInF: json["forecast"]["forecastday"][0]["day"]["mintemp_f"],
      avgHumidity: json["forecast"]["forecastday"][0]["day"]["avghumidity"],
      dailyChanceOfRain: json["forecast"]["forecastday"][0]["day"]
          ["daily_chance_of_rain"],
    );
  }
}

class ForeCastDayOne {
  final String date;
  final String condition;
  final double maxTempInC;
  final double minTempInC;
  final double maxTempInF;
  final double minTempInF;
  final int avgHumidity;
  final int dailyChanceOfRain;

  ForeCastDayOne({
    required this.date,
    required this.condition,
    required this.maxTempInC,
    required this.minTempInC,
    required this.maxTempInF,
    required this.minTempInF,
    required this.avgHumidity,
    required this.dailyChanceOfRain,
  });

  factory ForeCastDayOne.fromJson(Map<String, dynamic> json) {
    return ForeCastDayOne(
      date: json["forecast"]["forecastday"][1]["date"],
      condition: json["forecast"]["forecastday"][1]["day"]["condition"]["text"],
      maxTempInC: json["forecast"]["forecastday"][1]["day"]["maxtemp_c"],
      minTempInC: json["forecast"]["forecastday"][1]["day"]["mintemp_c"],
      maxTempInF: json["forecast"]["forecastday"][1]["day"]["maxtemp_f"],
      minTempInF: json["forecast"]["forecastday"][1]["day"]["mintemp_f"],
      avgHumidity: json["forecast"]["forecastday"][1]["day"]["avghumidity"],
      dailyChanceOfRain: json["forecast"]["forecastday"][1]["day"]
          ["daily_chance_of_rain"],
    );
  }
}

class ForeCastDayTwo {
  final String date;
  final String condition;
  final double maxTempInC;
  final double minTempInC;
  final double maxTempInF;
  final double minTempInF;
  final int avgHumidity;
  final int dailyChanceOfRain;
  ForeCastDayTwo({
    required this.date,
    required this.condition,
    required this.maxTempInC,
    required this.minTempInC,
    required this.maxTempInF,
    required this.minTempInF,
    required this.avgHumidity,
    required this.dailyChanceOfRain,
  });
  factory ForeCastDayTwo.fromJson(Map<String, dynamic> json) {
    return ForeCastDayTwo(
      date: json["forecast"]["forecastday"][2]["date"],
      condition: json["forecast"]["forecastday"][2]["day"]["condition"]["text"],
      maxTempInC: json["forecast"]["forecastday"][2]["day"]["maxtemp_c"],
      minTempInC: json["forecast"]["forecastday"][2]["day"]["mintemp_c"],
      maxTempInF: json["forecast"]["forecastday"][2]["day"]["maxtemp_f"],
      minTempInF: json["forecast"]["forecastday"][2]["day"]["mintemp_f"],
      avgHumidity: json["forecast"]["forecastday"][2]["day"]["avghumidity"],
      dailyChanceOfRain: json["forecast"]["forecastday"][2]["day"]
          ["daily_chance_of_rain"],
    );
  }
}
