import React from 'react';
import ReactDOM from 'react-dom';

class Navbar extends React.Component {
  constructor() {
    super();
  }

  render() {
    return (
      <nav>
        <div className="area">BART</div>
        <div className="logo"></div>
        <div className="settings-icon-back">
          <i className="settings-icon fa fa-cog" aria-hidden="true"></i>
        </div>
      </nav>
    );
  }
}

export default Navbar;
