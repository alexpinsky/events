import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Checkbox from '../components/checkbox';
import TimezonePicker from '../components/timezone-picker';

import {
  enableCalendar, disableCalendar, setStartTime, setEndTime, setTimeZone,
  setLocation, setSummary
} from '../actions/information-actions';

export class CalendarForm extends Component {
  constructor(props) {
    super(props);

    this.handleCheck   = this.handleCheck.bind(this);
    this.handleUncheck = this.handleUncheck.bind(this);
    this.handleSummaryChange  = this.handleSummaryChange.bind(this);
    this.handleLocationChange = this.handleLocationChange.bind(this);
    this.handleTimezoneChange = this.handleTimezoneChange.bind(this);
  }

  handleCheck() {
    this.props.enableCalendar();
  }

  handleUncheck() {
    this.props.disableCalendar();
  }

  handleSummaryChange(e) {
    this.props.setSummary($(e.target).val());
  }

  handleLocationChange(e) {
    this.props.setLocation($(e.target).val());
  }

  handleTimezoneChange(e) {

  }

  renderFields() {
    const information = this.props.information;

    if (!information.in_use)
      return null;

    return (
      <div className='information-fields'>

        <div className='name-section'>
          <input placeholder='event name'
                 value={information.summary}
                 onChange={this.handleSummaryChange} />
          <input placeholder='event location'
                 value={information.location}
                 onChange={this.handleLocationChange} />
        </div>

        <div className='time-section'>
          <div className='text'>date & time</div>

          <div className='inputs'>
            <TimezonePicker timezone={information.time_zone}
                            onChange={this.handleTimezoneChange} />
            <input type="text" className="date start"/>
            <input type="text" className="time start"/>
            <div className='text'>to</div>
            <input type="text" className="date end"/>
            <input type="text" className="time end"/>
          </div>
        </div>
      </div>
    );
  }

  render() {

    return (
      <div className='information'>

        <div className='sync-section'>
          <div className='checkbox'>
            <Checkbox isChecked={this.props.information.in_use}
                      onCheck={this.handleCheck}
                      onUncheck={this.handleUncheck} />
          </div>
          <div className='text'>synchronize your guests calendars</div>
        </div>

        {this.renderFields()}
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  const actions = {
    enableCalendar,
    disableCalendar,
    setStartTime,
    setEndTime,
    setTimeZone,
    setLocation,
    setSummary
  };

  return bindActionCreators(actions, dispatch);
}

function mapStateToProps(state) {
  return { information: state.event.information };
}

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(CalendarForm);
