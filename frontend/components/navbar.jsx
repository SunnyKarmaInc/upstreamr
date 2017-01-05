import React from 'react';
import ReactDOM from 'react-dom';

class Navbar extends React.Component {
  constructor(props) {
    super(props);
    console.log(props);
  }

  render() {
    return (
      <nav>
        <div className="area">BART</div>
        <div className="logo" onClick={this.props.backToInput}></div>
        <div className="settings-icon-back"></div>
      </nav>
    );
  }
}

// TODO Settings icon
// <div className="settings-icon-back">
//   <i className="settings-icon fa fa-cog" aria-hidden="true"></i>
// </div>

export default Navbar;
