import {
  SET_TEXT, SET_COLOR, SET_FONT_FAMLIY, SET_FONT_SIZE
} from '../actions/constants';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  let partialState = {};

  switch (action.type) {
    case SET_TEXT:
      partialState[action.payload.index] = { text: action.payload.text };
      return Object.assign({}, state, partialState);
    case SET_COLOR:
      partialState[action.payload.index] = { color: action.payload.color };
      return Object.assign({}, state, partialState);
    case SET_FONT_FAMLIY:
      partialState[action.payload.index] = { font: action.payload.font };
      return Object.assign({}, state, partialState);
    case SET_FONT_SIZE:
      partialState[action.payload.index] = { size: action.payload.size };
      return Object.assign({}, state, partialState);
  }
  return state;
}
