import axios from 'axios';
import * as constants from './constants';

export function setEvent(event) {

  return {
    type: constants.SET_EVENT,
    payload: { event }
  };
}
