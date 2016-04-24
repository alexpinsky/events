import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import EModal from '../components/emodal';
import { closePublishedModal } from '../actions/event-actions';

export default class PublishedModal extends EModal {

  constructor(props) {
    super(props);

    this.handleDoneClick = this.handleDoneClick.bind(this);
  }

  handleDoneClick(e) {
    this.props.closePublishedModal();
  }

  renderSpecific() {

    return (
      <div id="event-published">
        <div className="modal-header">
          <b>Hey There!</b> Your event will be reviewed shortly.
        </div>
        <div className='modal-text'>
          We'll email you as soon as your event is approved with instructions on how to send it to the people who are important to you and regarding the payment method.
        </div>
        <div className='modal-actions'>
          <a className="done" onClick={this.handleDoneClick} />
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ closePublishedModal }, dispatch);
}

function mapStateToProps(state) {
  return {
    modal: state.modals.published_modal
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(PublishedModal);
