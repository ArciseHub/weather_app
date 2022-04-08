String findIcon(String name, bool type) {
  if (type) {
    switch (name) {
      case "Clouds":
        return "assets/images/cloud/cloudy.png";
        break;
      case "Rain":
        return "assets/images/cloud/rainy.png";
        break;
      case "Drizzle":
        return "assets/images/rain/rainy.png";
        break;
      case "Thunderstorm":
        return "assets/images/cloud/thunder.png";
        break;
      case "Snow":
        return "assets/images/cloud/snowy.png";
        break;
      default:
        return "assets/images/sun/sunny.png";
    }
  } else {
    switch (name) {
      case "Clouds":
        return "assets/sunny_2d.png";
        break;
      case "Rain":
        return "assets/rainy_2d.png";
        break;
      case "Drizzle":
        return "assets/rainy_2d.png";
        break;
      case "Thunderstorm":
        return "assets/thunder_2d.png";
        break;
      case "Snow":
        return "assets/snow_2d.png";
        break;
      default:
        return "assets/sunny_2d.png";
    }
  }
}
