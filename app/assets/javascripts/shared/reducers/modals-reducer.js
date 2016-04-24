import * as constants from '../constants';

export default function(state = INITIAL_STATE, action) {

  switch (action.type) {
    case constants.CLOSE_SAVE_MODAL:
      return Object.assign({}, state, INITIAL_STATE);
    case constants.CLOSE_SAVED_MODAL:
      return Object.assign({}, state, INITIAL_STATE);
    case constants.CLOSE_PUBLISH_MODAL:
      return Object.assign({}, state, INITIAL_STATE);
    case constants.CLOSE_PUBLISHED_MODAL:
      return Object.assign({}, state, INITIAL_STATE);
    case constants.OPEN_SAVE_MODAL:
      return Object.assign({}, state, {
        save_modal: { open: true, event: action.payload.event },
        saved_modal: { open: false },
        publish_modal: { open: false },
        published_modal: { open: false }
      });
    case constants.OPEN_PUBLISH_MODAL:
      return Object.assign({}, state, {
        save_modal: { open: false },
        saved_modal: { open: false },
        publish_modal: { open: true, event: action.payload.event },
        published_modal: { open: false }
      });
    case constants.CREATE_EVENT:
      return Object.assign({}, state, {
        save_modal: { open: false },
        saved_modal: { open: true, event: action.payload.data },
        publish_modal: { open: false },
        published_modal: { open: false }
      });
    case constants.PUBLISH_EVENT:
      return Object.assign({}, state, {
        save_modal: { open: false },
        saved_modal: { open: false },
        publish_modal: { open: false },
        published_modal: { open: true }
      });
  }

  return state;
}

const INITIAL_STATE = {
  save_modal: { open: false },
  saved_modal: { open: false },
  publish_modal: { open: false },
  published_modal: { open: false }
}