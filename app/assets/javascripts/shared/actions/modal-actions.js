import * as constants from '../constants';
import EventWrapper from '../../wrappers/event-wrapper';

export function openSaveModal(event) {

  return {
    type: constants.OPEN_SAVE_MODAL,
    payload: { event }
  };
}

export function closeSaveModal() {

  return { type: constants.CLOSE_SAVE_MODAL };
}

export function closeSavedModal() {

  return { type: constants.CLOSE_SAVED_MODAL };
}

export function openPublishModal(event) {

  if (new EventWrapper(event).isNew()) {
    return openSaveModal(event);
  }
  else {
    return {
      type: constants.OPEN_PUBLISH_MODAL,
      payload: { event }
    };
  }
}

export function closePublishModal() {

  return { type: constants.CLOSE_PUBLISH_MODAL }
}

export function closePublishedModal() {

  return { type: constants.CLOSE_PUBLISHED_MODAL }
}
