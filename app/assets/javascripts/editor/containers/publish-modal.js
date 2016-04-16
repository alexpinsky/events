import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import EModal from '../../components/emodal';
import config from '../../config';
import { closePublishModal, publishEvent } from '../actions/event-actions';

export default class PublishModal extends EModal {

  constructor(props) {
    super(props);

    this.handleCancelClick  = this.handleCancelClick.bind(this);
    this.handlePublishEvent = this.handlePublishEvent.bind(this);
  }

  handleCloseClick(e) {
    this.props.closePublishModal();
  }

  handleCancelClick(e) {
    this.props.closePublishModal();
  }

  handlePublishEvent(e) {
    this.props.publishEvent(this.props.event, { url: $(this.urlInput).val() });
  }

  renderSpecific() {

    return (
      <div id="publish-event" >
        <div className="modal-header">
          <b>
            NOW THIS IS EXCITING, WE'RE ABOUT TO<br/>MAKE YOUR EVENT PUBLIC!
          </b>
           CHOOSE A<br/>UNIQUE URL FOR YOUR EVENT:
        </div>
        <div className='url-wrapper'>
          <div className='input-style'>{config.rootUrl}</div>
          <input className="input-style"
                 type="text"
                 name="event-url"
                 defaultValue={this.props.event.url}
                 ref={(ref) => this.urlInput = ref } />
        </div>
        <div className='modal-actions'>
          <a href="#" className="publish" onClick={this.handlePublishEvent} />
          <a href="#" className="cancel" onClick={this.handleCancelClick} />
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closePublishModal, publishEvent }, dispatch);
}

function mapStateToProps(state) {
  return {
    event: state.event,
    open: state.modals.publish_modal.open
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(PublishModal);
