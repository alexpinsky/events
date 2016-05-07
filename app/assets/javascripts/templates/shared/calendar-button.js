import React, { Component } from 'react';
import CalendarList from './calendar-list';

export default class CalendarButton extends Component {

  constructor(props) {
    super(props);

    this.state = { isOpen: false };

    this.handleOpenCloseClick = this.handleOpenCloseClick.bind(this);
  }

  handleOpenCloseClick() {
    this.setState({ isOpen: !this.state.isOpen });
  }

  renderCalendarList() {
    if (this.state.isOpen) {
      return <CalendarList
              information={this.props.information}
              handleOpenCloseClick={this.handleOpenCloseClick} />;
    }
    else {
      return null;
    }
  }

  render() {

    return (
      <div className="addtocalendar" onClick={this.handleOpenCloseClick}>
        <div className="icon"></div>
        <div className="text">Add to Calendar</div>
        {this.renderCalendarList()}
      </div>
    );
  }
}
