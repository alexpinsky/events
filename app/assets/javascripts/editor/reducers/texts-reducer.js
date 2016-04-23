import * as constants from '../../shared/constants';
import EventWrapper from '../../wrappers/event-wrapper';

export default function(state = INITIAL_STATE, action) {

  let partialState = {};

  switch (action.type) {
    case constants.SET_TEXT:
      partialState[action.payload.index] = { text: action.payload.text };
      return Object.assign({}, state, partialState);
    case constants.SET_COLOR:
      partialState[action.payload.index] = { color: action.payload.color };
      return Object.assign({}, state, partialState);
    case constants.SET_FONT_FAMLIY:
      partialState[action.payload.index] = { font: action.payload.font };
      return Object.assign({}, state, partialState);
    case constants.SET_FONT_SIZE:
      partialState[action.payload.index] = { size: action.payload.size };
      return Object.assign({}, state, partialState);
    case constants.SET_TEMPLATE:
      return Object.assign({}, state, EventWrapper.templateTextStyle(action.payload.template.name));
  }

  return state;
}

const INITIAL_STATE = {};
