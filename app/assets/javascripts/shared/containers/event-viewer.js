import React, { Component } from 'react';
import { connect } from 'react-redux';

import EventWrapper from '../../wrappers/event-wrapper';
import { BackgroundTypes } from '../../enums';

export default class EventViewer extends Component {

  renderTemplate() {
    return new EventWrapper(this.props.event).template();
  }

  backgroundStyle() {
    const background = this.props.event.appearance.background;

    let bgVal = null;

    if (background.type == BackgroundTypes.image) {
      bgVal = `url(${background.url})`;
    }
    else {
      bgVal = background.color;
    }

    return { background: bgVal };
  }

  render() {

    return (
      <div className='preview' style={this.backgroundStyle()}>
        <div className="display">
          {this.renderTemplate()}
        </div>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return { event: state.event };
}

export default connect(mapStateToProps)(EventViewer);
