import { combineReducers } from 'redux';
import Event from './event';

const rootReducer = combineReducers({
  event: Event
});

export default rootReducer;
