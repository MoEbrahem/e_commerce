// ignore: file_names
enum Statusrequest{
  none,
  loading,
  success,
  failure,
  serverFailure,
  offlineFailure,
  checkout,
}


// enum هو عبارة عن  Class in it inheritances 
// why don't use class instead of enum 
//because class can't take more than one inheritance
// enum constants are public , static and final (unchangeable - cannot be overridden).
// An enum cannot be used to create objects,
// and it cannot extend other classes (but it can implement interfaces).