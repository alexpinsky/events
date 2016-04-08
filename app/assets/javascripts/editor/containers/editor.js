import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { fetchEvent } from '../actions/event-actions';
import EventMenu from '../containers/event-menu';
import EventForm from '../components/event-form';
import EventViewer from '../containers/event-viewer';
import SaveModal from '../containers/save-modal';
import SavedModal from '../containers/saved-modal';
import Spinner from '../../shared/components/spinner';

import EventWrapper from '../../wrappers/event-wrapper';

export default class Editor extends Component {

  shouldComponentUpdate(nextProps, nextState) {
    return this.props.event.id != nextProps.event.id;
  }

  componentWillMount() {
    if (this.isEdit())
      this.props.fetchEvent(this.props.params.eventId);
  }

  isEdit() {
    return this.props.params.eventId != null;
  }

  isFetching() {
    const eventWrapper = new EventWrapper(this.props.event);
    return eventWrapper.isNew() && this.isEdit();
  }

  renderViewer() {
    if (this.isFetching()) {
      return <Spinner />
    }
    else {
      return <EventViewer />
    }
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
              <div className='frame-1'></div>
              {this.renderViewer()}
              <div className='frame-2'></div>
              <div className='frame-3'></div>
            </div>
          </div>
          <div className='modals'>
            <SaveModal />
            <SavedModal />
          </div>
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ fetchEvent }, dispatch);
}

function mapStateToProps(state) {
  return { event: state.event }
}

export default connect(mapStateToProps, mapDispatchToProps)(Editor);
