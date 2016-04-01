import React from 'react';
import { Route, IndexRoute } from 'react-router';

import App from './components/app';
import Editor from './editor/containers/editor';

export default (
  <Route path="/app" component={App}>
    <Route path="editor" component={Editor} />
    <Route path="editor/:eventId" component={Editor} />
  </Route>
);
