class ApiUrl {
  static String baseUrl = "https://mahameru.solog.id/api/v4/";

  //auth
  static String signIn = baseUrl + "login";
  static String signOut = baseUrl + "auth/logout";
  static String getRefreshToken = baseUrl + "auth/refresh";
  static String getForgotPassword = baseUrl + "auth/forgot";
  static String getUserInformation = baseUrl + "auth/me";
  static String changePassword = baseUrl + "auth/password";

  //===============================================================

  //vehicle
  static String vehicle = baseUrl + "vehicle/";

  //master vehicle body
  static String vehicleBody = baseUrl + "vehicle-body/";

  //master vehicle property
  static String vehicleProperty = baseUrl + "vehicle-property/";

  //===============================================================

  //master bbm
  static String fuel = baseUrl + "fuel/";

  //===============================================================

  //master isu
  static String issue = baseUrl + "issue/";

  // get data bengkel
  static String getBengkel = baseUrl + 'vendor/';

  //===============================================================

  //master workshop
  static String workshop = baseUrl + "workshop/";

  //===============================================================

  //master maintenance 
  static String maintenance = baseUrl + "maintenance/";
  static String maintenanceSchedule = baseUrl + "maintenance-schedule/";

  //===============================================================

  //master maintenance type
  static String maintenanceType = baseUrl + "maintenance-item/";

  //===============================================================

  //master inventory item
  static String inventoryItem = baseUrl + "inventory/item/";

  //===============================================================
  
  //master check atau inspeksi
  static String check = baseUrl + "check/";

  //master cek km
  static String updateKilometer = baseUrl + "odometer/";

  //===============================================================

  //pengisian bbm
  static String refueling = baseUrl + "refueling/";
  static String refuelingSummary = baseUrl + "refueling/summary";

  //===============================================================

  //sebarang kendaraan
  static String sebaranKendaraan = baseUrl + "vehicle/chart/";

  //===============================================================

  //upload
  static String uploadImage = baseUrl + "upload/image/";
}
