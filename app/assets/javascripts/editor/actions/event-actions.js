import axios from 'axios';

import EventWrapper from '../../wrappers/event-wrapper';
import {
  FETCH_EVENT, SAVE_EVENT, SET_NAME, SET_URL, PUBLISH_EVENT, UNPUBLISH_EVENT,
  OPEN_SAVE_MODAL, CLOSE_SAVE_MODAL, API_ENDPOINT
} from './constants';

export function openSaveModal() {
  console.log('openSaveModal');
  return { type: OPEN_SAVE_MODAL };
}

export function closeSaveModal() {
  return { type: CLOSE_SAVE_MODAL };
}

export function setName(newName) {
  console.log('setName', newName);
  return {
    type: SET_NAME,
    payload: { name: newName }
  };
}

export function saveEvent(event, name = null) {

  return function(dispatch) {

    if (name)
      dispatch(setName(name));

    if (event.name) {
      asyncSave(event);
    }
    else {
      openSaveModal();
    }
  }
}

export function asyncSave(event) {
  console.log('asyncSave', event);
  if (eventWrapper.isUnsaved()) {
    const requestEndpoint = `${API_ENDPOINT}/events`;
    const requestMethod   = 'post';
  }
  else {
    const requestEndpoint = `${API_ENDPOINT}/events/${event.id}`;
    const requestMethod   = 'put';
  }

  axios(requestEndpoint, {
    method: requestMethod,
    data: event
  })
  .then(function (response) {
    console.log(response);
  })
  .catch(function (response) {
    console.log(response);
  });


  // return {
  //   type: SAVE_EVENT,
  //   payload: request
    // };
}
