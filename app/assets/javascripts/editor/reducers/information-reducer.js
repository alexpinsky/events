import {
  ENABLE_CALENDAR, DISABLE_CALENDAR, SET_START_TIME, SET_END_TIME,
  SET_LOCATION, SET_SUMMARY
} from '../actions/constants';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case ENABLE_CALENDAR:
      return Object.assign({}, state, { in_use: action.payload.in_use });
    case DISABLE_CALENDAR:
      return Object.assign({}, state, { in_use: action.payload.in_use });
    case SET_START_TIME:
      return Object.assign({}, state, { start_time: action.payload.start_time });
    case SET_END_TIME:
      return Object.assign({}, state, { end_time: action.payload.end_time });
    case SET_LOCATION:
      return Object.assign({}, state, { location: action.payload.location });
    case SET_SUMMARY:
      return Object.assign({}, state, { summary: action.payload.summary });
  }

  return state;
}
