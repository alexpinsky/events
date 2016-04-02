import { _ } from 'lodash';

import {
  FETCH_EVENT, SAVE_EVENT, SET_NAME, SET_URL, PUBLISH_EVENT, UNPUBLISH_EVENT, OPEN_SAVE_MODAL,
  TEXT_ACTION, PICTURE_ACTION, APPEARANCE_ACTION, INFORMATION_ACTION, TEMPLATE_ACTION
} from '../actions/constants';

import textsReducer from './texts-reducer';
import picturesReducer from './pictures-reducer';
import appearanceReducer from './appearance-reducer';
import informationReducer from './information-reducer';
import templateReducer from './template-reducer';

const INITIAL_STATE = {
  id: null,
  name: null,
  url: null,
  state: null,
  template: { name: 'paris' },
  texts: {
    1: {},
    2: {},
    3: {}
  },
  pictures: {
    1: {},
    2: {},
    3: {},
    4: {}
  },
  appearance: {
    background: {
      type: 'color',
      color: 'white'
    }
  },
  information: {
    in_use: false,
    summary: null,
    location: null,
    start_time: null,
    end_time: null
  }
};

export default function(state = INITIAL_STATE, action) {

  // this reducer actions
  switch (action.type) {
    case FETCH_EVENT:
      return action.payload.data;
    case SAVE_EVENT:
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
