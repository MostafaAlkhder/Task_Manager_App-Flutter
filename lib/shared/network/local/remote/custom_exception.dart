enum ExceptionType {
  ConnectionError,
  NotAuthorized,
  NotFound,
  InternalServerException,
  ServiceUnavailableException,
  PageGone,
  Other,
}

class GenericException {
  ExceptionType type;
  String errorMessage;
  GenericException({required this.type, this.errorMessage = "Unknown Error"});
}

Map<int, GenericException> statusCodesException = {
  401: GenericException(
    type: ExceptionType.NotAuthorized,
    errorMessage: "You are Not Authorized",
  ),
  404: GenericException(
    type: ExceptionType.NotFound,
    errorMessage: "Page Not Found",
  ),
  410: GenericException(
    type: ExceptionType.PageGone,
    errorMessage: "Page Gone",
  ),
  500: GenericException(
    type: ExceptionType.InternalServerException,
    errorMessage: "Server Down",
  ),
  503: GenericException(
    type: ExceptionType.ServiceUnavailableException,
    errorMessage: "Service Unavailable",
  ),
};
