import { _ } from 'lodash';
import { bindActionCreators } from 'redux';

import { UPDATE_TEXT } from '../actions/index';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case UPDATE_TEXT:
      return Object.assign({}, state, {
        [action.payload.textId]: { text: action.payload.newText }
      });
  }
  return state;
}
