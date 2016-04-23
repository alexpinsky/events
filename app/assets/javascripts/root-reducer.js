import { combineReducers } from 'redux';
import { routerReducer } from 'react-router-redux'

import * as sharedReducers from './shared/reducers';
import * as editorReducers from './editor/reducers';
import * as dashboardReducers from './dashboard/reducers';

const rootReducer = combineReducers({
  events: dashboardReducers.eventsReducer,
  categories: editorReducers.categoriesReducer,
  event: editorReducers.eventReducer,
  modals: sharedReducers.modalsReducer,
  notifications: sharedReducers.notificationsReducer,
  routing: routerReducer
});

export default rootReducer;
