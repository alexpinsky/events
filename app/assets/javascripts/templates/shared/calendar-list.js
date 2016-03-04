import React, { Component } from 'react';
import AddToGoogleCalendar from './add-to-google-calendar';
import AddToAppleCalendar from './add-to-apple-calendar';

export default class CalendarList extends Component {

  componentWillMount() {
    $(document).bind("click", function(e) {
      let target = $(e.target);

      if (target.hasClass('calendar-list') || target.hasClass('item-text'))
        return;

      this.props.handleOpenCloseClick();
    }.bind(this));
  }

  componentWillUnmount() {
    $(document).unbind("click");
  }

  render() {

    return (
      <ul className="calendar-list">
        <li><AddToGoogleCalendar information={this.props.information} /></li>
        <li><AddToAppleCalendar information={this.props.information} /></li>
      </ul>
    );
  }
}
