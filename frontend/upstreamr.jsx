import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from './components/navbar';
import ChooseDirectionsForm from './components/chooseDirections';
import Results from './components/results';


class Upstreamr extends React.Component {
  constructor() {
    super();

    this.state = { input: true };
  }

  render() {
    if (this.state.input === false) {
      return (
        <div>
          <Navbar />
          <ChooseDirectionsForm />
        </div>);
    } else {
      return (
        <div>
          <Navbar />
          <Results />
        </div>);
    }
  }
}

export default Upstreamr;
