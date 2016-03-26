import React, { Component } from 'react';
import { connect } from 'react-redux';

import { mapEventToTemplate } from '../../services/template-mapper';
import { BackgroundTypes } from '../../shared/enums';

export default class EventViewer extends Component {

  renderTemplate() {
    return mapEventToTemplate(this.props.event);
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
      <div>
        <div className='frame-1'></div>
          <div className='preview' style={this.backgroundStyle()}>
            <div className="display">
              {this.renderTemplate()}
            </div>
          </div>
        <div className='frame-2'></div>
        <div className='frame-3'></div>
      </div>
    );
  }
}

function mapStateToProps(state) {
  return { event: state.event };
}

export default connect(mapStateToProps)(EventViewer);