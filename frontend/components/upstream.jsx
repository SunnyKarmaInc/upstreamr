import React from 'react';

class Upstream extends React.Component {
  constructor(props) {
    super(props);
  }

  render() {
    const route = this.props.route;

    if (typeof route === 'string') {
      return <div className="no-result">{route}</div>;
    }

    let parsedEta;
    let timeType;
    const final = route.finalEta.split(':');
    const finalHours = parseInt(final[0]);
    const finalInMin = (parseInt(final[0]) * 60) + parseInt(final[1]);

    const start = route.transferDeparture.split(':');
    const startInMin = (parseInt(start[0]) * 60) + parseInt(start[1]);

    const totalTime = finalInMin - startInMin;

    if (finalHours > 12) {
      parsedEta = `${finalHours - 12}:${final[1]}`;
      timeType = 'pm';
    } else {
      parsedEta = `${finalHours}:${final[1]}`;
      timeType = 'am';
    }
    console.log(route);
    return (
      <div className='results-box'>
        <div className='start-end-labels'>
          <p className='upstream-transfer'>{route.transfer}</p>
          <p className='upstream-start'>{this.props.start}</p>
          <p className='upstream-dest'>{this.props.dest}</p>
        </div>
        <div className='upstream-route-schema'>
          <div className={`start-station-icon ${route.upstreamColor}`}></div>
          <div className={`transfer-station-icon ${route.upstreamColor}`}></div>
          <div className={`dest-station-icon ${route.downstreamColor}`}></div>
          <div className={`start-dest-line LIGHT-GREY`}></div>
          <div className={`start-transfer-line ${route.upstreamColor}`}></div>
          <div className={`transfer-dest-line ${route.downstreamColor}`}></div>
          <div className={`start-transfer-arrow ${route.upstreamColor}`}></div>
          <div className={`transfer-dest-arrow ${route.downstreamColor}`}></div>
        </div>
        <div className='time-display'>
          <p className='time-label'>Travel downstream for</p>
          <p>
            <span className='time-num'>{totalTime}</span>
            <span className='time-type'>min</span>
          </p>
          <div className='person-icon'>
            <div className='sitting-person-icon'></div>
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

export default Upstream;
