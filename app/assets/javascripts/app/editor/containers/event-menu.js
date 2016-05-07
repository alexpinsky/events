import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import PublishButton from '../../shared/components/publish-button';
import { saveEvent, unpublishEvent, undo, redo } from '../../shared/actions/event-actions';
import { openPublishModal } from '../../shared/actions/modal-actions';


export default class EventMenu extends Component {

  constructor(props) {
    super(props);

    this.handleSaveClick      = this.handleSaveClick.bind(this);
    this.handlePublishClick   = this.handlePublishClick.bind(this);
    this.handleUnpublishClick = this.handleUnpublishClick.bind(this);
    this.handleUndoClick      = this.handleUndoClick.bind(this);
    this.handleRedoClick      = this.handleRedoClick.bind(this);
  }

  handleSaveClick(e) {
    this.props.saveEvent(this.props.event);
  }

  handlePublishClick(e) {
    this.props.openPublishModal(this.props.event)
  }

  handleUnpublishClick(e) {
    this.props.unpublishEvent(this.props.event);
  }

  handleUndoClick(e) {
    this.props.undo();
  }

  handleRedoClick(e) {
    this.props.redo();
  }

  render() {

    return (
      <div className='actions'>
        <div className='left-container'>
          <div className='undo-wrapper'>
            <a className="undo" onClick={this.handleUndoClick} />
            <div className='text'>UNDO</div>
          </div>
          <div className='redo-wrapper'>
            <a className="redo" onClick={this.handleRedoClick} />
            <div className='text'>REDO</div>
          </div>
        </div>
        <div className="right-container">
          <div className='save-wrapper'>
            <a className="save" onClick={this.handleSaveClick} />
            <div className='text'>SAVE</div>
          </div>
          <PublishButton event={this.props.event}
                         onPublishClick={this.handlePublishClick}
                         onUnpublishClick={this.handleUnpublishClick} />
        </div>
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({
    saveEvent,
    openPublishModal,
    unpublishEvent,
    undo,
    redo
  }, dispatch);
}

function mapStateToProps(state) {
  return { event: state.event.present };
}

export default connect(mapStateToProps, mapDispatchToProps)(EventMenu);
