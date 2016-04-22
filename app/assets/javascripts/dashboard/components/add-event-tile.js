import React, { Component } from 'react';
import { Link } from 'react-router';

export default class NewEventTile extends Component {

  render() {

    return (
      <div className='tile placeholder'>
        <div className='tile-header'>
          <div className='name-wrapper'>
            <div className='name vertical-align'>
              MY NEW EVENT
            </div>
          </div>
        </div>
        <div className='tile-body'>
          <div className='new-event-wrapper'>
            <Link to='/app/editor/' className="new-event" />
            <div className='text'>NEW EVENT</div>
          </div>
        </div>
      </div>
    );
  }
}
