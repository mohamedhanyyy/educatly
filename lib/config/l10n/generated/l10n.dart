// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Seconds`
  String get seconds {
    return Intl.message(
      'Seconds',
      name: 'seconds',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Taskaty`
  String get app_name {
    return Intl.message(
      'Taskaty',
      name: 'app_name',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get welcome {
    return Intl.message(
      'Welcome',
      name: 'welcome',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Hany`
  String get hany {
    return Intl.message(
      'Hany',
      name: 'hany',
      desc: '',
      args: [],
    );
  }

  /// `Add`
  String get add {
    return Intl.message(
      'Add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `In progress tasks`
  String get in_progress_tasks {
    return Intl.message(
      'In progress tasks',
      name: 'in_progress_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Write section name`
  String get write_section_name {
    return Intl.message(
      'Write section name',
      name: 'write_section_name',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get logout {
    return Intl.message(
      'Logout',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Write assigne to`
  String get write_assigne_to {
    return Intl.message(
      'Write assigne to',
      name: 'write_assigne_to',
      desc: '',
      args: [],
    );
  }

  /// `Subtask details`
  String get sub_task_details {
    return Intl.message(
      'Subtask details',
      name: 'sub_task_details',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `User image`
  String get user_image {
    return Intl.message(
      'User image',
      name: 'user_image',
      desc: '',
      args: [],
    );
  }

  /// `App language`
  String get app_lang {
    return Intl.message(
      'App language',
      name: 'app_lang',
      desc: '',
      args: [],
    );
  }

  /// `Edit name`
  String get edit_name {
    return Intl.message(
      'Edit name',
      name: 'edit_name',
      desc: '',
      args: [],
    );
  }

  /// `User name`
  String get username {
    return Intl.message(
      'User name',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Dark mode`
  String get dark_mood {
    return Intl.message(
      'Dark mode',
      name: 'dark_mood',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Task deleted successfully`
  String get task_deleted_successfully {
    return Intl.message(
      'Task deleted successfully',
      name: 'task_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Check your email`
  String get otp {
    return Intl.message(
      'Check your email',
      name: 'otp',
      desc: '',
      args: [],
    );
  }

  /// `Resend otp`
  String get resend_otp {
    return Intl.message(
      'Resend otp',
      name: 'resend_otp',
      desc: '',
      args: [],
    );
  }

  /// `App settings`
  String get app_settings {
    return Intl.message(
      'App settings',
      name: 'app_settings',
      desc: '',
      args: [],
    );
  }

  /// `Edit mobile`
  String get edit_mobile {
    return Intl.message(
      'Edit mobile',
      name: 'edit_mobile',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacy_policy {
    return Intl.message(
      'Privacy policy',
      name: 'privacy_policy',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile picture`
  String get edit_avatar {
    return Intl.message(
      'Edit profile picture',
      name: 'edit_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Personal information`
  String get personal_info {
    return Intl.message(
      'Personal information',
      name: 'personal_info',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile information`
  String get edit_profile {
    return Intl.message(
      'Edit profile information',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit username`
  String get edit_username {
    return Intl.message(
      'Edit username',
      name: 'edit_username',
      desc: '',
      args: [],
    );
  }

  /// `New password`
  String get new_password {
    return Intl.message(
      'New password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `Update password`
  String get update_password {
    return Intl.message(
      'Update password',
      name: 'update_password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get change_password {
    return Intl.message(
      'Change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Edit email`
  String get edit_email {
    return Intl.message(
      'Edit email',
      name: 'edit_email',
      desc: '',
      args: [],
    );
  }

  /// `Resend otp in`
  String get resend_otp_to {
    return Intl.message(
      'Resend otp in',
      name: 'resend_otp_to',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number is not valid`
  String get phone_not_valid {
    return Intl.message(
      'Mobile number is not valid',
      name: 'phone_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Username is too long`
  String get name_long_warning {
    return Intl.message(
      'Username is too long',
      name: 'name_long_warning',
      desc: '',
      args: [],
    );
  }

  /// `Username is too short`
  String get name_short_warning {
    return Intl.message(
      'Username is too short',
      name: 'name_short_warning',
      desc: '',
      args: [],
    );
  }

  /// `Current password`
  String get current_password {
    return Intl.message(
      'Current password',
      name: 'current_password',
      desc: '',
      args: [],
    );
  }

  /// `Login to your account`
  String get login_desc {
    return Intl.message(
      'Login to your account',
      name: 'login_desc',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirm_new_password {
    return Intl.message(
      'Confirm new password',
      name: 'confirm_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Username is not valid`
  String get username_not_valid {
    return Intl.message(
      'Username is not valid',
      name: 'username_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get email_not_valid {
    return Intl.message(
      'Email is not valid',
      name: 'email_not_valid',
      desc: '',
      args: [],
    );
  }

  /// `Create new password`
  String get create_new_password {
    return Intl.message(
      'Create new password',
      name: 'create_new_password',
      desc: '',
      args: [],
    );
  }

  /// `Password is incorrect`
  String get wrong_password_warning {
    return Intl.message(
      'Password is incorrect',
      name: 'wrong_password_warning',
      desc: '',
      args: [],
    );
  }

  /// `We have sended the 4 number otp to`
  String get otp_send_to {
    return Intl.message(
      'We have sended the 4 number otp to',
      name: 'otp_send_to',
      desc: '',
      args: [],
    );
  }

  /// `This field can't be empty`
  String get text_field_empty_warning {
    return Intl.message(
      'This field can\'t be empty',
      name: 'text_field_empty_warning',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout from your account?`
  String get logout_desc {
    return Intl.message(
      'Are you sure you want to logout from your account?',
      name: 'logout_desc',
      desc: '',
      args: [],
    );
  }

  /// `password doesn't match the new password`
  String get password_no_match_new {
    return Intl.message(
      'password doesn\'t match the new password',
      name: 'password_no_match_new',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email to get \n the information you need to reset your password`
  String get forget_description {
    return Intl.message(
      'Please enter your email to get \n the information you need to reset your password',
      name: 'forget_description',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must not be match your current password`
  String get new_password_should_no_match_current {
    return Intl.message(
      'Your new password must not be match your current password',
      name: 'new_password_should_no_match_current',
      desc: '',
      args: [],
    );
  }

  /// `Your new password must be different from your current password`
  String get create_new_password_desc {
    return Intl.message(
      'Your new password must be different from your current password',
      name: 'create_new_password_desc',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Now`
  String get now {
    return Intl.message(
      'Now',
      name: 'now',
      desc: '',
      args: [],
    );
  }

  /// `Ago`
  String get ago {
    return Intl.message(
      'Ago',
      name: 'ago',
      desc: '',
      args: [],
    );
  }

  /// `Minutes ago`
  String get minutes_ago {
    return Intl.message(
      'Minutes ago',
      name: 'minutes_ago',
      desc: '',
      args: [],
    );
  }

  /// `Hours ago`
  String get hours_ago {
    return Intl.message(
      'Hours ago',
      name: 'hours_ago',
      desc: '',
      args: [],
    );
  }

  /// `Yesterday`
  String get yesterday {
    return Intl.message(
      'Yesterday',
      name: 'yesterday',
      desc: '',
      args: [],
    );
  }

  /// `Days ago`
  String get days_ago {
    return Intl.message(
      'Days ago',
      name: 'days_ago',
      desc: '',
      args: [],
    );
  }

  /// `Last week`
  String get last_week {
    return Intl.message(
      'Last week',
      name: 'last_week',
      desc: '',
      args: [],
    );
  }

  /// `Weeks ago`
  String get weeks_ago {
    return Intl.message(
      'Weeks ago',
      name: 'weeks_ago',
      desc: '',
      args: [],
    );
  }

  /// `Last month`
  String get last_month {
    return Intl.message(
      'Last month',
      name: 'last_month',
      desc: '',
      args: [],
    );
  }

  /// `Months ago`
  String get months_ago {
    return Intl.message(
      'Months ago',
      name: 'months_ago',
      desc: '',
      args: [],
    );
  }

  /// `Last year`
  String get last_year {
    return Intl.message(
      'Last year',
      name: 'last_year',
      desc: '',
      args: [],
    );
  }

  /// `Years ago`
  String get years_ago {
    return Intl.message(
      'Years ago',
      name: 'years_ago',
      desc: '',
      args: [],
    );
  }

  /// `Invalid date`
  String get invalid_date {
    return Intl.message(
      'Invalid date',
      name: 'invalid_date',
      desc: '',
      args: [],
    );
  }

  /// `in`
  String get in_date {
    return Intl.message(
      'in',
      name: 'in_date',
      desc: '',
      args: [],
    );
  }

  /// `Minutes`
  String get minutes {
    return Intl.message(
      'Minutes',
      name: 'minutes',
      desc: '',
      args: [],
    );
  }

  /// `Hours`
  String get hours {
    return Intl.message(
      'Hours',
      name: 'hours',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get tomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message(
      'Days',
      name: 'days',
      desc: '',
      args: [],
    );
  }

  /// `Next week`
  String get next_week {
    return Intl.message(
      'Next week',
      name: 'next_week',
      desc: '',
      args: [],
    );
  }

  /// `Weeks`
  String get weeks {
    return Intl.message(
      'Weeks',
      name: 'weeks',
      desc: '',
      args: [],
    );
  }

  /// `Next month`
  String get next_month {
    return Intl.message(
      'Next month',
      name: 'next_month',
      desc: '',
      args: [],
    );
  }

  /// `Months`
  String get months {
    return Intl.message(
      'Months',
      name: 'months',
      desc: '',
      args: [],
    );
  }

  /// `Next year`
  String get next_year {
    return Intl.message(
      'Next year',
      name: 'next_year',
      desc: '',
      args: [],
    );
  }

  /// `Years`
  String get years {
    return Intl.message(
      'Years',
      name: 'years',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Add new task`
  String get add_new_task {
    return Intl.message(
      'Add new task',
      name: 'add_new_task',
      desc: '',
      args: [],
    );
  }

  /// `Task title`
  String get task_title {
    return Intl.message(
      'Task title',
      name: 'task_title',
      desc: '',
      args: [],
    );
  }

  /// `Start date`
  String get start_date {
    return Intl.message(
      'Start date',
      name: 'start_date',
      desc: '',
      args: [],
    );
  }

  /// `End date`
  String get end_date {
    return Intl.message(
      'End date',
      name: 'end_date',
      desc: '',
      args: [],
    );
  }

  /// `Priority`
  String get priority {
    return Intl.message(
      'Priority',
      name: 'priority',
      desc: '',
      args: [],
    );
  }

  /// `Company name`
  String get company_name {
    return Intl.message(
      'Company name',
      name: 'company_name',
      desc: '',
      args: [],
    );
  }

  /// `Section name`
  String get section_name {
    return Intl.message(
      'Section name',
      name: 'section_name',
      desc: '',
      args: [],
    );
  }

  /// `Assigne to`
  String get assignee_to {
    return Intl.message(
      'Assigne to',
      name: 'assignee_to',
      desc: '',
      args: [],
    );
  }

  /// `Adding subtask`
  String get adding_subtask {
    return Intl.message(
      'Adding subtask',
      name: 'adding_subtask',
      desc: '',
      args: [],
    );
  }

  /// `Add subtask`
  String get add_subtask {
    return Intl.message(
      'Add subtask',
      name: 'add_subtask',
      desc: '',
      args: [],
    );
  }

  /// `Add document`
  String get add_document {
    return Intl.message(
      'Add document',
      name: 'add_document',
      desc: '',
      args: [],
    );
  }

  /// `Task details`
  String get task_details {
    return Intl.message(
      'Task details',
      name: 'task_details',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message(
      'Save',
      name: 'save',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get low {
    return Intl.message(
      'Low',
      name: 'low',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get medium {
    return Intl.message(
      'Medium',
      name: 'medium',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get high {
    return Intl.message(
      'High',
      name: 'high',
      desc: '',
      args: [],
    );
  }

  /// `End date must be after start date`
  String get end_date_must_be_after_start_date {
    return Intl.message(
      'End date must be after start date',
      name: 'end_date_must_be_after_start_date',
      desc: '',
      args: [],
    );
  }

  /// `Task added successfully`
  String get task_added_successfully {
    return Intl.message(
      'Task added successfully',
      name: 'task_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Write emplyee name`
  String get write_employee_name {
    return Intl.message(
      'Write emplyee name',
      name: 'write_employee_name',
      desc: '',
      args: [],
    );
  }

  /// `Priority required`
  String get priority_required {
    return Intl.message(
      'Priority required',
      name: 'priority_required',
      desc: '',
      args: [],
    );
  }

  /// `Company name required`
  String get company_name_required {
    return Intl.message(
      'Company name required',
      name: 'company_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Section name required`
  String get section_name_required {
    return Intl.message(
      'Section name required',
      name: 'section_name_required',
      desc: '',
      args: [],
    );
  }

  /// `Assignee to required`
  String get assignee_to_required {
    return Intl.message(
      'Assignee to required',
      name: 'assignee_to_required',
      desc: '',
      args: [],
    );
  }

  /// `Tasks required`
  String get tasks_required {
    return Intl.message(
      'Tasks required',
      name: 'tasks_required',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message(
      'Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `No`
  String get no {
    return Intl.message(
      'No',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to delete task?`
  String get do_you_want_to_delete_task {
    return Intl.message(
      'Do you want to delete task?',
      name: 'do_you_want_to_delete_task',
      desc: '',
      args: [],
    );
  }

  /// `Task edited successfully!`
  String get task_edited_successfully {
    return Intl.message(
      'Task edited successfully!',
      name: 'task_edited_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Okay`
  String get okay {
    return Intl.message(
      'Okay',
      name: 'okay',
      desc: '',
      args: [],
    );
  }

  /// `Select priority`
  String get select_priority {
    return Intl.message(
      'Select priority',
      name: 'select_priority',
      desc: '',
      args: [],
    );
  }

  /// `Select assigne`
  String get select_assignee {
    return Intl.message(
      'Select assigne',
      name: 'select_assignee',
      desc: '',
      args: [],
    );
  }

  /// `Select section name`
  String get select_section_name {
    return Intl.message(
      'Select section name',
      name: 'select_section_name',
      desc: '',
      args: [],
    );
  }

  /// `Select company name`
  String get select_company_name {
    return Intl.message(
      'Select company name',
      name: 'select_company_name',
      desc: '',
      args: [],
    );
  }

  /// `Task already added`
  String get task_already_added {
    return Intl.message(
      'Task already added',
      name: 'task_already_added',
      desc: '',
      args: [],
    );
  }

  /// `Subtasks empty`
  String get subtasks_empty {
    return Intl.message(
      'Subtasks empty',
      name: 'subtasks_empty',
      desc: '',
      args: [],
    );
  }

  /// `Password confirmation`
  String get password_confirmation {
    return Intl.message(
      'Password confirmation',
      name: 'password_confirmation',
      desc: '',
      args: [],
    );
  }

  /// `New password confirmation`
  String get new_password_confirm {
    return Intl.message(
      'New password confirmation',
      name: 'new_password_confirm',
      desc: '',
      args: [],
    );
  }

  /// `Old password`
  String get old_password {
    return Intl.message(
      'Old password',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `Passwords don/'t match`
  String get passwords_doesnt_match {
    return Intl.message(
      'Passwords don/\'t match',
      name: 'passwords_doesnt_match',
      desc: '',
      args: [],
    );
  }

  /// `System admin`
  String get system_admin {
    return Intl.message(
      'System admin',
      name: 'system_admin',
      desc: '',
      args: [],
    );
  }

  /// `User type`
  String get user_type {
    return Intl.message(
      'User type',
      name: 'user_type',
      desc: '',
      args: [],
    );
  }

  /// `Add user`
  String get add_user {
    return Intl.message(
      'Add user',
      name: 'add_user',
      desc: '',
      args: [],
    );
  }

  /// `Task assign`
  String get task_assign {
    return Intl.message(
      'Task assign',
      name: 'task_assign',
      desc: '',
      args: [],
    );
  }

  /// `Full name`
  String get full_name {
    return Intl.message(
      'Full name',
      name: 'full_name',
      desc: '',
      args: [],
    );
  }

  /// `Admin`
  String get admin {
    return Intl.message(
      'Admin',
      name: 'admin',
      desc: '',
      args: [],
    );
  }

  /// `High`
  String get priority_0 {
    return Intl.message(
      'High',
      name: 'priority_0',
      desc: '',
      args: [],
    );
  }

  /// `Medium`
  String get priority_1 {
    return Intl.message(
      'Medium',
      name: 'priority_1',
      desc: '',
      args: [],
    );
  }

  /// `Low`
  String get priority_2 {
    return Intl.message(
      'Low',
      name: 'priority_2',
      desc: '',
      args: [],
    );
  }

  /// `System admin`
  String get super_admin {
    return Intl.message(
      'System admin',
      name: 'super_admin',
      desc: '',
      args: [],
    );
  }

  /// `Empty password`
  String get empty_password {
    return Intl.message(
      'Empty password',
      name: 'empty_password',
      desc: '',
      args: [],
    );
  }

  /// `Too short password`
  String get too_short_password {
    return Intl.message(
      'Too short password',
      name: 'too_short_password',
      desc: '',
      args: [],
    );
  }

  /// `Uppercase letter is missing`
  String get missing_uppercase {
    return Intl.message(
      'Uppercase letter is missing',
      name: 'missing_uppercase',
      desc: '',
      args: [],
    );
  }

  /// `Lowercase letter is missing`
  String get missing_lowercase {
    return Intl.message(
      'Lowercase letter is missing',
      name: 'missing_lowercase',
      desc: '',
      args: [],
    );
  }

  /// `Digit is missing`
  String get missingDigit {
    return Intl.message(
      'Digit is missing',
      name: 'missingDigit',
      desc: '',
      args: [],
    );
  }

  /// `Special character @ _ is missing`
  String get missingSpecialChar {
    return Intl.message(
      'Special character @ _ is missing',
      name: 'missingSpecialChar',
      desc: '',
      args: [],
    );
  }

  /// `Arabic company name`
  String get company_arabic_name {
    return Intl.message(
      'Arabic company name',
      name: 'company_arabic_name',
      desc: '',
      args: [],
    );
  }

  /// `English company name`
  String get company_english_name {
    return Intl.message(
      'English company name',
      name: 'company_english_name',
      desc: '',
      args: [],
    );
  }

  /// `Company address`
  String get company_address {
    return Intl.message(
      'Company address',
      name: 'company_address',
      desc: '',
      args: [],
    );
  }

  /// `Add company`
  String get add_company {
    return Intl.message(
      'Add company',
      name: 'add_company',
      desc: '',
      args: [],
    );
  }

  /// `All tasks`
  String get all_tasks {
    return Intl.message(
      'All tasks',
      name: 'all_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Companies`
  String get companies {
    return Intl.message(
      'Companies',
      name: 'companies',
      desc: '',
      args: [],
    );
  }

  /// `Task name`
  String get task_name {
    return Intl.message(
      'Task name',
      name: 'task_name',
      desc: '',
      args: [],
    );
  }

  /// `Search by task name...`
  String get search_by_task_name {
    return Intl.message(
      'Search by task name...',
      name: 'search_by_task_name',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Add logo`
  String get add_logo {
    return Intl.message(
      'Add logo',
      name: 'add_logo',
      desc: '',
      args: [],
    );
  }

  /// `All Companies`
  String get all_companies {
    return Intl.message(
      'All Companies',
      name: 'all_companies',
      desc: '',
      args: [],
    );
  }

  /// `Completed Tasks`
  String get completed_tasks {
    return Intl.message(
      'Completed Tasks',
      name: 'completed_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Manager`
  String get manager {
    return Intl.message(
      'Manager',
      name: 'manager',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Not completed`
  String get not_completed {
    return Intl.message(
      'Not completed',
      name: 'not_completed',
      desc: '',
      args: [],
    );
  }

  /// `In progress`
  String get in_progress {
    return Intl.message(
      'In progress',
      name: 'in_progress',
      desc: '',
      args: [],
    );
  }

  /// `End task`
  String get end_task {
    return Intl.message(
      'End task',
      name: 'end_task',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Tasks`
  String get tasks {
    return Intl.message(
      'Tasks',
      name: 'tasks',
      desc: '',
      args: [],
    );
  }

  /// `Managers`
  String get managers {
    return Intl.message(
      'Managers',
      name: 'managers',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `In-completed`
  String get in_completed {
    return Intl.message(
      'In-completed',
      name: 'in_completed',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Editing subtask`
  String get editing_subtask {
    return Intl.message(
      'Editing subtask',
      name: 'editing_subtask',
      desc: '',
      args: [],
    );
  }

  /// `Edit task`
  String get edit_task {
    return Intl.message(
      'Edit task',
      name: 'edit_task',
      desc: '',
      args: [],
    );
  }

  /// `Edit task title`
  String get edit_task_title {
    return Intl.message(
      'Edit task title',
      name: 'edit_task_title',
      desc: '',
      args: [],
    );
  }

  /// `Edit task details`
  String get edit_task_details {
    return Intl.message(
      'Edit task details',
      name: 'edit_task_details',
      desc: '',
      args: [],
    );
  }

  /// `Edit subtask`
  String get edit_subtask {
    return Intl.message(
      'Edit subtask',
      name: 'edit_subtask',
      desc: '',
      args: [],
    );
  }

  /// `Task description:`
  String get task_description {
    return Intl.message(
      'Task description:',
      name: 'task_description',
      desc: '',
      args: [],
    );
  }

  /// `Documents`
  String get documents {
    return Intl.message(
      'Documents',
      name: 'documents',
      desc: '',
      args: [],
    );
  }

  /// `Subtasks`
  String get subtasks {
    return Intl.message(
      'Subtasks',
      name: 'subtasks',
      desc: '',
      args: [],
    );
  }

  /// `New`
  String get neww {
    return Intl.message(
      'New',
      name: 'neww',
      desc: '',
      args: [],
    );
  }

  /// `Tasts status`
  String get tasks_status {
    return Intl.message(
      'Tasts status',
      name: 'tasks_status',
      desc: '',
      args: [],
    );
  }

  /// `All managers`
  String get all_managers {
    return Intl.message(
      'All managers',
      name: 'all_managers',
      desc: '',
      args: [],
    );
  }

  /// `Manager name`
  String get manager_name {
    return Intl.message(
      'Manager name',
      name: 'manager_name',
      desc: '',
      args: [],
    );
  }

  /// `User deleted successfully`
  String get user_deleted_successfully {
    return Intl.message(
      'User deleted successfully',
      name: 'user_deleted_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Add super admin`
  String get add_super_admin {
    return Intl.message(
      'Add super admin',
      name: 'add_super_admin',
      desc: '',
      args: [],
    );
  }

  /// `Subtasks ( Click to change status )`
  String get subtasks_click_to_select {
    return Intl.message(
      'Subtasks ( Click to change status )',
      name: 'subtasks_click_to_select',
      desc: '',
      args: [],
    );
  }

  /// `Two weeks ago`
  String get two_weeks_ago {
    return Intl.message(
      'Two weeks ago',
      name: 'two_weeks_ago',
      desc: '',
      args: [],
    );
  }

  /// `User added successfully`
  String get user_added_successfully {
    return Intl.message(
      'User added successfully',
      name: 'user_added_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Login again`
  String get login_again {
    return Intl.message(
      'Login again',
      name: 'login_again',
      desc: '',
      args: [],
    );
  }

  /// `New email`
  String get new_email {
    return Intl.message(
      'New email',
      name: 'new_email',
      desc: '',
      args: [],
    );
  }

  /// `No notifications right now`
  String get no_notifications_right_now {
    return Intl.message(
      'No notifications right now',
      name: 'no_notifications_right_now',
      desc: '',
      args: [],
    );
  }

  /// `Status`
  String get status {
    return Intl.message(
      'Status',
      name: 'status',
      desc: '',
      args: [],
    );
  }

  /// `Two days ago`
  String get two_days_ago {
    return Intl.message(
      'Two days ago',
      name: 'two_days_ago',
      desc: '',
      args: [],
    );
  }

  /// `Add comment`
  String get add_comment {
    return Intl.message(
      'Add comment',
      name: 'add_comment',
      desc: '',
      args: [],
    );
  }

  /// `This comment is empty`
  String get comment_is_empty {
    return Intl.message(
      'This comment is empty',
      name: 'comment_is_empty',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// `Comment`
  String get comment {
    return Intl.message(
      'Comment',
      name: 'comment',
      desc: '',
      args: [],
    );
  }

  /// `Write a comment`
  String get write_comment {
    return Intl.message(
      'Write a comment',
      name: 'write_comment',
      desc: '',
      args: [],
    );
  }

  /// `Title must contain two words at least`
  String get title_must_contain_two_words_at_least {
    return Intl.message(
      'Title must contain two words at least',
      name: 'title_must_contain_two_words_at_least',
      desc: '',
      args: [],
    );
  }

  /// `Subtask must be al least three words`
  String get subTask_must_be_at_least_three_words {
    return Intl.message(
      'Subtask must be al least three words',
      name: 'subTask_must_be_at_least_three_words',
      desc: '',
      args: [],
    );
  }

  /// `Refresh`
  String get refresh {
    return Intl.message(
      'Refresh',
      name: 'refresh',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong !`
  String get something_went_wrong {
    return Intl.message(
      'Something went wrong !',
      name: 'something_went_wrong',
      desc: '',
      args: [],
    );
  }

  /// `Editing / adding subtask`
  String get editing_adding_subtask {
    return Intl.message(
      'Editing / adding subtask',
      name: 'editing_adding_subtask',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message(
      'Reset',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `Filter reset done`
  String get filter_reset {
    return Intl.message(
      'Filter reset done',
      name: 'filter_reset',
      desc: '',
      args: [],
    );
  }

  /// `select start date first`
  String get select_first_date {
    return Intl.message(
      'select start date first',
      name: 'select_first_date',
      desc: '',
      args: [],
    );
  }

  /// `Task duration must be at least three hours`
  String get duration_must_be_at_least_three_hours {
    return Intl.message(
      'Task duration must be at least three hours',
      name: 'duration_must_be_at_least_three_hours',
      desc: '',
      args: [],
    );
  }

  /// `Filter`
  String get filter {
    return Intl.message(
      'Filter',
      name: 'filter',
      desc: '',
      args: [],
    );
  }

  /// `No tasks try again !`
  String get no_tasks {
    return Intl.message(
      'No tasks try again !',
      name: 'no_tasks',
      desc: '',
      args: [],
    );
  }

  /// `Completed`
  String get completed {
    return Intl.message(
      'Completed',
      name: 'completed',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
