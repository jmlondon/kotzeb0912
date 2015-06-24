#' Kotzebue 2009-2012 Status Messages
#'
#' status messages transmitted from telemetry devices
#'
#' @format Data frame with columns
#' \describe{
#' \item{deployid}{unique deployment identifier}
#' \item{ptt}{argos ptt identifier}
#' \item{depthsensor}{depth sensor surface value}
#' \item{instr}{telemetry instrument type; 'Mk10' or 'SPOT'}
#' }
#' @examples
#'   status
"kotzeb0912_status"