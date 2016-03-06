import {
  INFORMATION_ACTION, ENABLE_CALENDAR, DISABLE_CALENDAR, SET_START_TIME, SET_END_TIME,
  SET_LOCATION, SET_SUMMARY
} from '../actions/constants';

export function enableCalendar() {

  return {
    type: ENABLE_CALENDAR,
    group: INFORMATION_ACTION,
    payload: { in_use: true }
  };
}

export function disableCalendar() {
  return {
    type: ENABLE_CALENDAR,
    group: INFORMATION_ACTION,
    payload: { in_use: false }
  };
}

export function setStartTime(epoch) {
  return {
    type: SET_START_TIME,
    group: INFORMATION_ACTION,
    payload: { start_time: epoch }
  };
}

export function setEndTime(epoch) {
  return {
    type: SET_END_TIME,
    group: INFORMATION_ACTION,
    payload: { end_time: epoch }
  };
}

export function setLocation(location) {
  return {
    type: SET_LOCATION,
    group: INFORMATION_ACTION,
    payload: { location: location }
  };
}

export function setSummary(summary) {
  return {
    type: SET_SUMMARY,
    group: INFORMATION_ACTION,
    payload: { summary: summary }
  };
}
