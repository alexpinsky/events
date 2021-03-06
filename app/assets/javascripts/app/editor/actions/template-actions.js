import { TEMPLATE_ACTION, SET_TEMPLATE } from '../../shared/constants';

export function setTemplate(template) {

  return {
    type: SET_TEMPLATE,
    group: TEMPLATE_ACTION,
    payload: { template: template }
  };
}
