import { SET_THEME } from '../actions/constants';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case SET_THEME:
      return Object.assign({}, state, { theme: action.payload.theme });
  }

  return state;
}
