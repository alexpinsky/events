import axios from 'axios';
import { FETCH_CATEGORIES } from '../actions/constants';
import { API_ENDPOINT } from '../actions/constants';


export function fetchCategories() {
  const request = axios.get(`${API_ENDPOINT}/categories`)

  return {
    type: FETCH_CATEGORIES,
    payload: request
  };
}
