import axios from 'axios';

import EventWrapper from '../../wrappers/event-wrapper';
import {
  FETCH_EVENT, SAVE_EVENT, SET_NAME, SET_URL, PUBLISH_EVENT, UNPUBLISH_EVENT,
  OPEN_SAVE_MODAL, CLOSE_SAVE_MODAL, API_ENDPOINT
} from './constants';

export function openSaveModal() {

  return { type: OPEN_SAVE_MODAL };
}

export function closeSaveModal() {

  return { type: CLOSE_SAVE_MODAL };
}

export function setName(newName) {

  return {
    type: SET_NAME,
    payload: { name: newName }
  };
}

export function saveEvent(event, name = null) {

  if (!name && !event.name) {
    return openSaveModal();
  }
  else {
    return asyncSave(event, { name: name });
  }
}

export function asyncSave(event, params = {}) {

  return (dispatch) => {
    const eventWrapper = new EventWrapper(event);

    let requestEndpoint, requestMethod;
    if (eventWrapper.isUnsaved()) {
      // create event
      requestEndpoint = `${API_ENDPOINT}/events`;
      requestMethod   = 'post';
    }
    else {
      // update event
      requestEndpoint = `${API_ENDPOINT}/events/${event.id}`;
      requestMethod   = 'put';
    }

    axios(requestEndpoint, {
      method: requestMethod,
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
      data: Object.assign({}, event, params)
    })
    .then((response) => {
      console.log('response', response);
      dispatch((() => {
        return {
          type: SAVE_EVENT,
          payload: response
        }
      })())
    })
    .catch((response) => {
      console.error('Error (asyncSave)', response);
    });
  }
}
