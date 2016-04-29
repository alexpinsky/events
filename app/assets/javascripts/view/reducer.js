import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux'

import eventReducer from './reducers/event-reducer';

const rootReducer = combineReducers({
  event: eventReducer
});

export default rootReducer;
