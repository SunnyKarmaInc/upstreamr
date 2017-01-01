import React from 'react';

class DirectRoute extends React.Component {
  constructor(props) {
    super(props);
    console.log(props);
  }

  render() {
    // Parse json for display
    let parsedEta;
    let timeType;
    const route = this.props.route;
    const final = route.finalEta.split(':');
    const finalHours = parseInt(final[0]);
    const finalInMin = (parseInt(final[0]) * 60) + parseInt(final[1]);

    const start = route.currentDeparture.split(':');
    const startInMin = (parseInt(start[0]) * 60) + parseInt(start[1]);

    const totalTime = finalInMin - startInMin;

    const color = route.downstreamColor;

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
        <div className='direct-route-schema'>
          <div className={`start-station-icon ${color}`}></div>
          <div className={`long-line ${color}`}></div>
          <div className={`arrow-dest-bottom ${color}`}></div>
          <div className={`dest-station-icon ${color}`}></div>
        </div>
        <div className='time-display'>
          <p className='time-label'>Travel downstream for</p>
          <p>
            <span className='time-num'>{totalTime}</span>
            <span className='time-type'>min</span>
          </p>
          <div className="person-icon">
            <div className='standing-person-icon'></div>
          </div>
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
