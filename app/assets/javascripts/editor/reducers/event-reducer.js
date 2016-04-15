import { _ } from 'lodash';
import EventWrapper from '../../wrappers/event-wrapper';

import {
  FETCH_EVENT, CREATE_EVENT, UPDATE_EVENT, SET_NAME, SET_URL, PUBLISH_EVENT, UNPUBLISH_EVENT,
  OPEN_SAVE_MODAL, TEXT_ACTION, PICTURE_ACTION, APPEARANCE_ACTION, INFORMATION_ACTION,
  TEMPLATE_ACTION
} from '../actions/constants';

import textsReducer from './texts-reducer';
import picturesReducer from './pictures-reducer';
import appearanceReducer from './appearance-reducer';
import informationReducer from './information-reducer';
import templateReducer from './template-reducer';

export default function(state = EventWrapper.newEvent(), action) {
  console.log('action.type', action.type);
  // this reducer actions
  switch (action.type) {
    case FETCH_EVENT:
      return action.payload.data;
    case CREATE_EVENT:
      return action.payload.data;
    case UPDATE_EVENT:
      return action.payload.data;
    case SET_NAME:
      return Object.assign({}, state, { name: action.payload.name });
    case SET_URL:
      return Object.assign({}, state, { url: action.payload.url });
    case PUBLISH_EVENT:
      return Object.assign({}, state, { state: action.payload.data });
    case UNPUBLISH_EVENT:
      return Object.assign({}, state, { state: action.payload.data });
  }

  // nested reducers actions
  switch (action.group) {
    case TEMPLATE_ACTION:
      return _.merge({}, state, {
        template: templateReducer(state.template, action)
      })
    case TEXT_ACTION:
      return _.merge({}, state, {
        texts: textsReducer(state.texts, action)
      })
    case PICTURE_ACTION:
      return _.merge({}, state, {
        pictures: picturesReducer(state.pictures, action)
      })
    case APPEARANCE_ACTION:
      return _.merge({}, state, {
        appearance: appearanceReducer(state.appearance, action)
      })
    case INFORMATION_ACTION:
      return _.merge({}, state, {
        information: informationReducer(state.information, action)
      })
  }

  return state;
}
