import { FETCH_CATEGORIES } from '../actions/constants';

const INITIAL_STATE = [];

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case FETCH_CATEGORIES:
      return action.payload.data;
  }

  return state;
}
