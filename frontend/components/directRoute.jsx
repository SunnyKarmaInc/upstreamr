import React from 'react';

class DirectRoute extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    let parsedEta;
    let timeType;
    const fastest = this.props.options.fastest;
    const final = fastest.finalEta.split(':');
    const finalHours = parseInt(final[0]);
    const finalInMin = (parseInt(final[0]) * 60) + parseInt(final[1]);

    const start = fastest.currentDeparture.split(':');
    const startInMin = (parseInt(start[0]) * 60) + parseInt(start[1]);

    const totalTime = finalInMin - startInMin;

    if (finalHours > 12) {
      parsedEta = `${finalHours - 12}:${final[1]}`;
      timeType = 'pm';
    } else {
      parsedEta = `${finalHours}:${final[1]}`;
      timeType = 'am';
    }

    return (
      <div className='results-box'>
        <div className='start-end-labels'>
          <p className='start'>{this.props.start}</p>
          <p className='dest'>{this.props.dest}</p>
        </div>
        <div className='time-display'>
          <p className='time-label'>Travel downstream for</p>
          <p>
            <span className='time-num'>{totalTime}</span>
            <span className='time-type'>min</span>
          </p>
          <div className='person-icon'></div>
          <p className='time-label'>DestinationETA</p>
          <p>
            <span className='time-num'>{parsedEta}</span>
            <span className='time-type'>{timeType}</span>
          </p>
        </div>
      </div>

    );
  }
}

export default DirectRoute;
