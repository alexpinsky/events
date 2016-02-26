import React, { Component } from 'react';
import { connect } from 'react-redux';

import { mapEventToTemplate } from '../../services/template-mapper';

export default class EventViewer extends Component {

  renderTemplate() {
    return mapEventToTemplate(this.props.event);
  }

  render() {

    return (
      <div>
        <div className='frame-1'></div>
          <div className='preview'>
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