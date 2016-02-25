import { SET_THEME } from '../actions/constants';


export function setTheme(theme) {

  return {
    type: SET_THEME,
    payload: { theme: theme }
  };
}
