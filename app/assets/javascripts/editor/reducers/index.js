import { combineReducers } from 'redux';

import eventReducer from './event-reducer';
import categoriesReducer from './categories-reducer';
import modalsReducer from './modals-reducer';

const rootReducer = combineReducers({
  categories: categoriesReducer,
  event: eventReducer,
  modals: modalsReducer
});

export default rootReducer;
