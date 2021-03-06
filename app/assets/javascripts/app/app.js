import React from 'react';
import { Component } from 'react';

import NotificationList from './shared/containers/notification-list';

export default class App extends Component {

  render() {

    return (
      <div>
        <NotificationList />
        {this.props.children}
      </div>
    );
  }
}
