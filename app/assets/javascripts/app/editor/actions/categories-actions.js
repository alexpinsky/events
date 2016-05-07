import axios from 'axios';
import { FETCH_CATEGORIES, API_ENDPOINT } from '../../shared/constants';

export function fetchCategories() {

  return (dispatch) => {

    axios.get(`${API_ENDPOINT}/categories`)
      .then((response) => {

        dispatch((() => {
          return {
            type: FETCH_CATEGORIES,
            payload: response
          }
        })())
      })
      .catch((response) => {
        dispatch((() => {
          return { type: null }
        })())
      });
  }
}
