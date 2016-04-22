import React, { Component } from 'react';
import { toCalendarDateFormat } from '../../shared/helper';

const ROOT_URL        = "http://www.google.com/calendar/render";
const PARAMS_SPERATOR = '&';
const TARGET          = '_blank'

export default class AddToGoogleCalendar extends Component {

  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  handleClick() {
    const information = this.props.information;
    const start       = toCalendarDateFormat(information.start_time);
    const end         = toCalendarDateFormat(information.end_time);

    const url = [
      `${ROOT_URL}?action=TEMPLATE`,
      `text=${information.summary}`,
      `dates=${start}/${end}`,
      `location=${information.location}`,
      'sf=true',
      'output=xml'
    ].join(PARAMS_SPERATOR);

    window.open(url, TARGET);
  }

  render() {

    return (
      <div className='calendar-item' onClick={this.handleClick}>
        <div className="item-icon google"></div>
        <div className="item-text">Google Calendar</div>
      </div>
    );
  }
}
