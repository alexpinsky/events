import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import config from '../../../config';
import EModal from '../components/emodal';
import { publishEvent } from '../actions/event-actions';
import { closePublishModal } from '../actions/modal-actions';

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
    this.props.publishEvent(this.props.modal.event, { url: $(this.urlInput).val() });
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
                 defaultValue={this.props.modal.event.url}
                 ref={(ref) => this.urlInput = ref } />
        </div>
        <div className='modal-actions'>
          <a className="publish" onClick={this.handlePublishEvent} />
          <a className="cancel" onClick={this.handleCancelClick} />
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
    modal: state.modals.publish_modal
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(PublishModal);
