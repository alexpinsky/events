import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import { saveEvent, closeSaveModal } from '../actions/event-actions';

export default class SaveModal extends Component {

  constructor(props) {
    super(props);

    this.handleSaveClick   = this.handleSaveClick.bind(this);
    this.handleCancelClick = this.handleCancelClick.bind(this);
  }

  componentDidMount() {
    this.handleOpenClose();
  }

  componentDidUpdate(prevProps, prevState) {
    this.handleOpenClose();
  }

  handleOpenClose() {
    if (this.props.save_modal.open) {
      $(this.modal).modal({ clickClose: false, escapeClose: false });
    }
    else {
      $.modal.close();
    }
  }

  handleCancelClick(e) {
    this.props.closeSaveModal();
  }

  handleSaveClick(e) {
    this.props.saveEvent(this.props.event, { name: $(this.nameInput).val() });
  }

  render() {

    return (
      <div id="save-event" className="modal" ref={(ref) => this.modal = ref } >
        <div className='modal-logo'></div>
        <a href="#close-modal" rel="modal:close" className="close-modal" />
        <div className="modal-header">ALRIGHT, LET'S NAME YOUR EVENT!</div>
        <input className="input-style"
               type="text"
               name="event-name"
               placeholder="type the event name here"
               ref={(ref) => this.nameInput = ref } />
        <div className='modal-actions'>
          <a href="#" className="save" onClick={this.handleSaveClick} />
          <a href="#" className="cancel" onClick={this.handleCancelClick} />
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
    event: state.event,
    save_modal: state.modals.save_modal
  };
}

export default connect(mapStateToProps, mapDispatchToProps)(SaveModal);
