import axios from 'axios';
import * as constants from './constants';

export function setEvent(event) {

  return {
    type: constants.SET_EVENT,
    payload: { event }
  };
}


export function eventViewed(eventId) {

  return (dispatch) => {
    axios({
      method: 'post',
      url: `${constants.API_ENDPOINT}/events/${eventId}/views`,
      headers: { 'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content') }
    })
    .then((response) => {
      dispatch((() => {
        return { type: constants.EVENT_VIEWED }
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
