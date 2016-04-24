import axios from 'axios';
import { _ } from 'lodash';

import * as constants from '../constants';
import { openSaveModal } from './modal-actions';
import EventWrapper from '../../wrappers/event-wrapper';

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

  return apiCall({
    method: 'get',
    url: `${constants.API_ENDPOINT}/events`,
    type: constants.FETCH_EVENTS
  });
}

export function fetchEvent(eventId) {

  return apiCall({
    method: 'get',
    url: `${constants.API_ENDPOINT}/events/${eventId}/edit`,
    type: constants.FETCH_EVENT
  });
}

export function createEvent(event, params = {}) {

  return apiCall({
    method: 'post',
    url: `${constants.API_ENDPOINT}/events`,
    data: Object.assign({}, event, params),
    type: constants.CREATE_EVENT
  });
}

export function updateEvent(event, params = {}) {

  return apiCall({
    method: 'put',
    url: `${constants.API_ENDPOINT}/events/${event.id}`,
    data: Object.assign({}, event, params),
    type: constants.UPDATE_EVENT
  });
}

export function publishEvent(event, params = {}) {

  return apiCall({
    method: 'put',
    url: `${constants.API_ENDPOINT}/events/${event.id}/publish`,
    data: Object.assign({}, event, params),
    type: constants.PUBLISH_EVENT
  });
}

export function unpublishEvent(event, params = {}) {

  return apiCall({
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
      console.error('API Error', response);
      dispatch((() => {
        return {
          type: constants.ERROR,
          payload: { messages: response.data.errors }
        }
      })())
    });
  };
}

function apiCall(args) {

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
    })
    .catch((response) => {
      console.error('API Error', response);
      dispatch((() => {
        return {
          type: constants.ERROR,
          payload: { messages: response.data.errors }
        }
      })())
    });
  };
}
