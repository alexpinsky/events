import { _ } from 'lodash';
import { bindActionCreators } from 'redux';

import { actions, FETCH_EVENT, UPDATE_NAME, UPDATE_TEXT } from '../actions/index';
import textsReducer from './texts-reducer';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  console.log("includes", _.includes(actions, action.type));
  switch (action.type) {
    case FETCH_EVENT:
      return action.payload.data;
    case UPDATE_NAME:
      return Object.assign({}, state, { name: action.payload.newName });
    case UPDATE_TEXT:
      return _.merge({}, state, {
        texts: textsReducer(state.texts, action)
      })
  }
  return state;
}
