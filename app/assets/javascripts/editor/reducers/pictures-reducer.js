import { PICTURE_ACTION, ADD_PICTURE, REMOVE_PICTURE } from '../actions/constants';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  let partialState = {};

  switch (action.type) {
    case ADD_PICTURE:
      partialState[action.payload.index] = { url: action.payload.url };
      return Object.assign({}, state, partialState);
    case REMOVE_PICTURE:
      partialState[action.payload.index] = { url: null };
      return Object.assign({}, state, partialState);
  }

  return state;
}
