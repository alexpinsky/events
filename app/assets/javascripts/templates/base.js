import React, { Component } from 'react';
import CalendarButton from './shared/calendar-button';

export default class Base extends Component {

  textStyle(args) {
    return { fontFamily: args.text.font, color: args.text.color, fontSize: `${args.text.size}em`};
  }

  renderCalendarButton(information) {

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
