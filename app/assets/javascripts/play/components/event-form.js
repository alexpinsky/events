import React, { Component } from 'react';
import TextEdit from '../containers/text-edit';
import NameEdit from '../containers/name-edit';

export default class EventForm extends Component {
  shouldComponentUpdate(nextProps, nextState) {
    // console.log('nextProps (EventForm)', nextProps);
    return false;
  }

  render() {
    return (
      <div>
        <NameEdit />
        <TextEdit />
      </div>
    );
  }
}
