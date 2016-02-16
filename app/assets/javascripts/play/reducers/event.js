import { _ } from 'lodash';
import { bindActionCreators } from 'redux';

import { FETCH_EVENT, UPDATE_TEXT, UPDATE_NAME } from '../actions/index';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case FETCH_EVENT:
      return action.payload.data;
    case UPDATE_TEXT:
      let newText = {}
      newText[action.payload.id] = { text: action.payload.newText };
      return _.merge({}, state, { texts: newText});
    case UPDATE_NAME:
      return _.merge({}, state, { name: action.payload.newName });
  }
  return state;
}
