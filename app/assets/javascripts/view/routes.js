import React from 'react';
import { Route, IndexRoute } from 'react-router';
import App from './app';

export default (
  <Route path="/:eventId" component={App}/>
);
