import axios from 'axios';
import { _ } from 'lodash';

import * as constants from '../constants';
import { openSaveModal } from './modal-actions';
import EventWrapper from '../../../wrappers/event-wrapper';

export function undo() {

  return {
    type: constants.UNDO_EVENT
  }
}

export function redo() {

  return {
    type: constants.REDO_EVENT
  }
}

export function clearEventHistroy() {

  return {
    type: constants.CLEAR_EVENT_HISTORY
  }
}

export function saveEvent(event, params = {}) {

  if (_.isEmpty(params.name) && _.isEmpty(event.name))
    return openSaveModal(event);

  const eventWrapper = new EventWrapper(event);

  if (eventWrapper.isNew()) {
    return createEvent(event, params);
  }
  else {
    return updateEvent(event, params);
  }
}

export function fetchEvents() {

  return apiCallAndClear({
    method: 'get',
    url: `${constants.API_ENDPOINT}/events`,
    type: constants.FETCH_EVENTS
  });
}

export function fetchEvent(eventId) {

  return apiCallAndClear({
    method: 'get',
    url: `${constants.API_ENDPOINT}/events/${eventId}/edit`,
    type: constants.FETCH_EVENT
  });
}

export function createEvent(event, params = {}) {

  return apiCallAndClear({
    method: 'post',
    url: `${constants.API_ENDPOINT}/events`,
    data: Object.assign({}, event, params),
    type: constants.CREATE_EVENT
  });
}

export function updateEvent(event, params = {}) {

  return apiCallAndClear({
    method: 'put',
    url: `${constants.API_ENDPOINT}/events/${event.id}`,
    data: Object.assign({}, event, params),
    type: constants.UPDATE_EVENT
  });
}

export function publishEvent(event, params = {}) {

  return apiCallAndClear({
    method: 'put',
    url: `${constants.API_ENDPOINT}/events/${event.id}/publish`,
    data: Object.assign({}, event, params),
    type: constants.PUBLISH_EVENT
  });
}

export function unpublishEvent(event, params = {}) {

  return apiCallAndClear({
    method: 'put',
    url: `${constants.API_ENDPOINT}/events/${event.id}/unpublish`,
    data: Object.assign({}, event, params),
    type: constants.UNPUBLISH_EVENT
  });
}

export function deleteEventAndRefresh(event) {

  return (dispatch) => {
    axios({
      method: 'delete',
      url: `${constants.API_ENDPOINT}/events/${event.id}`,
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    })
    .then((response) => {
      dispatch(fetchEvents())
    })
    .catch((response) => {
      respondWithError(dispatch, response);
    });
  };
}

function apiCallAndClear(args) {

  return (dispatch) => {
    axios({
      method: args.method,
      url: args.url,
      data: args.data,
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    })
    .then((response) => {

      dispatch((() => {
        return {
          type: args.type,
          payload: response
        }
      })())

      dispatch(clearEventHistroy());
    })
    .catch((response) => {
      respondWithError(dispatch, response);
    });
  };
}

function respondWithError(dispatch, response) {

  if (response.data) {
    dispatch((() => {
      return {
        type: constants.ERROR,
        payload: { messages: response.data.errors }
      }
    })())
  }
  else {
    dispatch((() => {
      return { type: null }
    })())
  }
}
