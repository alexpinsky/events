import {
  OPEN_SAVE_MODAL, CLOSE_SAVE_MODAL, CLOSE_SAVED_MODAL, CREATE_EVENT
} from '../actions/constants';

const INITIAL_STATE = {
  save_modal: { open: false },
  saved_modal: { open: false }
}

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case OPEN_SAVE_MODAL:
      return Object.assign({}, state, { save_modal: { open: true } });
    case CLOSE_SAVE_MODAL:
      return Object.assign({}, state, { save_modal: { open: false } });
    case CLOSE_SAVED_MODAL:
      return Object.assign({}, state, { saved_modal: { open: false } });
    case CREATE_EVENT:
      return Object.assign({}, state, {
        save_modal: { open: false },
        saved_modal: { open: true }
      });
  }

  return state;
}