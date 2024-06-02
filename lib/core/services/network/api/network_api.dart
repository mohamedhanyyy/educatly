class Api {
  //base Url
  static String mainAppUrl = "https://taskaty.azurewebsites.net/api/";

  /// Auth
  static const String login = "Authentication/Login";
  static const String verifyOtp = "Authentication/VerifyOtp";
  static const String resetPassword = "Authentication/ResetPassword";
  static const String forgetPassword = "Authentication/ForgetPassword";
  static const String createPassword = "Authentication/ResetPassword";
  static const String resendOtp = "Authentication/ResendVerificationCode";

  /// Pages
  static const String privacyPolicy = "PrivacyPolicy";
  static const String statistics = "StatisticsTasks";

  ///Task
  static const String registerUser = "ManagementUser/Register/registeration";
  static const String updateSubTask = "Tasks/UpdateSubTasksStatus";

  /// Edit Profile
  static const String updateProfile = "Authentication/Profile";
  static const String changePassword = "Authentication/ChangePassword";

  static const String getCompany = "Companies/GetAllWithCountTasks";
  static const String managers = "Managers";

  static const String addTask = "Tasks/Add";
  static const String updateTask = "Tasks/Update";
  static const String getAdminTasks = "Tasks/GetAll";
  static const String tasks = "Tasks";
  static const String addCompany = "Companies/Add";
  static const String getManagers = "ManagementUser/GetAll";
  static const String deleteUser = "ManagementUser/DeleteUser";
  static const String deleteTask = "Tasks/Delete";
  static const String editCompany = "Companies/Edit";
}
