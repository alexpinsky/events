import { _ } from 'lodash';

import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import EventTile from '../components/event-tile';
import AddEventTile from '../components/add-event-tile.js';
import PublishModal from '../../shared/containers/publish-modal';
import PublishedModal from '../../shared/containers/published-modal';
import {
  fetchEvents, saveEvent, openPublishModal, unpublishEvent
} from '../../shared/actions/event-actions';

export default class Dashboard extends Component {

  constructor(props) {
    super(props);

    this.handleNameSave       = this.handleNameSave.bind(this);
    this.handlePublishClick   = this.handlePublishClick.bind(this);
    this.handleUnpublishClick = this.handleUnpublishClick.bind(this);
  }

  componentWillMount() {
    this.props.fetchEvents();
  }

  handleNameSave(event, newName) {
    this.props.saveEvent(event, { name: newName });
  }

  handlePublishClick(event) {
    this.props.openPublishModal(event);
  }

  handleUnpublishClick(event) {
    this.props.unpublishEvent(event);
  }

  renderTiles() {

    if (!this.props.events)
      return null;

    return _.map(this.props.events, (event, id) => {
      return <EventTile key={id}
                        event={event}
                        onNameSave={this.handleNameSave}
                        onPublishClick={this.handlePublishClick}
                        onUnpublishClick={this.handleUnpublishClick} />
    });
  }

  render() {

    return (
      <div className='page-wrapper dashboard'>
        <div className='previews'>
          {this.renderTiles()}
          <AddEventTile />
        </div>
        <div className='modals'>
          <PublishModal />
          <PublishedModal />
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchEvents, saveEvent, openPublishModal, unpublishEvent }, dispatch);
}

function mapStateToProps(state) {
  return { events: state.events }
}

export default connect(mapStateToProps, mapDispatchToProps)(Dashboard);
