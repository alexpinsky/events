import { _ } from 'lodash';

import {
  FETCH_EVENT, SAVE_EVENT, SET_NAME, SET_URL, PUBLISH_EVENT, UNPUBLISH_EVENT,
  TEXT_ACTION, PICTURE_ACTION, APPEARANCE_ACTION, INFORMATION_ACTION, TEMPLATE_ACTION
} from '../actions/constants';

import textsReducer from './texts-reducer';
import picturesReducer from './pictures-reducer';
import appearanceReducer from './appearance-reducer';
import informationReducer from './information-reducer';
import templateReducer from './template-reducer';

// const INITIAL_STATE = {};
const INITIAL_STATE = {
  id: 1,
  name: 'first event',
  url: 'first_event',
  state: 0,
  template: { name: 'paris' },
  texts: {
    1: { text: 'first line', color: '#e80ef0', size: 6, font: "'Six Caps', sans-serif" },
    2: { text: 'second line', color: '#e80ef0', size: 6, font: "'Six Caps', sans-serif" },
    3: { text: 'third line', color: '#e80ef0', size: 2.5, font: "'Six Caps', sans-serif" }
  },
  pictures: {
    1: { id: 11, order: 1, url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451652630/bmfly9clrqxtmjt6irx7.jpg' },
    2: { id: 12, order: 2, url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451652630/bmfly9clrqxtmjt6irx7.jpg' },
    3: { id: 13, order: 3, url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451652630/bmfly9clrqxtmjt6irx7.jpg' },
    4: { id: 14, order: 4, url: 'http://res.cloudinary.com/eventit-me/image/upload/v1451652630/bmfly9clrqxtmjt6irx7.jpg' }
  },
  appearance: { background_url: "http://res.cloudinary.com/eventit-me/image/upload/v1451683817/P_Birds_w_aznlar.png" },
  information: {
    in_use: true,
    summary: 'My Event',
    location: "בית על הים, רוסלאן 1, יפו",
    start_time: "1457101330000",
    end_time: "1457119334000"
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
