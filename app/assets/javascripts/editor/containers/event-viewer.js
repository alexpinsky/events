import React, { Component } from 'react';
import { connect } from 'react-redux';

import { mapEventToTemplate } from '../../services/template-mapper';

export default class EventViewer extends Component {

  renderTemplate() {
    return mapEventToTemplate(this.props.event);
  }

  backgroundStyle() {
    const background_url = this.props.event.appearance.background_url;
    let background = null;

    if (background_url !== undefined && background_url != null) {
      background = `url(${background_url})`;
    }
    else {
      background = 'white';
    }

    return { background: background };
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