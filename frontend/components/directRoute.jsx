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
    let labelClass;
    let personIcon;

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

    if (route.chanceOfSeat === 'Most likely' ||
        route.chanceOfSeat === 'Likely') {
      labelClass = 'likely';
      personIcon = 'sitting-person-icon';

    } else {
      labelClass = 'unlikely';
      personIcon = 'standing-person-icon';
    }

    return (
      <div>
        <div className="result-labels">
          <span className={labelClass}>{route.chanceOfSeat} get a seat</span>
          <span className='result-type'>{route.status}</span>
        </div>
        <div className='results-box'>
          <div className='start-end-labels'>
            <p className='start'>{this.props.start}
              <span className='wait-time'>
                <i className="wait-time-icon"></i>
                <span>{route.waitTime}min</span>
              </span>
            </p>
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
              <div className={personIcon}></div>
            </div>
            <p className='time-label'>Destination ETA</p>
            <p>
              <span className='time-num'>{parsedEta}</span>
              <span className='time-type'>{timeType}</span>
            </p>
          </div>
        </div>
      </div>
    );
  }
}

export default DirectRoute;
