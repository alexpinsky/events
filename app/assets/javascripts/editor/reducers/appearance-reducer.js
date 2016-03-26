import { SET_BACKGROUND } from '../actions/constants';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case SET_BACKGROUND:
      return Object.assign({}, state, { background: action.payload.background });
  }

  return state;
}
