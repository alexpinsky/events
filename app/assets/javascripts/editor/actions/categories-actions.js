import axios from 'axios';
import { FETCH_CATEGORIES, API_ENDPOINT } from '../actions/constants';

function foo(data) {

  return {
    type: FETCH_CATEGORIES,
    payload: data
  };
}

export function fetchCategories() {

  return function(dispatch) {

    axios.get(`${API_ENDPOINT}/categories`)
      .then(function (response) {
        console.log('response', response);
        return dispatch(foo(response));
      })
      .catch(function (response) {
        console.log('fetchCategories error', response);
      });
  }
}
