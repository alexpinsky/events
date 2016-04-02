import React, { Component } from 'react';

export default class ColorPicker extends Component {
  constructor(props) {
    super(props);

    this.handleColorChange = this.handleColorChange.bind(this);
  }

  componentDidMount() {
    $(this.input).minicolors({
      defaultValue: '#000000',
      change: this.handleColorChange
    });
  }

  componentWillUnmount() {
    $(this.input).minicolors('destroy');
  }

   handleColorChange(hex, opacity) {
    this.props.onChange(hex);
   }

  render() {

    return (
      <input className='minicolors'
             value={this.props.color}
             ref={(ref) => this.input = ref}
             onChange={(e) => {}} />
    );
  }
}
