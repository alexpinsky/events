import React, { Component } from 'react';
import { connect } from 'react-redux';

import EventWrapper from '../../wrappers/event-wrapper';

export default class EventViewer extends Component {

  componentDidMount() {
    if (this.props.onMount)
      this.props.onMount()
  }

  renderTemplate() {
    return new EventWrapper(this.props.event).template();
  }

  render() {

    return (
      <div className='view'>
        <div className="display">
          {this.renderTemplate()}
        </div>
      </div>
    );
  }
}

function mapStateToProps(state) {
  if (state.event.present) {
    return { event: state.event.present };
  }
  else {
    return { event: state.event };
  }
}

export default connect(mapStateToProps)(EventViewer);
