import { _ } from 'lodash';

import * as constants from '../actions/constants';
import EventWrapper from '../../wrappers/event-wrapper';

import textsReducer from './texts-reducer';
import picturesReducer from './pictures-reducer';
import appearanceReducer from './appearance-reducer';
import informationReducer from './information-reducer';
import templateReducer from './template-reducer';

export default function(state = EventWrapper.newEvent(), action) {

  // this reducer actions
  switch (action.type) {
    case constants.FETCH_EVENT:
      return action.payload.data;
    case constants.CREATE_EVENT:
      return action.payload.data;
    case constants.UPDATE_EVENT:
      return action.payload.data;
    case constants.PUBLISH_EVENT:
      return action.payload.data;
    case constants.UNPUBLISH_EVENT:
      return action.payload.data;
    case constants.SET_NAME:
      return Object.assign({}, state, { name: action.payload.name });
    case constants.SET_URL:
      return Object.assign({}, state, { url: action.payload.url });
  }

  // nested reducers actions
  switch (action.group) {
    case constants.TEMPLATE_ACTION:
      return _.merge({}, state, {
        template: templateReducer(state.template, action)
      })
    case constants.TEXT_ACTION:
      return _.merge({}, state, {
        texts: textsReducer(state.texts, action)
      })
    case constants.PICTURE_ACTION:
      return _.merge({}, state, {
        pictures: picturesReducer(state.pictures, action)
      })
    case constants.APPEARANCE_ACTION:
      return _.merge({}, state, {
        appearance: appearanceReducer(state.appearance, action)
      })
    case constants.INFORMATION_ACTION:
      return _.merge({}, state, {
        information: informationReducer(state.information, action)
      })
  }

  return state;
}
