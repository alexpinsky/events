import React from 'react';
import ReactDOM from 'react-dom';
import { Provider } from 'react-redux';
import { createStore } from 'redux';

import App from './components/app';
import Hello from './components/hello';
import reducers from './reducers';

// ReactDOM.render(
//   <Provider store={createStore(reducers)}>
//     <App />
//   </Provider>,
//   document.querySelector('#play')
// );

class ComponentMapper {

  static map(klass) {

    switch(klass) {
      case 'Hello':
        return Hello;
      default:
        return null;
    }
  }
}

ReactDOM.render(
  React.createElement(ComponentMapper.map('Hello'),{
    text: 'Alex Pinsky'
  }),
  document.querySelector('#play')
);

// const x = {};
// console.log('x: ', x);
// x.a = 1;
// console.log('x: ', x);

