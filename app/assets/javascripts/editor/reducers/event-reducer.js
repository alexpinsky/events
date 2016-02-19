import { _ } from 'lodash';

import {
  FETCH_EVENT, SAVE_EVENT, SET_NAME, SET_URL, PUBLISH_EVENT,
  UNPUBLISH_EVENT, TEXT, PICTURE, APPEARANCE, INFORMATION
} from '../actions/constants';

import textsReducer from './texts-reducer';
import picturesReducer from './pictures-reducer';
import appearanceReducer from './appearance-reducer';
import informationReducer from './information-reducer';

// const INITIAL_STATE = {};
const INITIAL_STATE = {
  id: 1,
  name: 'first event',
  url: 'first_event',
  state: 0,
  texts: {
    1: { text: 'first line', color: '#000', size: null },
    2: { text: 'second line', color: '#000', size: null },
    3: { text: 'third line', color: '#000', size: null }
  },
  pictures: {
    1: { id: 11, order: 1, url: null },
    2: { id: 12, order: 2, url: null },
    3: { id: 13, order: 3, url: null },
    4: { id: 14, order: 4, url: null }
  },
  appearance: {
    background_image: null,
    theme: 'paris'
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
    case TEXT:
      return _.merge({}, state, {
        texts: textsReducer(state.texts, action)
      })
    case PICTURE:
      return _.merge({}, state, {
        pictures: picturesReducer(state.pictures, action)
      })
    case APPEARANCE:
      return _.merge({}, state, {
        appearance: appearanceReducer(state.appearance, action)
      })
    case INFORMATION:
      return _.merge({}, state, {
        information: informationReducer(state.information, action)
      })
  }

  return state;
}
