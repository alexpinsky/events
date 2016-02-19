import { combineReducers } from 'redux';
import eventReducer from './event-reducer';

const rootReducer = combineReducers({
  event: eventReducer
});

export default rootReducer;