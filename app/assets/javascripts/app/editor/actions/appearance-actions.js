import { APPEARANCE_ACTION, SET_BACKGROUND } from '../../shared/constants';

export function setBackground(newBackground) {

  return {
    type: SET_BACKGROUND,
    group: APPEARANCE_ACTION,
    payload: { background: newBackground }
  };
}