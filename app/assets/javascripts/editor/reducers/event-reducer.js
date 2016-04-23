import { _ } from 'lodash';

import * as constants from '../../shared/constants';
import * as reducers from '../reducers';
import EventWrapper from '../../wrappers/event-wrapper';


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
    case constants.SET_TEMPLATE:
      return _.merge({}, state, {
        template: action.payload.template,
        texts: reducers.textsReducer(state.texts, action)
      });
  }

  // nested reducers actions
  switch (action.group) {
    case constants.TEXT_ACTION:
      return _.merge({}, state, {
        texts: reducers.textsReducer(state.texts, action)
      })
    case constants.PICTURE_ACTION:
      return _.merge({}, state, {
        pictures: reducers.picturesReducer(state.pictures, action)
      })
    case constants.APPEARANCE_ACTION:
      return _.merge({}, state, {
        appearance: reducers.appearanceReducer(state.appearance, action)
      })
    case constants.INFORMATION_ACTION:
      return _.merge({}, state, {
        information: reducers.informationReducer(state.information, action)
      })
  }

  return state;
}
