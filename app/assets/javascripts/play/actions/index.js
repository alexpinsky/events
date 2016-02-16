import axios from 'axios';

export const FETCH_EVENT = 'FETCH_EVENT';
export const UPDATE_TEXT = 'UPDATE_TEXT';
export const UPDATE_NAME = 'UPDATE_NAME';

export function fetchEvent() {
  const request = axios.get('/get')

  return {
    type: FETCH_EVENT,
    payload: request
  };
}

export function updateText(args) {

  return {
    type: UPDATE_TEXT,
    payload: args
  };
}

export function updateName(newName) {

  return {
    type: UPDATE_NAME,
    payload: newName
  };
}
