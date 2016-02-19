import React, { Component } from 'react';
import SaveEvent from '../containers/save-event';
import PublishEvent from '../containers/publish-event';
import UnpublishEvent from '../containers/unpublish-event';

export default class EventMenu extends Component {

  render() {

    return (
      <div className='actions'>
        <SaveEvent />
        <PublishEvent />
        <UnpublishEvent />
      </div>
    );
  }
}
