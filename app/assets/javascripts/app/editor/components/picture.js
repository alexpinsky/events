import React, { Component } from 'react';

export default class Picture extends Component {

  constructor(props) {
    super(props);

    this.handleAddPicture    = this.handleAddPicture.bind(this);
    this.handleRemovePicture = this.handleRemovePicture.bind(this);
  }

  shouldComponentUpdate(nextProps, nextState) {
    return this.props.url !== nextProps.url;
  }

  handleAddPicture(e) {
    this.props.addPicture({ index: this.props.index });
  }

  handleRemovePicture(e) {
    this.props.removePicture({ index: this.props.index, url: this.props.url })
  }

  imageTile() {
    var divStyle = { backgroundImage: 'url(' + this.props.url + ')' };
    return (
      <div className='pic-tile image' style={divStyle} >
        <div className="remove" onClick={this.handleRemovePicture} />
      </div>
    )
  }

  emptyTile() {
    return (
      <div className='pic-tile empty'>
        <div className="add" onClick={this.handleAddPicture} />
      </div>
    )
  }

  isUrlPresent() {
    return this.props.url != null && this.props.url != '';
  }

  marginClass() {
    return this.props.isLast ? '' : ' needs-space';
  }

  render() {

    return (
      <div className='pic-fields'>
        <div className={'tile-wrapper' + this.marginClass()} >
          {this.isUrlPresent() ? this.imageTile() : this.emptyTile()}
        </div>
      </div>
    )
  }
}
