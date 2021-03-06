import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import EModal from '../../shared/components/emodal';
import { saveEvent } from '../../shared/actions/event-actions';
import { closeSaveModal } from '../../shared/actions/modal-actions';

export default class SaveModal extends EModal {

  constructor(props) {
    super(props);

    this.handleSaveClick   = this.handleSaveClick.bind(this);
    this.handleCancelClick = this.handleCancelClick.bind(this);
  }

  handleCloseClick(e) {
    this.props.closeSaveModal();
  }

  handleCancelClick(e) {
    this.props.closeSaveModal();
  }

  handleSaveClick(e) {
    this.props.saveEvent(this.props.modal.event, { name: $(this.nameInput).val() });
  }

  renderSpecific() {

    return (
      <div id="save-event">
        <div className="modal-header">ALRIGHT, LET'S NAME YOUR EVENT!</div>
        <input className="input-style"
               type="text"
               name="event-name"
               placeholder="type the event name here"
               ref={(ref) => this.nameInput = ref } />
        <div className='modal-actions'>
          <a className="save" onClick={this.handleSaveClick} />
          <a className="cancel" onClick={this.handleCancelClick} />
        </div>
        <div className='modal-text'>
          Don't worry! Saving your event does not mean the event will be public.
          No one will be able to see your event until you decide to publish it.
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ saveEvent, closeSaveModal }, dispatch);
}

function mapStateToProps(state) {
  return {
    modal: state.modals.save_modal
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(SaveModal);
