var FontPicker = React.createClass({

  getDefaultProps() {
    return {
      fonts: [
        { name:'Lobster',      value: "'Lobster', cursive" },
        { name:'Quattrocento', value: "'Quattrocento Sans', sans-serif" },
        { name:'Vibur',        value: "'Vibur', cursive" },
        { name:'Fanwood Text', value: "'Fanwood Text', serif" },
        { name:'Six Caps',     value: "'Six Caps', sans-serif" },
        { name:'Rozha',        value: "'Rozha One', serif" },
        { name:'Julius',       value: "'Julius Sans One', sans-serif" },
        { name:'Narkis Block', value: "'narkis_block'" }
      ]
    }
  },

  getInitialState() {
    return { isOpen: false, font: this.props.initialFont }
  },

  render() {
    var fontsList;
    if (this.state.isOpen) {
      fonts = [];
      fontsList = <FontsList fonts={fonts} />;
    }
    else {
      fontsList = null;
    };

    return (
      <div className="font-family">
        <div className="prefix" data-context={this.props.count}>FONT</div>
        <div className="selected-font">{this.state.font.name}<div className="carrot-icon" /></div>
        {fontsList}
        <input
          id={`event_appearance_attributes_font_family_${this.props.count}`}
          name={`event[appearance_attributes][font_family_${this.props.count}]`}
          value={this.state.font.value}
          type='hidden' />
      </div>
    )
  }
});
