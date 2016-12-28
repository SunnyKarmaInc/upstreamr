import React from 'react';
import ReactDOM from 'react-dom';
import Navbar from './components/navbar';
import ChooseDirectionsForm from './components/chooseDirections';


class Upstreamr extends React.Component {
  constructor() {
    super();
  }

  render() {
    return (
      <div>
        <Navbar />
        <ChooseDirectionsForm />
      </div>

    );
  }
}

export default Upstreamr;
