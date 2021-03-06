import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import EventMenu from '../containers/event-menu';
import EventForm from '../components/event-form';
import SaveModal from '../containers/save-modal';
import SavedModal from '../containers/saved-modal';
import PublishModal from '../../shared/containers/publish-modal';
import PublishedModal from '../../shared/containers/published-modal';

import Spinner from '../../../shared/components/spinner';
import EventViewer from '../../../shared/containers/event-viewer';

import { fetchEvent } from '../../shared/actions/event-actions';
import EventWrapper from '../../../wrappers/event-wrapper';
import { BackgroundTypes } from '../../../enums';

export default class Editor extends Component {

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

  inlineStyle() {
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

  renderViewer() {
    if (this.isFetching()) {
      return <Spinner />
    }
    else {
      return (
        <div className='view-container' style={this.inlineStyle()}>
          <EventViewer />
        </div>
      );
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
            <PublishModal />
            <PublishedModal />
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
  return { event: state.event.present }
}

export default connect(mapStateToProps, mapDispatchToProps)(Editor);
