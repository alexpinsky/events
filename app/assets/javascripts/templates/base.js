import React, { Component } from 'react';

import { _ } from 'lodash';
import CalendarButton from './shared/calendar-button';

export default class Base extends Component {

  mergedText() {
    return _.merge({}, this.props.texts, this.props.event.texts);
  }

  mergedPictures() {
    return _.merge({}, this.props.pictures, this.props.event.pictures);
  }

  textStyle(args) {

    return {
      fontFamily: args.text.font,
      color: args.text.color,
      fontSize: `${args.text.size}em`
    };
  }

  renderCalendarButton() {
    const information = this.props.event.information;

    if (!information.in_use)
      return null;

    return (
      <div className="calendar-wrapper">
        <CalendarButton information={information} />
      </div>
    );
  }

  render() {
    return this.renderSpecific();
  }
}
