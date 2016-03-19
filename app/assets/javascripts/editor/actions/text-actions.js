import {
  TEXT_ACTION, SET_TEXT, SET_COLOR, SET_FONT_FAMLIY, SET_FONT_SIZE
} from '../actions/constants';

export function setText(newText, index) {

  return {
    type: SET_TEXT,
    group: TEXT_ACTION,
    payload: { text: newText, index: index }
  };
}

export function setColor(newColor, index) {

  return {
    type: SET_COLOR,
    group: TEXT_ACTION,
    payload: { color: newColor, index: index }
  };
}

export function setFontFamily(newFont, index) {

  return {
    type: SET_FONT_FAMLIY,
    group: TEXT_ACTION,
    payload: { font: newFont, index: index }
  };
}

export function setFontSize(newSize, index) {

  return {
    type: SET_FONT_SIZE,
    group: TEXT_ACTION,
    payload: { size: newSize, index: index }
  };
}
