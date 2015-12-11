var Pictures = React.createClass({
  propTypes: {
    pictures: React.PropTypes.array.isRequired,
    addPicture: React.PropTypes.func.isRequired,
    removePicture: React.PropTypes.func.isRequired
  },

  componentWillUnmount() {
  },

  handleAddPicture(args) {
    var url = 'https://events-assets-users.s3.amazonaws.com/uploads/development/picture/image/27/image_2.jpg';
    this.props.addPicture({order: args.order, url: url});
    return url;
  },

  handleRemovePicture(args) {
    this.props.removePicture({order: args.order});
  },

  render() {
    var picturesSize = this.props.pictures.length;
    var pictures = this.props.pictures.map(function(picture, index) {
      return (
        <Picture
          key={index}
          initialUrl={picture.url}
          order={picture.order}
          isLast={index == picturesSize - 1}
          addPicture={this.handleAddPicture}
          removePicture={this.handleRemovePicture} />
      )
    }.bind(this));
    return (
      <div>
        <div className='pics-tagline'>
          <div className='pics-icon' />
          <div className='pics-text'>upload up to 4 photos</div>
        </div>
        <div className='pics-tiles'>
          {pictures}
        </div>
      </div>
    )
  }
});
