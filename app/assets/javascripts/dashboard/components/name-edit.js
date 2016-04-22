import React, { Component } from 'react';

export default class NameEdit extends Component {

  render() {

    return (
      <div className='name-wrapper name-editor'>
        <div className='name vertical-align'>
          <div className='edit-icon'></div>
          <a href="#" className="event-name" data-type="text" data-url="<%= event_path(event) %>" data-pk="<%= event.id %>"><%= event.name %></a>
        </div>
      </div>
    );
  }
}
