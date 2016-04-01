import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { saveEvent } from '../actions/event-actions';
import EventWrapper from '../../wrappers/event-wrapper';

export default class EventMenu extends Component {

  constructor(props) {
    super(props);

    this.handleSaveClick = this.handleSaveClick.bind(this);
  }

  handleSaveClick(e) {
    this.props.saveEvent(this.props.event);
  }

  renderPublishUnpublish() {
    const eventWrapper = new EventWrapper(this.props.event);

    if (eventWrapper.isPublished()) {

      return (
        <div className='unpublish-wrapper'>
          <a className="unpublish menu-action" href="#"></a>
          <div className='text'>UNPUBLISH</div>
        </div>
      );
    }
    else {

      return (
        <div className='publish-wrapper'>
          <a className="publish menu-action" href="#"></a>
          <div className='text'>PUBLISH</div>
        </div>
      );
    }
  }

  render() {

    return (
      <div className='actions'>
        <div className='save-wrapper'>
          <a className="save menu-action" href='#' onClick={this.handleSaveClick} />
          <div className='text'>SAVE</div>
        </div>
        {this.renderPublishUnpublish()}
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ saveEvent }, dispatch);
}

function mapStateToProps(state) {
  return { event: state.event };
}

export default connect(mapStateToProps, mapDispatchToProps)(EventMenu);
