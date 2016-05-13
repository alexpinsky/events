import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import Checkbox from '../components/checkbox';
import * as actions from '../actions/information-actions';
import { toHumanDateFormat } from '../../../helper';

export class CalendarForm extends Component {
  constructor(props) {
    super(props);

    this.handleCheck           = this.handleCheck.bind(this);
    this.handleUncheck         = this.handleUncheck.bind(this);
    this.handleSummaryChange   = this.handleSummaryChange.bind(this);
    this.handleLocationChange  = this.handleLocationChange.bind(this);
    this.handleStartTimeChange = this.handleStartTimeChange.bind(this);
    this.handleEndTimeChange   = this.handleEndTimeChange.bind(this);
  }

  componentDidMount() {
    this.initPicker();
  }

  componentWillUnmount() {
    this.destroyPicker();
  }

  componentWillUpdate(nextProps, nextState) {
    this.destroyPicker();
  }

  componentDidUpdate(prevProps, prevState) {
    this.initPicker();
  }

  initPicker() {
    if(!this.startTimeInput && !this.endTimeInput)
      return;

    const timeNow = new Date();

    $(this.startTimeInput).datetimepicker({
      onChangeDateTime: this.handleStartTimeChange,
      startDate: timeNow,
      minDate: timeNow,
      defaultDate: timeNow
    });

    $(this.endTimeInput).datetimepicker({
      onChangeDateTime: this.handleEndTimeChange,
      startDate: timeNow,
      minDate: timeNow,
      defaultDate: timeNow
    });
  }

  destroyPicker() {
    if(!this.startTimeInput && !this.endTimeInput)
      return;

    $(this.startTimeInput).datetimepicker('destroy');
    $(this.endTimeInput).datetimepicker('destroy');
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

  handleStartTimeChange(dp, $input) {
    if (dp instanceof Date)
      this.props.setStartTime(dp.getTime() + dp.getTimezoneOffset() * 60000);
  }

  handleEndTimeChange(dp, $input) {
    if (dp instanceof Date)
      this.props.setEndTime(dp.getTime() + dp.getTimezoneOffset() * 60000);
  }

  renderFields() {
    const information = this.props.information;

    if (!information.in_use)
      return null;

    return (
      <div className='information-fields'>

        <div className='name-section'>
          <div className='text'>event name</div>
          <input value={information.summary} onChange={this.handleSummaryChange} />
          <div className='text'>location</div>
          <input value={information.location} onChange={this.handleLocationChange} />
        </div>

        <div className='time-section'>
          <div className='inputs'>

            <div className='start-wrapper'>
              <div className='text'>starts at</div>
              <input type="text"
                     className="datetimepicker start"
                     defaultValue={toHumanDateFormat(information.start_time)}
                     ref={ (ref) => this.startTimeInput = ref }
                     onChange={this.handleStartTimeChange} />
            </div>

            <div className='end-wrapper'>
              <div className='text'>ends at</div>
              <input type="text"
                     className="datetimepicker end"
                     defaultValue={toHumanDateFormat(information.end_time)}
                     ref={ (ref) => this.endTimeInput = ref }
                     onChange={this.handleEndTimeChange} />
            </div>
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
          <div className='text'>
            want your guests to be able to add your<br/>event to their calendar?
          </div>
        </div>

        {this.renderFields()}
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {

  return bindActionCreators({
    enableCalendar: actions.enableCalendar,
    disableCalendar: actions.disableCalendar,
    setStartTime: actions.setStartTime,
    setEndTime: actions.setEndTime,
    setLocation: actions.setLocation,
    setSummary: actions.setSummary
  }, dispatch);
}

function mapStateToProps(state) {
  return { information: state.event.present.information };
}

export default connect(mapStateToProps, mapDispatchToProps)(CalendarForm);
