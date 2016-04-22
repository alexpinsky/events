import React, { Component } from 'react';
import EventWrapper from '../../wrappers/event-wrapper';

export default class PublishButton extends Component {

  render() {

    const eventWrapper = new EventWrapper(this.props.event);

    if (eventWrapper.isPublished() || eventWrapper.isPending()) {

      return (
        <div className='unpublish-wrapper'>
          <a className="unpublish" href="#" onClick={this.props.handleUnpublishClick} />
          <div className='text'>UNPUBLISH</div>
        </div>
      );
    }
    else {

      return (
        <div className='publish-wrapper'>
          <a className="publish" href="#" onClick={this.props.handlePublishClick} />
          <div className='text'>PUBLISH</div>
        </div>
      );
    }
  }
}
