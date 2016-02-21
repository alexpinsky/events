import React, { Component } from 'react';
import Theme from './theme';

export default class ThemeList extends Component {
  constructor(props) {
    super(props);

    this.handleClick = this.handleClick.bind(this);
  }

  shouldComponentUpdate(nextProps, nextState) {
    return false;
  }

  handleClick(themeName) {
    this.props.onThemeClick(themeName);
  }

  renderContent() {
    if (this.props.themes === undefined) {
      return this.renderPlaceHolder();
    }
    else {
      return this.renderThemes();
    }
  }

  renderPlaceHolder() {
    return (
      <div
        className={`coming-soon ${this.props.name}`}
        data-category={this.props.name.toUpperCase()} >
        <div className="category-text">COMING SOON</div>
      </div>
    );
  }

  renderThemes() {
    const themes = this.props.themes.map((theme) => {
      return <Theme
              key={theme.name}
              name={theme.name}
              thumbnail_url={theme.thumbnail_url}
              onClick={this.handleClick} />
    });

    return (
      <div className="themes" data-category={this.props.name}>
        {themes}
      </div>
    );
  }

  render() {

    return (
      <div className='themes-wrapper'>
        {this.renderContent()}
      </div>
    );
  }
}
