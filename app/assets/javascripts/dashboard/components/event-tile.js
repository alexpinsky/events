import React, { Component } from 'react';

import NameEdit from './name-edit';

export default class EventTile extends Component {

  previewStyle() {
    let imageUrl = '';

    if (this.props.event.pictures.size > 0)
      imageUrl = this.props.event.pictures[0].url;

    return {
      background: `url(${imageUrl}) no-repeat`,
      backgroundSize: 'cover'
    };
  }

  render() {

    return (
      <div className='tile'>
        <div className='tile-header'>
          <NameEdit />
        </div>
        <div className='url-wrapper'>
          <div className='btn-wrapper'>
            <div className='copy-icon' />
          </div>
          <input type="text" value={this.props.event.url} />
        </div>
        <div className='image-wrapper'>
          <div className='image' style={this.previewStyle()} >
            <div className='menu-wrapper'>
              <div className='buttons'>
                <a className="preview" title="preview" target="_blank" href="#" />
                <a className="edit" title="edit" href="#" />
              </div>
              <div className='info'>
                <div className='theme-name'>
                  template: {`"${this.props.template.name}"`}
                </div>
                <div className='date'>
                  created at: {this.props.event.created_at}
                </div>
              </div>
            </div>
          </div>
        </div>
        <div className='analytics'>
          <div className='views'>
            <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/dashboard/view_icon.svg" />
            <div className='text'>{this.props.event.views_count}</div>
          </div>
        </div>
        <div className='tile-footer'>
          <div className="info">
            <div className='time'>
              <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/dashboard/ time_icon.svg" />
              <div className='text'>{this.props.event.information.start_time}</div>
            </div>
            <div className='place'>
              <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/pages/dashboard/ place_icon.svg" />
              <div className='text'>{this.props.event.information.location}</div>
            </div>
          </div>
          <div className="actions">
              <PublishButton event={this.props.event}
                             onPublishClick={this.handlePublishClick}
                             onUnpublishClick={this.handleUnpublishClick} />
              <div className='delete-wrapper'>
                <a className="delete" href="<%= event_path event %>" data-method="delete" data-confirm="Are you sure?"></a>
                <div className='text'>DELETE</div>
              </div>
          </div>
        </div>
      </div>
    );
  }
}
