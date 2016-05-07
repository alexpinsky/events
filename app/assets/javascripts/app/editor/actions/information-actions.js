import * as constants from '../../shared/constants';

export function enableCalendar() {

  return {
    type: constants.ENABLE_CALENDAR,
    group: constants.INFORMATION_ACTION,
    payload: { in_use: true }
  };
}

export function disableCalendar() {
  return {
    type: constants.ENABLE_CALENDAR,
    group: constants.INFORMATION_ACTION,
    payload: { in_use: false }
  };
}

export function setStartTime(epoch) {
  return {
    type: constants.SET_START_TIME,
    group: constants.INFORMATION_ACTION,
    payload: { start_time: epoch }
  };
}

export function setEndTime(epoch) {
  return {
    type: constants.SET_END_TIME,
    group: constants.INFORMATION_ACTION,
    payload: { end_time: epoch }
  };
}

export function setLocation(location) {
  return {
    type: constants.SET_LOCATION,
    group: constants.INFORMATION_ACTION,
    payload: { location: location }
  };
}

export function setSummary(summary) {
  return {
    type: constants.SET_SUMMARY,
    group: constants.INFORMATION_ACTION,
    payload: { summary: summary }
  };
}
