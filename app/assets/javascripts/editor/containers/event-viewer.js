import React, { Component } from 'react';

export default class EventViewer extends Component {

  render() {

    return (
      <div>
        <div className='frame-1'></div>
          <div className='preview'>
            <div className="display">

            </div>
          </div>
        <div className='frame-2'></div>
        <div className='frame-3'></div>
      </div>
    );
  }
}
