import { PICTURE_ACTION, ADD_PICTURE, REMOVE_PICTURE } from '../../shared/constants';

export function addPicture(index, url) {

  return {
    type: ADD_PICTURE,
    group: PICTURE_ACTION,
    payload: { index: index, url: url }
  };
}

export function removePicture(index) {

  return {
    type: REMOVE_PICTURE,
    group: PICTURE_ACTION,
    payload: { index: index }
  };
}
