var Pictures = React.createClass({
  propTypes: {
    pictures: React.PropTypes.object.isRequired,
    addPicture: React.PropTypes.func.isRequired,
    removePicture: React.PropTypes.func.isRequired
  },

  getInitialState() {
    return { progress: 0 }
  },

  componentWillMount() {
    this.init();
  },

  componentWillUnmount() {
    this._pictureService = null;
  },

  init() {
    this._pictureService = new PictureService;
  },

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
      var progress = Math.round((data.loaded * 100.0) / data.total);

      if (progress == 100) {
        setTimeout(function() {
          this.setState({progress: 0});
        }.bind(this), 3000);
      };

      this.setState({progress: progress});
    }.bind(this));
  },

  handleRemovePicture(args) {
    this.props.removePicture({order: args.order});
    this._pictureService.delete({url: args.url, id: args.id});
  },

  render() {
    var picturesSize = Object.keys(this.props.pictures).length;
    var pictures = [];
    for(index in this.props.pictures) {
      picture = this.props.pictures[index]
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
});
