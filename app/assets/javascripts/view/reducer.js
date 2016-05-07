import { combineReducers } from 'redux';
import EventWrapper from '../wrappers/event-wrapper';
import * as constants from './constants';

const eventReducer = function(state = {}, action) {

  switch(action.type) {
    case constants.SET_EVENT:
      return Object.assign({}, state, action.payload.event);
  }

  return state;
}

const rootReducer = combineReducers({
  event: eventReducer
});

export default rootReducer;
