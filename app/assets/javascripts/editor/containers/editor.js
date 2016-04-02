import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchEvent } from '../actions/event-actions';
import EventMenu from '../containers/event-menu';
import EventForm from '../components/event-form';
import EventViewer from '../containers/event-viewer';
import SaveModal from '../containers/save-modal';

export default class Editor extends Component {

  shouldComponentUpdate(nextProps, nextState) {
    return true;
  }

  componentWillMount() {
    this.props.fetchEvent(this.props.params.eventId);
  }

  render() {

    return (
      <div className='page-wrapper editor'>
        <div className='page-container'>
          <div className='top'>
            <div className='borderholder-1'></div>
              <EventMenu />
            <div className='borderholder-2'></div>
          </div>
          <div className='body'>
            <div className='form-wrapper'>
              <EventForm />
            </div>
            <div className='preview-wrapper'>
              <EventViewer />
            </div>
          </div>
          <div className='modals'>
            <SaveModal />
          </div>
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchEvent }, dispatch);
}

export default connect(null, mapDispatchToProps)(Editor);
