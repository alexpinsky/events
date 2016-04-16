import axios from 'axios';
import { _ } from 'lodash';

import * as constants from './constants';
import EventWrapper from '../../wrappers/event-wrapper';

export function openSaveModal() {

  return { type: constants.OPEN_SAVE_MODAL };
}

export function closeSaveModal() {

  return { type: constants.CLOSE_SAVE_MODAL };
}

export function closeSavedModal() {

  return { type: constants.CLOSE_SAVED_MODAL };
}

export function openPublishModal(event) {

  if (new EventWrapper(event).isNew()) {
    return openSaveModal();
  }
  else {
    return { type: constants.OPEN_PUBLISH_MODAL };
  }
}

export function closePublishModal() {

  return { type: constants.CLOSE_PUBLISH_MODAL }
}

export function closePublishedModal() {

  return { type: constants.CLOSE_PUBLISHED_MODAL }
}

export function setName(newName) {

  return {
    type: constants.SET_NAME,
    payload: { name: newName }
  };
}

export function saveEvent(event, params = {}) {

  if (_.isEmpty(params.name) && _.isEmpty(event.name))
    return openSaveModal();

  const eventWrapper = new EventWrapper(event);

  if (eventWrapper.isNew()) {
    return createEvent(event, params);
  }
  else {
    return updateEvent(event, params);
  }
}

export function fetchEvent(eventId) {

  return (dispatch) => {
    axios.get(`${constants.API_ENDPOINT}/events/${eventId}/edit`)
      .then((response) => {
        dispatch((() => {
          return {
            type: constants.FETCH_EVENT,
            payload: response
          }
        })())
      })
      .catch((response) => {
        console.error('Error (fetchEvent)', response);
        dispatch((() => {
          return {
            type: constants.ERROR,
            payload: { messages: response.data.errors }
          }
        })())
      });
  }
}

export function createEvent(event, params = {}) {

  return (dispatch) => {

    axios.post(`${constants.API_ENDPOINT}/events`, Object.assign({}, event, params), {
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
    })
    .then((response) => {
      dispatch((() => {
        return {
          type: constants.CREATE_EVENT,
          payload: response
        }
      })())
    })
    .catch((response) => {
      console.error('Error (firstSave)', response);
      dispatch((() => {
        return {
          type: constants.ERROR,
          payload: { messages: response.data.errors }
        }
      })())
    });
  }
}

export function updateEvent(event, params = {}) {

  return (dispatch) => {
    axios.put(`${constants.API_ENDPOINT}/events/${event.id}`, Object.assign({}, event, params), {
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    })
    .then((response) => {
      dispatch((() => {
        return {
          type: constants.UPDATE_EVENT,
          payload: response
        }
      })())
    })
    .catch((response) => {
      console.error('Error (updateEvent)', response);
      dispatch((() => {
        return {
          type: constants.ERROR,
          payload: { messages: response.data.errors }
        }
      })())
    });
  }
}

export function publishEvent(event, params = {}) {

  return (dispatch) => {
    axios.put(
      `${constants.API_ENDPOINT}/events/${event.id}/publish`,
      Object.assign({}, event, params), {
        headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
      }
    )
    .then((response) => {
      dispatch((() => {
        return {
          type: constants.PUBLISH_EVENT,
          payload: response
        }
      })())
    })
    .catch((response) => {
      console.error('Error (publishEvent)', response);
      dispatch((() => {
        return {
          type: constants.ERROR,
          payload: { messages: response.data.errors }
        }
      })())
    });
  }
}
