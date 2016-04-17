import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux'

import eventReducer from './event-reducer';
import categoriesReducer from './categories-reducer';
import modalsReducer from './modals-reducer';
import notificationsReducer from '../../reducers/notifications-reducer';

const rootReducer = combineReducers({
  categories: categoriesReducer,
  event: eventReducer,
  modals: modalsReducer,
  notifications: notificationsReducer,
  routing: routerReducer
});

export default rootReducer;
