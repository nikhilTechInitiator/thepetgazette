enum AuthStatus {
  initial,
  authenticated,
  unAuthenticated,
  authenticating,
  authenticationFailed,
  unAuthorisedAccess,
}

enum UserType {
  student,
  parent,
  instructor,
  admin,
  superAdmin,
  unKnown,
}

enum PageStatus {
  initial,
  loading,
  loaded,
  loadingFailed,
  updating,
  updatingFailed,
  updated,
  validationError
}
