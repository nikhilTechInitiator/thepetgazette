class AppUserModel {
  int? id;
  String? name;
  String? fname;
  String? lname;
  String? email;
  String? username;
  String? dob;
  String? age;
  String? userRole;
  int? parentId;
  String? profileImages;
  String? coverImg;
  String? phone;
  String? street;
  String? city;
  String? state;
  String? zipCode;
  String? bioData;
  int? planId;
  String? startDate;
  String? endDate;
  String? nextBillingDate;
  String? subscriptionStatus;
  int? duration;
  int? lessonCount;
  int? gradingCounts;
  int? transactionId;
  int? isActive;
  int? isReject;
  int? isFinishTest;
  String? brandingId;
  String? testUser;
  String? createdAt;
  String? updatedAt;
  String? timezone;
  String? loginDate;
  String? logoutDate;
  int? approvedByFk;
  int? learnersPermit;
  String? branchIdFk;
  String? instructorId;
  String? braintreeId;
  String? paypalEmail;
  String? cardBrand;
  int? cardLastFour;
  String? trialEndsAt;
  int? emailVerify;
  String? notifyType;
  String? addedBy;

  AppUserModel(
      {this.id,
      this.name,
      this.fname,
      this.lname,
      this.email,
      this.username,
      this.dob,
      this.age,
      this.userRole,
      this.parentId,
      this.profileImages,
      this.coverImg,
      this.phone,
      this.street,
      this.city,
      this.state,
      this.zipCode,
      this.bioData,
      this.planId,
      this.startDate,
      this.endDate,
      this.nextBillingDate,
      this.subscriptionStatus,
      this.duration,
      this.lessonCount,
      this.gradingCounts,
      this.transactionId,
      this.isActive,
      this.isReject,
      this.isFinishTest,
      this.brandingId,
      this.testUser,
      this.createdAt,
      this.updatedAt,
      this.timezone,
      this.loginDate,
      this.logoutDate,
      this.approvedByFk,
      this.learnersPermit,
      this.branchIdFk,
      this.instructorId,
      this.braintreeId,
      this.paypalEmail,
      this.cardBrand,
      this.cardLastFour,
      this.trialEndsAt,
      this.emailVerify,
      this.notifyType,
      this.addedBy});

  AppUserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    username = json['username'];
    dob = json['dob'];
    age = json['age'];
    userRole = json['user_role'];
    parentId = json['parent_id'];
    profileImages = json['profile_images'];
    coverImg = json['cover_img'];
    phone = json['phone'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    bioData = json['bio_data'];
    planId = json['plan_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    nextBillingDate = json['next_billing_date'];
    subscriptionStatus = json['subscription_status'];
    duration = json['duration'];
    lessonCount = json['lesson_count'];
    gradingCounts = json['grading_counts'];
    transactionId = json['transaction_id'];
    isActive = json['is_active'];
    isReject = json['is_reject'];
    isFinishTest = json['is_finish_test'];
    brandingId = json['branding_id'];
    testUser = json['test_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    timezone = json['timezone'];
    loginDate = json['login_date'];
    logoutDate = json['logout_date'];
    approvedByFk = json['approved_by_fk'];
    learnersPermit = json['learners_permit'];
    branchIdFk = json['branch_id_fk'];
    instructorId = json['instructor_id'];
    braintreeId = json['braintree_id'];
    paypalEmail = json['paypal_email'];
    cardBrand = json['card_brand'];
    cardLastFour = json['card_last_four'];
    trialEndsAt = json['trial_ends_at'];
    emailVerify = json['email_verify'];
    notifyType = json['notify_type'];
    addedBy = json['added_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['username'] = this.username;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['user_role'] = this.userRole;
    data['parent_id'] = this.parentId;
    data['profile_images'] = this.profileImages;
    data['cover_img'] = this.coverImg;
    data['phone'] = this.phone;
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['bio_data'] = this.bioData;
    data['plan_id'] = this.planId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['next_billing_date'] = this.nextBillingDate;
    data['subscription_status'] = this.subscriptionStatus;
    data['duration'] = this.duration;
    data['lesson_count'] = this.lessonCount;
    data['grading_counts'] = this.gradingCounts;
    data['transaction_id'] = this.transactionId;
    data['is_active'] = this.isActive;
    data['is_reject'] = this.isReject;
    data['is_finish_test'] = this.isFinishTest;
    data['branding_id'] = this.brandingId;
    data['test_user'] = this.testUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['timezone'] = this.timezone;
    data['login_date'] = this.loginDate;
    data['logout_date'] = this.logoutDate;
    data['approved_by_fk'] = this.approvedByFk;
    data['learners_permit'] = this.learnersPermit;
    data['branch_id_fk'] = this.branchIdFk;
    data['instructor_id'] = this.instructorId;
    data['braintree_id'] = this.braintreeId;
    data['paypal_email'] = this.paypalEmail;
    data['card_brand'] = this.cardBrand;
    data['card_last_four'] = this.cardLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['email_verify'] = this.emailVerify;
    data['notify_type'] = this.notifyType;
    data['added_by'] = this.addedBy;
    return data;
  }
}

class UserModel {
  int? id;
  String? name;
  String? fullName;
  String? fname;
  String? lname;
  String? email;
  String? username;
  String? dob;
  String? age;
  String? userRole;
  int? parentId;
  String? profileImages;
  String? coverImg;
  String? phone;
  String? street;
  String? city;
  String? state;
  String? zipCode;
  String? bioData;
  String? branchId;
  int? planId;
  String? startDate;
  String? endDate;
  String? nextBillingDate;
  String? subscriptionStatus;
  int? duration;
  int? lessonCount;
  int? gradingCounts;
  int? transactionId;
  bool? isActive;
  int? isReject;
  int? isFinishTest;
  String? brandingId;
  String? branchName;
  String? testUser;
  String? createdAt;
  String? updatedAt;
  String? timezone;
  String? loginDate;
  String? logoutDate;
  int? approvedByFk;
  String? learnersPermit;
  String? branchIdFk;
  String? instructorId;
  String? braintreeId;
  String? paypalEmail;
  String? cardBrand;
  int? cardLastFour;
  String? trialEndsAt;
  int? emailVerify;
  String? notifyType;
  String? addedBy;
  String? instructorsName;
  InstructorDocs? instructorDocs;
  ParentInfo? parentInfo;
  List<Branch>? selectedBranchList;

  UserModel(
      {this.id,
      this.name,
      this.fullName,
      this.fname,
      this.lname,
      this.email,
      this.username,
      this.dob,
      this.age,
      this.userRole,
      this.parentId,
      this.profileImages,
      this.coverImg,
      this.phone,
      this.street,
      this.city,
      this.state,
      this.zipCode,
      this.bioData,
      this.branchId,
      this.planId,
      this.startDate,
      this.endDate,
      this.nextBillingDate,
      this.subscriptionStatus,
      this.duration,
      this.lessonCount,
      this.gradingCounts,
      this.transactionId,
      this.isActive,
      this.isReject,
      this.isFinishTest,
      this.brandingId,
      this.testUser,
      this.createdAt,
      this.updatedAt,
      this.timezone,
      this.loginDate,
      this.logoutDate,
      this.approvedByFk,
      this.learnersPermit,
      this.branchIdFk,
      this.instructorId,
      this.braintreeId,
      this.paypalEmail,
      this.cardBrand,
      this.cardLastFour,
      this.trialEndsAt,
      this.emailVerify,
      this.notifyType,
      this.addedBy,
      this.instructorsName,
      this.instructorDocs,
      this.parentInfo,
      this.branchName,
      this.selectedBranchList});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json['id'] != null) {
      id = json['id'];
    } else if (json['user_id'] != null) {
      id = int.parse(json['user_id']);
    }
    name = json['name'];
    fullName = json['fullname'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    username = json['username'];
    dob = json['dob'];
    age = json['age'];
    userRole = json['user_role'];
    parentId = json['parent_id'];
    if (json['profile_images'] != null) {
      profileImages = json['profile_images'];
    } else if (json['profile_image'] != null) {
      profileImages = json['profile_image'];
    }
    coverImg = json['cover_img'];
    phone = json['phone'];
    street = json['street'];
    city = json['city'];
    state = json['state'];
    zipCode = json['zip_code'];
    bioData = json['bio_data'];
    branchId = json['branch_id'];
    planId = json['plan_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    nextBillingDate = json['next_billing_date'];
    subscriptionStatus = json['subscription_status'];
    duration = json['duration'];
    lessonCount = json['lesson_count'];
    gradingCounts = json['grading_counts'];
    transactionId = json['transaction_id'];
    isActive = json['is_active'];
    isReject = json['is_reject'];
    isFinishTest = json['is_finish_test'];
    brandingId = json['branding_id'];
    testUser = json['test_user'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    timezone = json['timezone'];
    loginDate = json['login_date'];
    logoutDate = json['logout_date'];
    approvedByFk = json['approved_by_fk'];
    learnersPermit = json['learners_permit'];
    branchIdFk = json['branch_id_fk'];
    if (json['instructor_ids'] != null) {
      instructorId = json['instructor_ids'];
    } else {
      instructorId = json['instructor_id'];
    }

    braintreeId = json['braintree_id'];
    paypalEmail = json['paypal_email'];
    cardBrand = json['card_brand'];

    cardLastFour = json['card_last_four'];
    trialEndsAt = json['trial_ends_at'];
    emailVerify = json['email_verify'];
    notifyType = json['notify_type'];
    addedBy = json['added_by'];
    branchName = json['branch_name'];
    instructorsName = json['instructors_name'];
    instructorDocs = json['instructor_docs'] != null
        ? new InstructorDocs.fromJson(json['instructor_docs'])
        : null;
    parentInfo = json['parent_info'] != null
        ? new ParentInfo.fromJson(json['parent_info'])
        : null;
    if (json['branch_data'] != null && json['branch_data'] != "No info") {
      selectedBranchList = <Branch>[];
      json['branch_data'].forEach((v) {
        selectedBranchList!.add(Branch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['fullname'] = this.fullName;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['username'] = this.username;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['user_role'] = this.userRole;
    data['parent_id'] = this.parentId;
    data['profile_images'] = this.profileImages;
    data['cover_img'] = this.coverImg;
    data['phone'] = this.phone;
    data['street'] = this.street;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip_code'] = this.zipCode;
    data['bio_data'] = this.bioData;
    data['plan_id'] = this.planId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['next_billing_date'] = this.nextBillingDate;
    data['subscription_status'] = this.subscriptionStatus;
    data['duration'] = this.duration;
    data['lesson_count'] = this.lessonCount;
    data['grading_counts'] = this.gradingCounts;
    data['transaction_id'] = this.transactionId;
    data['is_active'] = this.isActive;
    data['is_reject'] = this.isReject;
    data['is_finish_test'] = this.isFinishTest;
    data['branding_id'] = this.brandingId;
    data['test_user'] = this.testUser;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['timezone'] = this.timezone;
    data['login_date'] = this.loginDate;
    data['logout_date'] = this.logoutDate;
    data['approved_by_fk'] = this.approvedByFk;
    data['learners_permit'] = this.learnersPermit;
    data['branch_id_fk'] = this.branchIdFk;
    data['instructor_id'] = this.instructorId;
    data['braintree_id'] = this.braintreeId;
    data['paypal_email'] = this.paypalEmail;
    data['card_brand'] = this.cardBrand;
    data['card_last_four'] = this.cardLastFour;
    data['trial_ends_at'] = this.trialEndsAt;
    data['email_verify'] = this.emailVerify;
    data['notify_type'] = this.notifyType;
    data['added_by'] = this.addedBy;
    data['instructors_name'] = this.instructorsName;
    if (this.instructorDocs != null) {
      data['instructor_docs'] = this.instructorDocs!.toJson();
    }
    if (this.parentInfo != null) {
      data['parent_info'] = this.parentInfo!.toJson();
    }
    return data;
  }
}

class UserData {
  UserModel? userDetails;
  List<Branch>? branchesList;

  UserData({this.userDetails, this.branchesList});

  UserData.fromJson(Map<String, dynamic> json) {
    userDetails = json['user_data'] != null
        ? UserModel.fromJson(json['user_data'])
        : null;
    if (json['branches_list'] != null) {
      branchesList = <Branch>[];
      json['branches_list'].forEach((v) {
        branchesList!.add(Branch.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userDetails != null) {
      data['user_data'] = this.userDetails!.toJson();
    }
    if (this.branchesList != null) {
      data['branches_list'] =
          this.branchesList!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InstructorDocs {
  int? docsId;
  String? license;
  String? licenseDate;
  int? licenseState;
  String? instructorLicense;
  String? instructorLicenseDate;
  int? instructorLicenseState;

  InstructorDocs(
      {this.docsId,
      this.license,
      this.licenseDate,
      this.licenseState,
      this.instructorLicense,
      this.instructorLicenseDate,
      this.instructorLicenseState});

  InstructorDocs.fromJson(Map<String, dynamic> json) {
    docsId = json['docs_id'];
    license = json['license'];
    licenseDate = json['license_date'];
    licenseState = json['license_state'];
    instructorLicense = json['instructor_license'];
    instructorLicenseDate = json['instructor_license_date'];
    instructorLicenseState = json['instructor_license_state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docs_id'] = this.docsId;
    data['license'] = this.license;
    data['license_date'] = this.licenseDate;
    data['license_state'] = this.licenseState;
    data['instructor_license'] = this.instructorLicense;
    data['instructor_license_date'] = this.instructorLicenseDate;
    data['instructor_license_state'] = this.instructorLicenseState;
    return data;
  }
}

class ParentInfo {
  String? name;
  String? fname;
  String? lname;
  String? email;
  String? phone;

  ParentInfo({this.name, this.fname, this.lname, this.email, this.phone});

  ParentInfo.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Branch {
  int? id;
  String? branchName;

  Branch({this.id, this.branchName});

  Branch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    branchName = json['branch_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['branch_name'] = this.branchName;
    return data;
  }
}
