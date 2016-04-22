import React from 'react';
import { Route, IndexRoute } from 'react-router';

import App from './app-component';
import Editor from './editor/containers/editor';
import Dashboard from './dashboard/containers/dashboard';

export default (
  <Route path="/app" component={App}>
    <Route path="dashboard" component={Dashboard} />
    <Route path="editor" component={Editor} />
    <Route path="editor/:eventId" component={Editor} />
  </Route>
);
