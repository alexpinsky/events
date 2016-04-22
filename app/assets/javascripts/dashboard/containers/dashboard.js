import { _ } from 'lodash';

import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import EventTile from '../components/event-tile';
import AddEventTile from '../components/add-event-tile.js';
import { fetchEvents, saveEvent } from '../../shared/actions/event-actions';

export default class Dashboard extends Component {

  constructor(props) {
    super(props);

    this.handleNameSave = this.handleNameSave.bind(this);
    this.handleUrlSave  = this.handleUrlSave.bind(this);
  }

  componentWillMount() {
    this.props.fetchEvents();
  }

  handleNameSave(event, newName) {
    this.props.saveEvent(event, { name: newName });
  }

  renderTiles() {

    if (!this.props.events)
      return null;

    return _.map(this.props.events, (event, id) => {
      <EventTile key={id}
                 event={event}
                 onNameSave={this.handleNameSave} />
    });
  }

  render() {

    return (
      <div className='page-wrapper dashboard'>
        <div className='previews'>
          {this.renderTiles()}
          <AddEventTile />
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchEvents, saveEvent }, dispatch);
}

function mapStateToProps(state) {
  return { events: state.events }
}

export default connect(mapStateToProps, mapDispatchToProps)(Dashboard);
