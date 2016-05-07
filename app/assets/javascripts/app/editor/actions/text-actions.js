import * as constants from '../../shared/constants';

export function setText(newText, index) {

  return {
    type: constants.SET_TEXT,
    group: constants.TEXT_ACTION,
    payload: { text: newText, index: index }
  };
}

export function setColor(newColor, index) {

  return {
    type: constants.SET_COLOR,
    group: constants.TEXT_ACTION,
    payload: { color: newColor, index: index }
  };
}

export function setFontFamily(newFont, index) {

  return {
    type: constants.SET_FONT_FAMLIY,
    group: constants.TEXT_ACTION,
    payload: { font: newFont, index: index }
  };
}

export function setFontSize(newSize, index) {

  return {
    type: constants.SET_FONT_SIZE,
    group: constants.TEXT_ACTION,
    payload: { size: newSize, index: index }
  };
}
