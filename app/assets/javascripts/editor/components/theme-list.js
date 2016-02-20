import React, { Component } from 'react';
import Theme from './theme';

export default class ThemeList extends Component {

  renderThemes() {
    return this.props.themes.map((theme) => {
      return <Theme key={theme.name} name={theme.name} thumbnail_url={theme.thumbnail_url} />
    });
  }

  render() {

    return (
      <div className='themes-wrapper'>
        <div className="themes" data-category={this.props.name}>
          {this.renderThemes()}
        </div>
      </div>
    );
  }
}
