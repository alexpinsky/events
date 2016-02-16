import React, { Component } from 'react';
import Picture from './picture'
import ProgressBar from './progress-bar'

export default class Pictures extends Component {

  constructor(props) {
    super(props);

    this.handleAddPicture    = this.handleAddPicture.bind(this);
    this.handleRemovePicture = this.handleRemovePicture.bind(this);

    this.state = { progress: 0 };
  }

  componentWillMount() {
    this._pictureService = new PictureService;
  }

  componentWillUnmount() {
    this._pictureService = null;
  }

  handleAddPicture(args) {
    if (this.state.progress > 0) { return false };

    return this._pictureService.upload()
      .then(function(url) {
        // resolve
        this.props.addPicture({order: args.order, url: url});
        return url;
      }.bind(this),
      function(data) {
        // reject
        console.log('pictures-error:');
        console.log(data);
      },
      function(data) {
        // progress
        let progress = Math.round((data.loaded * 100.0) / data.total);

        if (progress == 100) {
          setTimeout(function() {
            this.setState({progress: 0});
          }.bind(this), 3000);
        };

        this.setState({progress: progress});
      }.bind(this));
  }

  handleRemovePicture(args) {
    this.props.removePicture({order: args.order});
    this._pictureService.delete({url: args.url, id: args.id});
  }

  render() {
    let picturesSize = Object.keys(this.props.pictures).length;
    let pictures = [];
    for(let index in this.props.pictures) {
      let picture = this.props.pictures[index]
      pictures.push(
        <Picture
          key={index}
          id={picture.id}
          initialUrl={picture.url}
          order={picture.order}
          isLast={index == picturesSize}
          addPicture={this.handleAddPicture}
          removePicture={this.handleRemovePicture} />
      );
    }

    return (
      <div>
        <div className='pics-tagline'>
          <div className='pics-icon' />
          <div className='pics-text'>upload up to 4 photos</div>
        </div>
        <div className='pics-tiles'>
          {pictures}
        </div>
        <ProgressBar progress={this.state.progress}/>
      </div>
    )
  }
}

Pictures.propTypes = {
  pictures: React.PropTypes.object.isRequired,
  addPicture: React.PropTypes.func.isRequired,
  removePicture: React.PropTypes.func.isRequired
}
