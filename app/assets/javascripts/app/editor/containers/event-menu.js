import React, { Component } from 'react';
import { bindActionCreators } from 'redux';
import { connect } from 'react-redux';

import PublishButton from '../../shared/components/publish-button';
import { saveEvent, unpublishEvent } from '../../shared/actions/event-actions';
import { openPublishModal } from '../../shared/actions/modal-actions';


export default class EventMenu extends Component {

  constructor(props) {
    super(props);

    this.handleSaveClick      = this.handleSaveClick.bind(this);
    this.handlePublishClick   = this.handlePublishClick.bind(this);
    this.handleUnpublishClick = this.handleUnpublishClick.bind(this);
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

  render() {

    return (
      <div className='actions'>
        <div className='save-wrapper'>
          <a className="save" href='#' onClick={this.handleSaveClick} />
          <div className='text'>SAVE</div>
        </div>
        <PublishButton event={this.props.event}
                       onPublishClick={this.handlePublishClick}
                       onUnpublishClick={this.handleUnpublishClick} />
      </div>
    );
  }
}

function mapDispatchToProps(dispatch) {
  return bindActionCreators({ saveEvent, openPublishModal, unpublishEvent }, dispatch);
}

function mapStateToProps(state) {
  return { event: state.event.present };
}

export default connect(mapStateToProps, mapDispatchToProps)(EventMenu);
