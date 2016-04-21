import React, { Component } from 'react';

import TilePlaceholder from '../components/tile-placeholder.js';

export default class Dashboard extends Component {

  render() {

    return (
      <div className='page-wrapper dashboard'>
        <div className='previews'>
          <TilePlaceholder />
        </div>
      </div>
    );
  }
}
