import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from './components/navbar';
import ChooseDirectionsForm from './components/chooseDirections';
import Results from './components/results';


class Upstreamr extends React.Component {
  constructor() {
    super();

    this.state = { input: false };
  }

  displayResults(results) {
    this.setState({ input: true, results });
  }

  backToInput () {
    this.setState({ input: false });
  }

  render() {
    if (this.state.input === false) {
      return (
        <div>
          <Navbar backToInput={this.backToInput.bind(this)}/>
          <ChooseDirectionsForm displayResults={this.displayResults.bind(this)}/>
        </div>);
    } else {
      return (
        <div>
          <Navbar backToInput={this.backToInput.bind(this)} />
          <Results results={this.state.results}/>
        </div>);
    }
  }
}

export default Upstreamr;
