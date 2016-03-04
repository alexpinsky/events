import React, { Component } from 'react';
import { toCalendarDateFormat, saveToFile } from '../../helper';

const SEPARATOR = (navigator.appVersion.indexOf('Win') !== -1) ? '\r\n' : '\n';
const FILENAME  = 'eventit.ics'

export default class AddToAppleCalendar extends Component {

  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    const information  = this.props.information;
    const timeZoneStr  = `TZID=${information.time_zone}`;

    const start = toCalendarDateFormat(information.start_time);
    const end   = toCalendarDateFormat(information.end_time);

    const calendarEvent = [
      'BEGIN:VCALENDAR',
      'VERSION:2.0',
      'BEGIN:VEVENT',
      'CLASS:PUBLIC',
      `DTSTART;${timeZoneStr}:${start}`,
      `DTEND;${timeZoneStr}:${end}`,
      `LOCATION:${information.location}`,
      `SUMMARY;LANGUAGE=en-us:${information.summary}`,
      'TRANSP:TRANSPARENT',
      'END:VEVENT',
      'END:VCALENDAR'
    ].join(SEPARATOR);

    saveToFile(calendarEvent, FILENAME);
  }

  render() {

    return (
      <div className='calendar-item' onClick={this.handleClick}>
        <div className="item-icon apple"></div>
        <div className="item-text">Apple Calendar</div>
      </div>
    );
  }
}
