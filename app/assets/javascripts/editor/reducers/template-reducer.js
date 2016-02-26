import { SET_TEMPLATE } from '../actions/constants';

const INITIAL_STATE = {};

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case SET_TEMPLATE:
      return action.payload.template;
  }

  return state;
}
