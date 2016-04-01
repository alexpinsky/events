import { OPEN_SAVE_MODAL, CLOSE_SAVE_MODAL } from '../actions/constants';

const INITIAL_STATE = {
  save_modal: { open: false }
}

export default function(state = INITIAL_STATE, action) {
  switch (action.type) {
    case OPEN_SAVE_MODAL:
      return Object.assign({}, state, { save_modal: { open: true } });
    case CLOSE_SAVE_MODAL:
      return Object.assign({}, state, { save_modal: { open: false } });
  }

  return state;
}