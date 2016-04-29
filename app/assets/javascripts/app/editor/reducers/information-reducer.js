import * as constants from '../../shared/constants';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case constants.ENABLE_CALENDAR:
      return Object.assign({}, state, { in_use: action.payload.in_use });
    case constants.DISABLE_CALENDAR:
      return Object.assign({}, state, { in_use: action.payload.in_use });
    case constants.SET_START_TIME:
      return Object.assign({}, state, { start_time: action.payload.start_time });
    case constants.SET_END_TIME:
      return Object.assign({}, state, { end_time: action.payload.end_time });
    case constants.SET_LOCATION:
      return Object.assign({}, state, { location: action.payload.location });
    case constants.SET_SUMMARY:
      return Object.assign({}, state, { summary: action.payload.summary });
  }

  return state;
}
