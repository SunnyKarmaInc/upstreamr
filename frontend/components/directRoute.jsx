import React from 'react';

class DirectRoute extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const downTime = this.props.downstream.split(' ');
    const downTimeNum = downTime[0];
    const downTimeType = downTime[1];

    const eta = this.props.eta.split(' ');
    const etaNum = eta[0];
    const etaType = eta[1];

    return (
      <div className='results-box'>
        <div>
          <p className='start'>{this.props.start}</p>
          <p className='dest'>{this.props.dest}</p>
        </div>
        <div>
          <p className='time-label'>Travel downstream for</p>
          <p>
            <span className='time-num'>{downTimeNum}</span>
            <span className='time-type'>{downTimeType}</span>
          </p>
          <p className='time-label'>DestinationETA</p>
          <p>
            <span className='time-num'>{etaNum}</span>
            <span className='time-type'>{etaType}</span>
          </p>
        </div>
      </div>

    );
  }
}

export default DirectRoute;
