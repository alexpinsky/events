import { combineReducers } from 'redux';

import eventReducer from './event-reducer';
import textsReducer from './texts-reducer';
import pictuersReducer from './pictures-reducer';
import informationReducer from './information-reducer';

const rootReducer = combineReducers({
  event: eventReducer
});

export default rootReducer;
