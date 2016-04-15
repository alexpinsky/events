import axios from 'axios';
import { _ } from 'lodash';

import EventWrapper from '../../wrappers/event-wrapper';
import {
  FETCH_EVENT, CREATE_EVENT, UPDATE_EVENT, SET_NAME, SET_URL, PUBLISH_EVENT, UNPUBLISH_EVENT,
  OPEN_SAVE_MODAL, CLOSE_SAVE_MODAL, CLOSE_SAVED_MODAL, API_ENDPOINT, ERROR
} from './constants';

export function openSaveModal() {

  return { type: OPEN_SAVE_MODAL };
}

export function closeSaveModal() {

  return { type: CLOSE_SAVE_MODAL };
}

export function closeSavedModal() {

  return { type: CLOSE_SAVED_MODAL };
}

export function setName(newName) {

  return {
    type: SET_NAME,
    payload: { name: newName }
  };
}

export function publishEvent(event) {

  if (new EventWrapper(event).isNew())
    return openSaveModal();

  return (dispatch) => {

    new Promise(saveEvent(event))
      .then((result) => {
        console.log('result', result);
        if(result.type == ERROR)
          return dispatch((() => {
            return result
          })())

        return dispatch((() => {
          return {
            type: 'OPEN_PUBLISH_MODAL'
          }
        })())
      })
  }
}

export function fetchEvent(eventId) {

  return (dispatch) => {
    axios.get(`${API_ENDPOINT}/events/${eventId}/edit`)
      .then((response) => {
        dispatch((() => {
          return {
            type: FETCH_EVENT,
            payload: response
          }
        })())
      })
      .catch((response) => {
        console.error('Error (fetchEvent)', response);
        dispatch((() => {
          return {
            type: ERROR,
            payload: { messages: response.data.errors }
          }
        })())
      });
  }
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

export function createEvent(event, params) {

  return (dispatch) => {

    axios.post(`${API_ENDPOINT}/events`, Object.assign({}, event, params), {
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') },
    })
    .then((response) => {
      dispatch((() => {
        return {
          type: CREATE_EVENT,
          payload: response
        }
      })())
    })
    .catch((response) => {
      console.error('Error (firstSave)', response);
      dispatch((() => {
        return {
          type: ERROR,
          payload: { messages: response.data.errors }
        }
      })())
    });
  }
}

export function updateEvent(event, params) {

  return (dispatch) => {
    axios.put(`${API_ENDPOINT}/events/${event.id}`, Object.assign({}, event, params), {
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    })
    .then((response) => {
      dispatch((() => {
        return {
          type: UPDATE_EVENT,
          payload: response
        }
      })())
    })
    .catch((response) => {
      console.error('Error (updateEvent)', response);
      dispatch((() => {
        return {
          type: ERROR,
          payload: { messages: response.data.errors }
        }
      })())
    });
  }
}
