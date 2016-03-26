import React, { Component } from 'react';
import { connect } from 'react-redux';

import { EventStates } from '../../shared/enums';

import SaveEvent from '../components/save-event';
import PublishEvent from '../components/publish-event';
import UnpublishEvent from '../components/unpublish-event';

export default class EventMenu extends Component {

  renderPublishUnpublish() {
    if (this.props.event.state == EventStates.published) {
      return <UnpublishEvent event={this.props.event} />;
    }
    else {
      return <PublishEvent event={this.props.event} />;
    }
  }

  render() {

    return (
      <div className='actions'>
        <SaveEvent event={this.props.event} />
        {this.renderPublishUnpublish()}
      </div>
    );
  }
}

function mapStateToProps(state) {
  return { event: state.event };
}

export default connect(mapStateToProps)(EventMenu);
