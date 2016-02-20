import { combineReducers } from 'redux';

import eventReducer from './event-reducer';
import categoriesReducer from './categories-reducer';

const rootReducer = combineReducers({
  categories: categoriesReducer,
  event: eventReducer
});

export default rootReducer;
