import React, { Component } from 'react';

export default class Spinner extends Component {

  render() {

    return (
      <div className='spinner-container'>
        <img src="https://s3-eu-west-1.amazonaws.com/events-assets-static/shared/loading.gif" />
      </div>
    );
  }
}
